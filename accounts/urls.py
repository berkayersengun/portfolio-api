from django.urls import path, include

from accounts.views import AccountView
from holdings.urls import router

router.register('accounts', AccountView)

urlpatterns = [
    path('', include(router.urls)),
]
