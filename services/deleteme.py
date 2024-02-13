# Experiments with yahoo history API
from _decimal import Decimal
from datetime import datetime

from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from accounts.models import Account
from holdings.constanst import DATE_FORMAT
from holdings.dataclasses import Sum, Date
from holdings.models import Holding
from holdings.serializers import HistorySerializer
from holdings.service import check_query_params1, fill_weekends_for_stocks, append_value, add_value
from holdings.views import TOTAL
from services import yahoo


class HistoryList1(APIView):
    def get(self, request):
        is_queries_valid = check_query_params1(request.query_params)
        if is_queries_valid:  # TODO looks weird, refactor this check
            return is_queries_valid

        interval = request.query_params.get('interval')
        range_query = request.query_params.get('range')
        symbol = request.query_params.get('symbol')

        holdings = {}
        holdings_query_list = Holding.objects.filter(user=Account.objects.get(username=request.user).id)

        for holding in holdings_query_list:
            date = datetime.strftime(holding.date, DATE_FORMAT)
            if holding.symbol in holdings:
                holdings[holding.symbol]['holdings'].append({'quantity': holding.quantity, 'purchase_date': date})
                holdings[holding.symbol]['quantity'] = holdings[holding.symbol]['quantity'] + float(holding.quantity)
            else:
                holdings[holding.symbol] = {}
                holdings[holding.symbol]['type'] = holding.type
                holdings[holding.symbol]['holdings'] = [{'quantity': holding.quantity, 'purchase_date': date}]
                holdings[holding.symbol]['quantity'] = float(holding.quantity)

        hist_list = []
        for symbol, value in holdings.items():
            history_list = yahoo.history(symbol=symbol, interval=interval, range_query=range_query)
            for i, history_list_entry in enumerate(history_list):

                holding = {'symbol': symbol, 'quantity': value['quantity'], 'type': value['type'],
                           'value': history_list_entry['price'] * value['quantity']}
                d = list(filter(lambda date_entry: date_entry.history_date == history_list_entry['date'], hist_list))
                if d:
                    d[0].sum.add_value(holding['type'], Decimal(holding['value']))
                    d[0].holdings.append(holding)
                else:
                    current_sum = Sum()
                    current_sum.add_value(holding['type'], Decimal(holding['value']))
                    date = Date(history_date=history_list_entry['date'], sum=current_sum)
                    date.holdings.append(holding)
                    hist_list.append(date)

        # filter out the missing dates if not received from yahoo api for certain dates
        # filtered_hist_list = list(filter(lambda e: len(e.holdings) == len(holdings), hist_list))
        temp_hist_list = fill_weekends_for_stocks(hist_list)
        serialized_data = HistorySerializer({'date': temp_hist_list}).data.get('date')
        return Response(data=serialized_data, status=status.HTTP_200_OK)


class HistoryList2(APIView):
    def get(self, request):
        is_queries_valid = check_query_params(request.query_params)
        if is_queries_valid:  # TODO looks weird, refactor this check
            return is_queries_valid

        interval = request.query_params.get('interval')
        range_query = request.query_params.get('range')
        symbol = request.query_params.get('symbol')

        data = {}
        holdings = Holding.objects.filter(user=Account.objects.get(username=request.user).id)

        for holding in holdings:
            date = datetime.datetime.strftime(holding.date, DATE_FORMAT)
            if holding.symbol in data:
                data[holding.symbol]['holdings'].append({'quantity': holding.quantity, 'purchase_date': date})
                data[holding.symbol]['quantity'] = data[holding.symbol]['quantity'] + float(holding.quantity)
            else:
                data[holding.symbol] = {}
                data[holding.symbol]['type'] = holding.type
                data[holding.symbol]['holdings'] = [{'quantity': holding.quantity, 'purchase_date': date}]
                data[holding.symbol]['quantity'] = float(holding.quantity)

        total_values_dict = {}
        for symbol, value in data.items():
            if symbol != TOTAL:
                history_list = yahoo.history(symbol=symbol, interval=interval, range_query=range_query)
                history_tuple_list = [(x, data[symbol]['quantity']) for x in history_list]
                data[symbol]['history'] = list(map(add_value, history_tuple_list))
                append_value(value['type'], history_list, total_values_dict)

        data[TOTAL] = {}
        temp_total = {'stock': 0, 'crypto': 0}

        for i, (k, v) in enumerate(sorted(total_values_dict.items())):  # enumerate list of tuples
            # val = total_values_dict.get(k - datetime.timedelta(days=1))
            # if val is None:
            #     val = total_values_dict.get(k + datetime.timedelta(days=1))

            if 'stock' not in v:
                v['stock'] = temp_total['stock']
            if 'crypto' not in v:
                v['crypto'] = temp_total['crypto']

            data[TOTAL][datetime.datetime.strftime(k, DATE_FORMAT)] = {'stock': round(v['stock']), 'crypto': round(v['crypto'])}

            # data[TOTAL][datetime.datetime.strftime(k, DATE_FORMAT)] = {value: round(v[value]) for value in v}
            temp_total = v

        return Response(data=data, status=status.HTTP_200_OK)


def getOverviewData(user):
    capital = Capital.objects.filter(user=Account.objects.get(username=user).id)
    if len(capital) == 0:
        return {'crypto': 0, 'stock': 0, 'total': 0}
    else:
        capitalData = CapitalSerializerForAccount(capital, many=True).data[0]
        capitalData['total'] = capital.first().crypto + capital.first().stock
        return capitalData


def set_holdings_data(holdings_data, holding, quote, eur_usd, user):
    # quantityEach = holding.quantity if holding.action == 'BUY' else -holding.quantity

    current_price = Decimal(quote['regularMarketPrice'])
    change_24h = Decimal(quote['regularMarketChange'])

    if quote['currency'] != user.currency:
        current_price = current_price / eur_usd
        change_24h = change_24h / eur_usd

    # purchase_price = holding.purchase_price if holding.currency == Holding.Currency.EUR.value else holding.purchase_price / eur_usd
    if holding.currency != user.currency:
        holding.purchase_price = holding.purchase_price / eur_usd

    price = Price(purchase=holding.purchase_price, current=current_price)
    value = Price(purchase=price.purchase * holding.quantity, current=price.current * holding.quantity)
    change = Change(value=change_24h, percentage=quote['regularMarketChangePercent'])
    holdings_data.append(HoldingData(symbol=quote['symbol'],
                                     name=quote['shortName'],
                                     exchange=quote['fullExchangeName'],
                                     quantity=holding.quantity,
                                     price=price,
                                     gain=price.gain(holding.quantity),
                                     change_24H=change,
                                     value=value,
                                     date=holding.date.strftime("%d-%b-%y, %H:%M"),
                                     type=holding.type,
                                     currency=Currency.CAD
                                     ))


def filter_by_user(self):
    queryset = Holding.objects.all()
    username = self.request.query_params.get('user')
    if username is not None:
        try:
            account = Account.objects.get(username=username)
        except Account.DoesNotExist:
            availableNames = []
            for account in Account.objects.all():
                availableNames.append(account.username)
            if not availableNames:
                availableNames = ""
            raise NotFound('User \'{0}\' not exists: {1}'.format(username, availableNames))
        return queryset.filter(user=account.id)
    return queryset


def dataclass_from_dict(klass, d):
    try:
        fieldtypes = {f.name: f.type for f in dataclasses.fields(klass)}
        return klass(**{f: dataclass_from_dict(fieldtypes[f], d[f]) for f in d})
    except:
        return d


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


def convert_old_portfolio_snapshot_data(snapshot):
    formatted = snapshot.portfolio.split("current=Sum(")[1].split("')),")[0].replace('=Decimal(', ":").replace("'", "").replace(")", "")
    formatted = formatted.replace("crypto", '"crypto"').replace("stock", '"stock"').replace("total", '"total"')
    formatted_json = json.loads('{' + formatted + '}')
    formatted_json = dict(map(lambda val: (val[0], round(val[1])), formatted_json.items()))
    overview = Overview()
    overview.current.crypto = Decimal(formatted_json.get('crypto'))
    overview.current.stock = Decimal(formatted_json.get('stock'))
    overview.current.total = Decimal(formatted_json.get('total'))

    snapshot.portfolio = Portfolio(holdings_data=[], overview=overview, username=snapshot.user, currency=snapshot.user.currency)
    snapshot.portfolio = formatted_json
    return PortfolioSnapshotSerializer(snapshot).data


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



def add_symbol_history(symbol, data, value, history_list_entry):
    if symbol in data['history']:
        data['history'][symbol] = data['history'][symbol] + history_list_entry['price'] * value['quantity']
    else:
        data['history'] = {symbol: history_list_entry['price'] * value['quantity']}

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


def add_value(history_list):
    # history_date = datetime.datetime.strptime(history_list[0]['date'], DATA_FORMAT)  # 2022
    # purchase_date = datetime.datetime.strptime(history_list[1]['purchase_date'], DATA_FORMAT)  # 2023
    # if history_date > purchase_date:
    #     history_list[0]['value'] = float(history_list[1]['quantity']) * history_list[0]['price']

    # quantity = sum(holding['quantity'] for holding in history_list[1]['holdings'])
    history_list[0]['value'] = history_list[1] * history_list[0]['price']
    return history_list[0]


def get_current_totals(holdings_data):
    crypto_total = sum([holding_data.amount for holding_data in holdings_data.crypto])
    stock_total = sum([holding_data.amount for holding_data in holdings_data.stock])
    return Sum(crypto=crypto_total, stock=stock_total, total=crypto_total + stock_total)