"""consulting URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from django.urls import path,include, re_path
from . import views
from django.conf import settings
from django.conf.urls.static import static
admin.site.site_header = "Epitome Consultancy"
admin.site.site_title = "Epitome Consultancy"
admin.site.index_title = "Welcome to Epitome Consultancy"
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('contact-us/', views.contact, name='contact'),
    path('about-us/', views.about, name='about'),
    path('blog/search/', views.blogsearch, name='blogsearch'),
    # path('apply-job/', views.apply_job, name='apply_job'),
    path('myadmin/', include('accounts.urls')),
    path('services/',include('myapp.urls')),
    path('blog/',include('blog.urls')),
    path('jobs/',include('jobsapp.urls')),
    path('ckeditor/', include('ckeditor_uploader.urls')),
    re_path(r'^next/(?P<path>.*)$', views.nextjs_page),
    re_path(r'^.next/static/(?P<path>.*)$', views.nextjs_proxy),
    path('chatbot/', include('chatbotapp.urls')),
    path('products/', views.products, name='products'),
    path('product/<slug:product_slug>/', views.product_detail, name='product_detail'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns = urlpatterns + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
