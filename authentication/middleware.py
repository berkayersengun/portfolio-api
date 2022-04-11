import json

from django.contrib import auth
from django.core.exceptions import ImproperlyConfigured
from django.http import HttpResponse
from django.utils.deprecation import MiddlewareMixin
from rest_framework_simplejwt import authentication
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.backends import TokenBackend
from rest_framework_simplejwt.exceptions import TokenError
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.tokens import RefreshToken, Token

from authentication.auth import CustomAuthentication
from authentication.views import day_to_seconds
from port import settings

EXCLUDE_FROM_MIDDLEWARE = ['Django_Rest_Framework.views.apiIndexView',
                           'Django_Rest_Framework.views.IndexView',
                           'accounts.views.RegisterView',
                           'accounts.views.LoginView'
                           ]


class YankTokenRefreshFromHeaderIntoTheBody(MiddlewareMixin):
    """
    for Django Rest Framework JWT's POST "/token-refresh" endpoint --- check for a 'token' in the request.COOKIES
    and if, add it to the body payload.
    """

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        return response

    def process_view(self, request, view_func, *view_args, **view_kwargs):
        if request.path == '/v1/token-refresh' and 'token' in request.COOKIES:
            data = json.loads(request.body)
            data['token'] = request.COOKIES['token']
            request._body = json.dumps(data).encode('utf-8')
        return None


class AuthorizationMiddleware(MiddlewareMixin):
    def __init__(self, get_response=None):
        self.get_response = get_response

    def process_view(self, request, view_func, view_args, view_kwargs):
        view_name = '.'.join((view_func.__module__, view_func.__name__))
        print(view_name)
        if view_name in EXCLUDE_FROM_MIDDLEWARE:
            return None

    def __call__(self, request):
        token = request.COOKIES.get('token')
        username = request.META["USER"]
        user = auth.authenticate(request, remote_user=username)
        if user:
            # User is valid.  Set request.user and persist user in the session
            # by logging the user in.
            request.user = user
            auth.login(request, user)
        if token:
            request.META['HTTP_AUTHORIZATION'] = f'Token {token}'
        return self.get_response(request)


class AuthMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # Request will be triggered before each request def  process_request ( self , request ) :
        uid = request.GET.Get('uid')
        jwt_str = request.GET.Get('jwt')
        # After decrypting jwt, it is Dictionary
        # decode_jwt = pyjwt.Decode(jwt_str, '123', algorithms=['HS256'])
        decode_jwt = {}
        if decode_jwt['uid'] != str(uid):
            return HttpResponse('You tampered with user id')
        pass
        # Before template rendering

    def process_view(self, request, view_func, view_args, view_kwargs):
        pass
        # After request

    def process_response(self, request, response):
        return response


def refreshToken(request):
    raw_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']) or None
    if raw_token is None:
        return None
    token = RefreshToken.for_user(request.user).access_token
    return token


class CookieMiddleware(MiddlewareMixin):
    def process_view(self, request, view_func, view_args, view_kwargs):
        raw_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_ACCESS']) or None
        # validated_token = CustomAuthentication.get_validated_token(raw_token=raw_token)

        try:
            token = RefreshToken(raw_token)
        except TokenError:
            refresh_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']) or None
            ref = RefreshToken(refresh_token)
            # update access token using refresh token by getting new access token
            # request.set_cookie('access', ref.access_token, max_age=day_to_seconds(1), httponly=True)
            # request.set_cookie('refreshed', 'refreshed', max_age=day_to_seconds(1), httponly=True)
            print(ref)
            # if return none, it will continue to process other middleware process views methods.
            # https://docs.djangoproject.com/en/4.0/topics/http/middleware/#process-view
            return None
        return None

        # token = request.COOKIES["token"]
        # REST request to OpenAM server for user attributes.
        # token, attribute, role = identity_manager.get_attributes(token)
        username = request.META["USER"]
        user, validated_token = authentication.JWTAuthentication().authenticate(
            request)  # Manually authenticate the token
        # user = authenticate(remote_user=username)
        return user
        # request.user = user
        # login(request, user)

    def process_response(self, request, response):
        return response