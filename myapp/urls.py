from django.urls import path
from . import views

urlpatterns = [
    path('', views.services, name='services'),
    path('<slug:service_slug>/', views.service_detail, name='service_detail'),
    path('inquiry', views.inquiry, name='inquiry'),

    # Route Next.js pages through Django
    path('book/<path:path>/', views.nextjs_page, name='nextjs_page'),
]