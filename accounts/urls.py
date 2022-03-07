from django.urls import path, include
# from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework import routers

from accounts.views import AccountView

router = routers.DefaultRouter(trailing_slash=False)
router.register('accounts', AccountView)
urlpatterns = [
    # path('drf/', include('rest_framework.urls')),
    # path('auth/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # path('auth/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # path('auth/token-cookie/', CookieTokenObtainPairView.as_view(), name='token_obtain_pair_cookie'),
    # path('auth/token-cookie/refresh/', CookieTokenRefreshView.as_view(), name='token_refresh_cookie'),
    # path('auth/register/', RegisterView.as_view(), name='auth_register'),
    # path('auth/login/', login_view, name='login'),
    path('', include(router.urls)),
]
