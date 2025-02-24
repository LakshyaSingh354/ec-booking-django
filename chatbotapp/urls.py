from django.urls import path
from .views import send_message, list_messages
from . import views

urlpatterns = [
    path('send', send_message, name='send_message'),
    path('', list_messages, name='list_messages'),
    path('process_message/', views.process_message, name='process_message'),
]