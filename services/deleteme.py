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
