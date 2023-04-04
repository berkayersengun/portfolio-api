import datetime
import json
from _decimal import Decimal
from copy import copy

from django.http import Http404
from rest_framework import status
from rest_framework.response import Response

from holdings.constanst import DATE_FORMAT
from holdings.dataclasses import Overview, Portfolio
from holdings.serializers import PortfolioSnapshotSerializer
from holdings.utils import is_friday


def add_value(history_list):
    # history_date = datetime.datetime.strptime(history_list[0]['date'], DATA_FORMAT)  # 2022
    # purchase_date = datetime.datetime.strptime(history_list[1]['purchase_date'], DATA_FORMAT)  # 2023
    # if history_date > purchase_date:
    #     history_list[0]['value'] = float(history_list[1]['quantity']) * history_list[0]['price']

    # quantity = sum(holding['quantity'] for holding in history_list[1]['holdings'])
    history_list[0]['value'] = history_list[1] * history_list[0]['price']
    return history_list[0]


def get_filter_params(range_query):
    if range_query is None:
        range_query = '1d'
    valid_ranges = [
        "1d",
        "1w",
        "1m",
        "6m",
        "ytd",
        "1y",
        "5y",
        "max"
    ]
    if range_query not in valid_ranges:
        raise Http404(f"'{range_query}' is not a valid range: Valid ranges: {valid_ranges}")

    match range_query:
        case '1w':
            days = 7
        case '1m':
            days = 30
        case '6m':
            days = 30 * 6
        case '1y':
            days = 365
        case '5y':
            days = 365 * 5
        case 'ytd':
            ytd = (datetime.date(datetime.date.today().year, 1, 1) - datetime.date.today()).days
            days = -ytd
        case 'max':
            days = 0
        case _:  # default
            days = 1
    return {'days': days}


def check_query_params1(query_params):
    interval = query_params.get('interval')
    range_query = query_params.get('range')
    valid_ranges = [
        "1d",
        "5d",
        "1mo",
        "3mo",
        "6mo",
        "1y",
        "2y",
        "5y",
        "10y",
        "ytd",
        "max"
    ]
    if range_query not in valid_ranges:
        return Response(data=f"'{range_query}' is not a valid range: Valid ranges: {valid_ranges}",
                        status=status.HTTP_400_BAD_REQUEST)

    valid_intervals = ['1m', '2m', '5m', '15m', '30m', '60m', '90m', '1h', '1d', '5d', '1wk', '1mo', '3mo']
    if interval not in valid_intervals:
        return Response(data=f"'{interval}' is not a valid interval: Valid intervals: {valid_intervals}",
                        status=status.HTTP_400_BAD_REQUEST)


def append_value(type, history_list, all):
    for h in history_list:
        date = datetime.datetime.strptime(h['date'], DATE_FORMAT)
        if date in all:
            if type in all[date]:
                all[date][type] = h['value'] + all[date][type]
            else:
                all[date][type] = h['value']

        else:
            all[date] = {type: h['value']}


def add_symbol_history(symbol, data, value, history_list_entry):
    if symbol in data['history']:
        data['history'][symbol] = data['history'][symbol] + history_list_entry['price'] * value['quantity']
    else:
        data['history'] = {symbol: history_list_entry['price'] * value['quantity']}


def fill_weekends_for_stocks(hist_list):
    temp_hist_list = hist_list.copy()

    for idx, hist_entry in enumerate(hist_list):
        friday, date = is_friday(hist_entry.history_date)
        if friday:
            saturday = copy(hist_entry)
            sunday = copy(hist_entry)
            saturday.history_date = date + datetime.timedelta(days=1)
            sunday.history_date = date + datetime.timedelta(days=2)
            temp_hist_list.append(saturday)
            temp_hist_list.append(sunday)
    for t in temp_hist_list:
        if t is not datetime:
            print(t)
    return sorted(temp_hist_list, key=lambda h: h.history_date)


def map_portfolio_snapshot_data1(snapshot):
    # snapshot_serialized = PortfolioSnapshotSerializer(snapshot).data
    # formatted = snapshot.portfolio.split("current=Sum(")[1].split("')),")[0].replace('=Decimal(', ":").replace("'", "").replace(")", "")
    # formatted = formatted.replace("crypto", '"crypto"').replace("stock", '"stock"').replace("total", '"total"')
    # stream = io.BytesIO(str.encode(snapshot.portfolio.replace("'", "\"")))
    # data = JSONParser().parse(stream)

    formatted_json = json.loads(snapshot.portfolio.replace("'", "\""), object_hook=EdgeDecoder)
    formatted_json = dict(map(lambda val: (val[0], round(val[1])), formatted_json.items()))
    snapshot.portfolio = formatted_json

    return snapshot
    # return {'date': datetime.datetime.strftime(snapshot.date, DATE_FORMAT),'user': snapshot.user ,'overview': formatted_json}


def map_portfolio_snapshot_data(snapshot):
    formatted = snapshot.portfolio.split("current=Sum(")[1].split("')),")[0].replace('=Decimal(', ":").replace("'", "").replace(")", "")
    formatted = formatted.replace("crypto", '"crypto"').replace("stock", '"stock"').replace("total", '"total"')
    formatted_json = json.loads('{' + formatted + '}')
    formatted_json = dict(map(lambda val: (val[0], round(val[1])), formatted_json.items()))
    overview = Overview()
    overview.current.crypto = Decimal(formatted_json.get('crypto'))
    overview.current.stock = Decimal(formatted_json.get('stock'))
    overview.current.total = Decimal(formatted_json.get('total'))

    snapshot.portfolio = Portfolio(holdings_data=[], overview=overview, user=snapshot.user, currency=snapshot.user.currency)
    snapshot.portfolio = formatted_json
    return PortfolioSnapshotSerializer(snapshot).data


def filter_snapshot_by_date(snapshot, range):
    match range:
        case '1m':
            return snapshot.date.hour % 6 == 0 and snapshot.date.minute == 0  # filter data for every 6 hour
        case '6m':
            return snapshot.date.hour % 12 == 0 and snapshot.date.minute == 0  # filter data for every 12 hour
        case '1y' | 'ytd' | '5y' | 'max':
            return snapshot.date.hour == 0  # filter data for every day at hour 00:00
        case _:  # default
            return True
