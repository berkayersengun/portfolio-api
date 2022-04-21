"""
Django settings for port project.

Generated by 'django-admin startproject' using Django 3.2.9.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""
import os
from datetime import timedelta
from pathlib import Path

PROJECT_VERSION = '0.0.1'

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-loohho%)r=djdqf&gv7!1!8kk()*pd5#8ip7%%uq$jq2&2c$=k'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1', 'backend', '192.168.1.5', 'berkay.jumpingcrab.com']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    # 'rest_framework.authtoken',
    'holdings',
    'accounts',
    # 'oauth2_provider',
    'rest_framework_simplejwt',
    'rest_framework_simplejwt.token_blacklist',
    "corsheaders",
    "scheduler",
    "django_apscheduler",
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    "corsheaders.middleware.CorsMiddleware",
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    # 'authentication.middleware.CookieMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # 'port.middleware.AuthorizationMiddleware',
    # 'port.middleware.AuthMiddleware',

]

ROOT_URLCONF = 'port.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'port.wsgi.application'

# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases


if os.environ.get('POSTGRES_DB'):
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': os.environ.get('POSTGRES_DB'),
            'USER': os.environ.get('POSTGRES_USER'),
            'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
            'HOST': 'db',
            'PORT': 5432,
        }
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            # 'ENGINE': 'django.db.backends.sqlite3',
            'NAME': 'portfolio',
            'USER': 'postgres',
            'HOST': 'localhost',
            'PORT': '5432',
            'PASSWORD': 'postgres',
        },
    }

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/


STATIC_ROOT = os.path.join(BASE_DIR, 'static')
if os.environ.get('HOSTNAME'):
    STATIC_URL = '/api/static/'
else:
    STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
if DEBUG:
    REST_FRAMEWORK = {
        'DEFAULT_PERMISSION_CLASSES': (
            # 'rest_framework.permissions.IsAuthenticatedOrReadOnly',
            'rest_framework.permissions.IsAuthenticated',
        ),
        'DEFAULT_AUTHENTICATION_CLASSES': [
            # 'rest_framework.authentication.BasicAuthentication',
            # 'accounts.auth.TokenAuthentication',
            # 'oauth2_provider.contrib.rest_framework.OAuth2Authentication',
            # 'rest_framework_simplejwt.authentication.JWTAuthentication',
            'authentication.auth.CustomAuthentication',
            # jwt auth must come before session auth if not session auth will override error code of jwt auth
            # jwt returns 401 when token expired
            # session returns 403 which is incorrect.
            # 401: token expired
            # 403: not authenticated
            'rest_framework.authentication.SessionAuthentication',
        ],
        # 'DEFAULT_VERSIONING_CLASS': 'rest_framework.versioning.NamespaceVersioning'
    }

# OAUTH2_PROVIDER = {
#     # this is the list of available scopes
#     'SCOPES': {'read': 'Read scope', 'write': 'Write scope', 'groups': 'Access to your groups'}
# }


AUTH_USER_MODEL = 'accounts.Account'

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
    "http://127.0.0.1:8000",
    "http://192.168.1.5",
    'http://192.168.1.5:3001',
]

CSRF_TRUSTED_ORIGINS = ['http://192.168.1.5', 'https://192.168.1.5']

CORS_ALLOW_CREDENTIALS = True  # Allows sending httponly cookies from client
CSRF_COOKIE_SECURE = True

if DEBUG:
    LOGGING = {
        'version': 1,
        'disable_existing_loggers': False,
        'handlers': {
            'console': {
                'class': 'logging.StreamHandler',
            },
        },
        'root': {
            'handlers': ['console'],
            'level': 'INFO',
        },
    }

# LOGIN_REDIRECT_URL = '/api/v1/'
SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=15),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=15),
    'ROTATE_REFRESH_TOKENS': False,
    'BLACKLIST_AFTER_ROTATION': True,

    'ALGORITHM': 'HS256',
    # 'SIGNING_KEY': settings.SECRET_KEY,
    'VERIFYING_KEY': None,
    'AUDIENCE': None,
    'ISSUER': None,

    'AUTH_HEADER_TYPES': ('Bearer',),
    # 'AUTH_HEADER_NAME': 'HTTP_COOKIE',
    'USER_ID_FIELD': 'id',
    'USER_ID_CLAIM': 'user_id',

    'AUTH_TOKEN_CLASSES': ('rest_framework_simplejwt.tokens.AccessToken',),
    'TOKEN_TYPE_CLAIM': 'token_type',

    'JTI_CLAIM': 'jti',

    'SLIDING_TOKEN_REFRESH_EXP_CLAIM': 'refresh_exp',
    'SLIDING_TOKEN_LIFETIME': timedelta(minutes=5),
    'SLIDING_TOKEN_REFRESH_LIFETIME': timedelta(days=1),

    # Custom Params
    'COOKIE_ACCESS': 'access',
    'COOKIE_REFRESH': 'refresh'
}
