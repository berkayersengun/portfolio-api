from django.urls import path, include
from rest_framework import routers

from holdings.views import HoldingView, PortfolioViewSet, SearchViewSet, CapitalView

portfolio_list = PortfolioViewSet.as_view({'get': 'list'})
portfolio_detail = PortfolioViewSet.as_view({'get': 'retrieve'})
search = SearchViewSet.as_view({'get': 'retrieve'})

router = routers.DefaultRouter(trailing_slash=False)
router.register('holdings', HoldingView)
router.register('capitals', CapitalView)

# router.register('portfolio', PortfolioViewSet, basename="portfolios")

urlpatterns = [
    path('', include(router.urls)),
    path('portfolios/', portfolio_list),
    path('portfolio/', portfolio_detail),
    path('search/', search),
]
