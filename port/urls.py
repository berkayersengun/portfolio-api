"""port URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path, include

from services.common_utils import get_profile
from services.enums import Profile


urlpatterns = [
    path('admin/', admin.site.urls),
    path('drf/', include('rest_framework.urls')),
    # path('drf/login/', JwtLoginView.as_view(), name='token_obtain_pair'),
    # path('drf/logout/', views.LogoutView.as_view(), name='logout'),
    # path('drf/login/', CustomLoginView.as_view(template_name='rest_framework/login.html'), name='login'),
    path('v1/', include('accounts.urls')),
    path('v1/', include('holdings.urls')),
    path('auth/', include('authentication.urls')),
]

if get_profile() is Profile.PROD:
    urlpatterns = [
        path('api/', include(urlpatterns))
    ]
