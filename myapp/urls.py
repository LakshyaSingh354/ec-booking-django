from django.urls import path
from . import views
from chatbotapp.views import send_message, list_messages

urlpatterns = [
    path('', views.services, name='services'),
    path('<slug:service_slug>/', views.service_detail, name='service_detail'),
    path('inquiry', views.inquiry, name='inquiry'),

    # Route Next.js pages through Django
    path('book/<path:path>/', views.nextjs_page, name='nextjs_page'),

    path('product/<slug:product_slug>/', views.product_detail, name='product_detail'),

    # path('send', send_message, name='send_message'),
    # path('', list_messages, name='list_messages'),
    # path('send_message/', views.send_message, name='send_message'),
]