from django.urls import path
from rest_framework_simplejwt.views import TokenVerifyView

from authentication.views import JwtLoginView, JwtTokenRefreshView, JwtLogoutView

urlpatterns = [
    path('login/', JwtLoginView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', JwtTokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('logout/', JwtLogoutView.as_view(), name='logout'),
]
