import datetime

from django.http import Http404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.generics import ListAPIView
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from accounts.choices import Currency
from accounts.models import Account
from holdings.models import Holding, Capital, PortfolioSnapshot, OverviewSnapshot
from holdings.serializers import HoldingSerializer, PortfolioSerializer, SearchSerializer, CapitalSerializer, \
    PortfolioSnapshotSerializer, OverviewSnapshotSerializer
from holdings.service import get_filter_params, filter_snapshot_by_date, map_overview_data
from holdings.utils import get_portfolio, get_conversion_rate_dict
from services import yahoo

TOTAL = 'total'


class BaseModelViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]  # https://stackoverflow.com/questions/54543034/how-to-filter-objects-by-slug-instead-id
    filterset_fields = '__all__'


class CapitalView(BaseModelViewSet):
    queryset = Capital.objects.all()
    serializer_class = CapitalSerializer
    lookup_field = 'user__username'  # Use __ with foreign keys for lookup ie ForeignKeyModel__ForeignKeyModelField


class HoldingView(BaseModelViewSet):
    queryset = Holding.objects.all()
    serializer_class = HoldingSerializer


def get_currency_from_request(request):
    if request.query_params.get("currency"):
        currency = request.query_params.get("currency")
    else:
        currency = request.user.currency
    return currency


class PortfolioViewSet(viewsets.ReadOnlyModelViewSet):
    """
    A simple ViewSet for listing or retrieving, creating and updating projects.
    """
    filter_backends = [DjangoFilterBackend]  # https://stackoverflow.com/questions/54543034/how-to-filter-objects-by-slug-instead-id
    filterset_fields = '__all__'

    def list(self, request, **kwargs):
        datas = []
        for account in Account.objects.all():
            currency = get_currency_from_request(request)
            portfolio = get_portfolio(account, currency)
            datas.append(PortfolioSerializer(portfolio).data)
        return Response(data=datas, status=status.HTTP_200_OK)

    def retrieve(self, request, **kwargs):
        try:
            currency = get_currency_from_request(request)
            portfolio = get_portfolio(user=request.user, currency=currency)
            data = PortfolioSerializer(portfolio).data
            return Response(data=data, status=status.HTTP_200_OK)
        except Exception as ex:
            return Response(data=ex.args[0], status=status.HTTP_500_INTERNAL_SERVER_ERROR)


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
        currency = get_currency_from_request(request)
        conversion_rate_dict = get_conversion_rate_dict(currency)
        data = list(map(lambda snapshot: map_overview_data(snapshot, currency, conversion_rate_dict), overview_data))
        data = sorted(data, key=lambda d: d['date'])
        return Response(data=data, status=status.HTTP_200_OK)


class CurrencyListView(APIView):
    permission_classes = (AllowAny,)

    def get(self, request):
        return Response(Currency.labels)
