from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from port import settings


def day_to_seconds(day):
    return 60 * 60 * 24 * day


def setCookie(response, jwt_type, day):
    response.set_cookie(jwt_type, response.data[jwt_type], max_age=day_to_seconds(day), httponly=True)


class JwtLoginView(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        response = super(JwtLoginView, self).post(request, *args, **kwargs)
        max_age_access = settings.SIMPLE_JWT['ACCESS_TOKEN_LIFETIME'].seconds
        max_age_refresh = settings.SIMPLE_JWT['REFRESH_TOKEN_LIFETIME'].seconds
        setCookie(response, settings.SIMPLE_JWT['COOKIE_ACCESS'], 1)
        setCookie(response, settings.SIMPLE_JWT['COOKIE_REFRESH'], 15)
        return response


class JwtTokenRefreshView(TokenRefreshView):
    def post(self, request, *args, **kwargs):
        refresh_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']) or None
        request.data['refresh'] = refresh_token
        response = super(JwtTokenRefreshView, self).post(request, *args, **kwargs)
        setCookie(response, settings.SIMPLE_JWT['COOKIE_ACCESS'], 1)
        return response


def blacklist_token(token):
    refresh = RefreshToken(token)
    refresh.blacklist()


class JwtLogoutView(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        blacklist_token(request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']))
        response = Response(status=200)
        response.delete_cookie(settings.SIMPLE_JWT['COOKIE_REFRESH'])
        response.delete_cookie(settings.SIMPLE_JWT['COOKIE_ACCESS'])
        return response
