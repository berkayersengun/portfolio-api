from django.core import exceptions
from django.middleware.csrf import CsrfViewMiddleware
from rest_framework.authentication import CSRFCheck
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.tokens import RefreshToken

from port import settings


# class TokenAuthentication(authentication.TokenAuthentication):
#     """
#     Simple token based authentication.
#     Clients should authenticate by passing the token key in the "Authorization"
#     HTTP header, prepended with the string "Token ".  For example:
#     Authorization: Token 401f7ac837da42b97f613d789819ff93537bee6a
#     """
#     authentication.TokenAuthentication.keyword = 'Bearer'

# def enforce_csrf(self, request):
#     """
#     Enforce CSRF validation for session based authentication.
#     """
#
#     def dummy_get_response(request):  # pragma: no cover
#         return None
#
#     check = CSRFCheck(dummy_get_response)
#     # populates request.META['CSRF_COOKIE'], which is used in process_view()
#     check.process_request(request)
#     reason = check.process_view(request, None, (), {})
#     if reason:
#         # CSRF failed, bail with explicit error message
#         raise exceptions.PermissionDenied(f'CSRF Failed: {reason}')


# def enforce_csrf(request):
#     check = CSRFCheck(CsrfViewMiddleware)
#     check.process_request(request)
#     reason = check.process_view(request, None, (), {})
#     if reason:
#         raise exceptions.PermissionDenied('CSRF Failed: %s' % reason)


# class JwtObtainPairSerializer(TokenObtainPairSerializer):
#     @classmethod
#     def get_token(cls, user):
#         token = super().get_token(user)
#
#         # Add custom claims
#         # token['name'] = user.name
#         # ...
#
#         return token

# def get_tokens_for_user(user):
#     refresh = RefreshToken.for_user(user)
#
#     return {
#         'refresh': str(refresh),
#         'access': str(refresh.access_token),
#     }


def refreshToken(request):
    raw_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']) or None
    if raw_token is None:
        return None
    token = RefreshToken.for_user(request.user).access_token
    return token


class CustomAuthentication(JWTAuthentication):
    def authenticate(self, request):
        header = self.get_header(request)
        # enforce_csrf(request)
        if header is None:  # Check cookies first (UI)
            raw_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_ACCESS']) or None
        else:
            raw_token = self.get_raw_token(header)  # get from header (rest)

        if raw_token is None:
            return None

        validated_token = self.get_validated_token(raw_token)
        return self.get_user(validated_token), validated_token

        # try:
        #     validated_token = self.get_validated_token(raw_token)
        #     return self.get_user(validated_token), validated_token
        # except InvalidToken as ex:
        #     refresh_token = request.COOKIES.get(settings.SIMPLE_JWT['COOKIE_REFRESH']) or None
        #     ref = RefreshToken(refresh_token)
        #     validated_token = self.get_validated_token(raw_token)
        #     return self.get_user(ref.access_token.token)

        # enforce_csrf(request)
        # except InvalidToken as invalid_token:
        #     # token = refreshToken(request)
        #     token = RefreshToken.for_user(request.user).access_token
        #     return self.get_user(token)
        #     # if 'any token type' in  invalid_token.detail['detail']:
        #     #     raise invalid_token
        #     print(invalid_token)

#############################################################################################################
# class CookieTokenObtainPairView(TokenObtainPairView):
#     def finalize_response(self, request, response, *args, **kwargs):
#         if response.data.get('refresh'):
#             cookie_max_age = 3600 * 24 * 14  # 14 days
#             response.set_cookie('refresh_token', response.data['refresh'], max_age=cookie_max_age, httponly=True)
#             del response.data['refresh']
#         return super().finalize_response(request, response, *args, **kwargs)
#
#
# class CookieTokenRefreshView(TokenRefreshView):
#     def finalize_response(self, request, response, *args, **kwargs):
#         if response.data.get('refresh'):
#             cookie_max_age = 3600 * 24 * 14  # 14 days
#             response.set_cookie('refresh_token', response.data['refresh'], max_age=cookie_max_age, httponly=True)
#             del response.data['refresh']
#         return super().finalize_response(request, response, *args, **kwargs)
#
#     serializer_class = CookieTokenRefreshSerializer


# @api_view(['POST', ])
# @permission_classes((AllowAny,))
# def login_view(request):
#     """
#     POST API for login
#     """
#     data = json.loads(request.body)
#     username = data.get('username')
#     password = data.get('password')
#     if username is None:
#         return JsonResponse({
#             "errors": {
#                 "detail": "Please enter username"
#             }
#         }, status=400)
#     elif password is None:
#         return JsonResponse({
#             "errors": {
#                 "detail": "Please enter password"
#             }
#         }, status=400)
#
#     # authentication user
#     user = authenticate(username=username, password=password)
#     if user is not None:
#         login(request, user)
#         response = JsonResponse({"success": "User has been logged in"})
#         response.set_cookie('refresh_token', response.data['refresh'], max_age=cookie_max_age, httponly=True)
#         return JsonResponse({"success": "User has been logged in"})
#     return JsonResponse(
#         {"errors": "Invalid credentials"},
#         status=400,
#     )
