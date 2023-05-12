from django.urls import path, include
from rest_framework import routers

from holdings.views import HoldingView, PortfolioViewSet, SearchViewSet, CapitalView, PortfolioSnapshotViewSet, \
    HistoryList, OverviewSnapshotViewSet, CurrencyListView

portfolio_list = PortfolioViewSet.as_view({'get': 'list'})
portfolio_detail = PortfolioViewSet.as_view({'get': 'retrieve'})
search = SearchViewSet.as_view({'get': 'retrieve'})
history = HistoryList.as_view()
currencyList = CurrencyListView.as_view()

router = routers.DefaultRouter(trailing_slash=False)
router.register('holdings', HoldingView)
router.register('capitals', CapitalView)
router.register('snapshots/portfolio', PortfolioSnapshotViewSet)
router.register('snapshots/overview', OverviewSnapshotViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('portfolios/', portfolio_list),
    path('portfolio/', portfolio_detail),
    path('search/', search),
    path('history/', history, name='history'),
    path('currencies/', currencyList, name='currencyList'),
]
