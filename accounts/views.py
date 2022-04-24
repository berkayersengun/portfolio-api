from rest_framework import generics, viewsets, permissions
from rest_framework.permissions import AllowAny

from accounts.models import Account
from accounts.serializers import RegisterSerializer, AccountSerializer


class AccountView(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    lookup_field = 'username'

    def get_permissions(self):
        """Returns the permission based on the type of action"""

        if self.action == "create":
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]


class RegisterView(generics.CreateAPIView):
    queryset = Account.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer

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
#         return JsonResponse({"success": "User has been logged in"})
#     return JsonResponse(
#         {"errors": "Invalid credentials"},
#         status=400,
#     )
# class CustomLoginView(LoginView):
#     template_name = 'login.html'
#
#     def get_redirect_url(self):
#         if get_profile() is Profile.PROD:
#             self.request.POST.next = '/api/v1/holdings'
#
#         return super().get_redirect_url()
