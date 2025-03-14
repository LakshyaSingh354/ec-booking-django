"""
Django settings for consulting project.

Generated by 'django-admin startproject' using Django 4.0.3.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from pathlib import Path
from django.contrib.messages import constants as messages
import os
import dotenv
import dj_database_url

dotenv.load_dotenv()
# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure--_vw9o)nsh1j+)vld+ejw5%pt%gad9+92-rg6jx7gy_it+4eyw'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*', 'www.epitomeconsultancy.com','epitomeconsultancy.com', 'localhost', '127.0.0.1', '.vercel.app']
CSP_SCRIPT_SRC = ["'self'", "https://checkout.razorpay.com", "https://api.razorpay.com"]
CSP_FRAME_SRC = ["'self'", "https://checkout.razorpay.com"]
CSP_CONNECT_SRC = ["'self'", "https://api.razorpay.com"]
CSP_IMG_SRC = ["'self'", "https://cdn.razorpay.com"]

CORS_ALLOWED_ORIGINS = [
    "https://checkout.razorpay.com",
    "https://api.razorpay.com",
]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'whitenoise.runserver_nostatic',
    # 'django.contrib.sites',
    'django.contrib.humanize',
    'django.contrib.sitemaps',
    'accounts',
    'myapp',
    'blog',
    'jobsapp',
    'ckeditor',
    'ckeditor_uploader',
    'chatbotapp'
]

SITE_ID = 1

MIDDLEWARE = [
    # 'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    # 'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'consulting.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'jobsapp.context_processors.sector_links',
                'myapp.context_processors.service_links',
                'blog.context_processors.menu_links',
                'myapp.context_processors.general_info',
                'myapp.context_processors.banner_info',
                'accounts.context_processors.get_user_profile',
                'myapp.context_processors.product_links',
            ],
        },
    },
]

WSGI_APPLICATION = 'consulting.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': dj_database_url.config(default=os.getenv('DATABASE_URL'))
}

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'advertsneak_epitome',
#         'USER': 'root',
#         'PASSWORD': '',
#         'HOST': 'localhost',
#         'PORT': '3306',
#     }
# }

AUTH_USER_MODEL = 'accounts.User'
# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

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
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = 'static/'
STATIC_ROOT = os.path.join(BASE_DIR, '/home/advertsneak/epitomeconsultancy.com/static')
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'consulting/static'),
]
# Media settings
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# Messages
MESSAGE_TAGS = {
    messages.ERROR: 'danger',
}
#Ckeditor Configuration
CKEDITOR_UPLOAD_PATH = 'uploads/'
CKEDITOR_IMAGE_BACKEND = 'pillow'
# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
#Email Config



EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = "rinkudy46@gmail.com"
EMAIL_HOST_PASSWORD = 'hghfjbgpelshtlqn'
EMAIL_PORT = '587'

# try:
#     from .local_settings import*
    
# except ImportError:
#     pass


STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')  # Collect static here
STATICFILES_STORAGE = "whitenoise.storage.CompressedStaticFilesStorage"