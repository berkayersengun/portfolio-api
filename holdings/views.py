from rest_framework import status, viewsets
from rest_framework.response import Response

from accounts.models import Account
from holdings.models import Holding, Capital, PortfolioSnapshot
from holdings.serializers import HoldingSerializer, PortfolioSerializer, SearchSerializer, CapitalSerializer, \
    PortfolioSnapshotSerializer
from holdings.utils import get_holding_data, get_overview_data, filterByUser, getPortfolio
from services import yahoo


class CapitalView(viewsets.ModelViewSet):
    queryset = Capital.objects.all()
    serializer_class = CapitalSerializer
    lookup_field = 'user__username'  # Use __ with foreign keys for lookup ie ForeignKeyModel__ForeignKeyModelField


class HoldingView(viewsets.ModelViewSet):
    queryset = Holding.objects.all()
    serializer_class = HoldingSerializer

    def get_queryset(self):
        queryset = filterByUser(self)
        # queryset = filterBySymbol(self, queryset)
        return queryset


class PortfolioViewSet(viewsets.ReadOnlyModelViewSet):
    """
    A simple ViewSet for listing or retrieving, creating and updating projects.
    """

    def list(self, request, **kwargs):
        datas = []
        for account in Account.objects.all():
            holdings_data = get_holding_data(account.username)
            overview = get_overview_data(holdings_data, account.username)
            portfolio = {'holdings_data': holdings_data, 'overview': overview, 'user': account.username}
            datas.append(PortfolioSerializer(portfolio).data)

        return Response(data=datas, status=status.HTTP_200_OK)

    def retrieve(self, request, **kwargs):
        portfolio = getPortfolio(request.user)
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
    lookup_field = 'user__username'  # Use __ with foreign keys for lookup ie ForeignKeyModel__ForeignKeyModelField
