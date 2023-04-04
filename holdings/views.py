import datetime
from _decimal import Decimal

from django.http import Http404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.views import APIView

from accounts.models import Account
from holdings.constanst import DATE_FORMAT
from holdings.dataclasses import Date, Sum
from holdings.models import Holding, Capital, PortfolioSnapshot, OverviewSnapshot
from holdings.serializers import HoldingSerializer, PortfolioSerializer, SearchSerializer, CapitalSerializer, \
    PortfolioSnapshotSerializer, HistorySerializer, OverviewSnapshotSerializer
from holdings.service import get_filter_params, check_query_params1, fill_weekends_for_stocks, add_value, append_value, filter_snapshot_by_date
from holdings.utils import get_portfolio
from services import yahoo

TOTAL = 'total'


class BaseModelViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'


class CapitalView(BaseModelViewSet):
    queryset = Capital.objects.all()
    serializer_class = CapitalSerializer
    lookup_field = 'user__username'  # Use __ with foreign keys for lookup ie ForeignKeyModel__ForeignKeyModelField


class HoldingView(BaseModelViewSet):
    queryset = Holding.objects.all()
    serializer_class = HoldingSerializer


class PortfolioViewSet(viewsets.ReadOnlyModelViewSet):
    """
    A simple ViewSet for listing or retrieving, creating and updating projects.
    """

    def list(self, request, **kwargs):
        datas = []
        for account in Account.objects.all():
            portfolio = get_portfolio(account)
            datas.append(PortfolioSerializer(portfolio).data)
        return Response(data=datas, status=status.HTTP_200_OK)

    def retrieve(self, request, **kwargs):
        portfolio = get_portfolio(request.user)
        data = PortfolioSerializer(portfolio).data
        return Response(data=data, status=status.HTTP_200_OK)


class SearchViewSet(viewsets.ReadOnlyModelViewSet):
    def retrieve(self, request, **kwargs):
        search_list = yahoo.search(request.query_params.get('symbol'))
        datas = []
        for search in search_list:
            datas.append(SearchSerializer(search).data)
        return Response(data=datas, status=status.HTTP_200_OK)


class PortfolioSnapshotViewSet(viewsets.ModelViewSet):
    queryset = PortfolioSnapshot.objects.all()
    serializer_class = PortfolioSnapshotSerializer


class OverviewSnapshotViewSet(viewsets.ModelViewSet):
    queryset = OverviewSnapshot.objects.all()
    serializer_class = OverviewSnapshotSerializer


class HistoryList(ListAPIView):
    serializer_class = OverviewSnapshotSerializer
    queryset = OverviewSnapshot.objects.all()

    def get(self, request, *args, **kwargs):
        query_range = request.query_params.get('range')
        filter_params = {'user': Account.objects.get(username=request.user).id}
        if query_range != 'max' and query_range is not None:
            end_date = datetime.datetime.now()
            try:
                start_date = end_date - datetime.timedelta(**get_filter_params(query_range))
                filter_params['date__range'] = [start_date, end_date]
            except Http404 as e:
                return Response(data=e.args[0], status=status.HTTP_400_BAD_REQUEST)

        overview_data = OverviewSnapshot.objects.filter(**filter_params)

        overview_data = filter(lambda snapshot: filter_snapshot_by_date(snapshot, query_range), overview_data)
        data = list(map(lambda snapshot: {'date': snapshot.date, 'sum': snapshot.overview['current']}, overview_data))
        data = sorted(data, key=lambda d: d['date'])
        return Response(data=data, status=status.HTTP_200_OK)


# Experiments with yahoo history API
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
            date = datetime.datetime.strftime(holding.date, DATE_FORMAT)
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
