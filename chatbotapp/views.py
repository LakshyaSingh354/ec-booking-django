from django.shortcuts import redirect, render
from chatbot.settings import GENERATIVE_AI_KEY
from chatbotapp.models import ChatMessage
import google.generativeai as genai
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
def send_message(request):
    if request.method == 'POST':
        genai.configure(api_key=GENERATIVE_AI_KEY)
        model = genai.GenerativeModel("gemini-pro")

        user_message = request.POST.get('user_message')
        bot_response = model.generate_content(user_message)

        ChatMessage.objects.create(user_message=user_message, bot_response=bot_response.text)

    return redirect('list_messages')

def list_messages(request):
    # messages = ChatMessage.objects.all()
    messages = []
    return render(request, 'chatbot/list_messages.html', { 'messages': messages })

@require_http_methods(["POST"])
def process_message(request):
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        user_message = request.POST.get('user_message')
        genai.configure(api_key=GENERATIVE_AI_KEY)
        model = genai.GenerativeModel("gemini-pro")
        bot_response = model.generate_content(user_message)
        
        # Store the text content of the response
        ChatMessage.objects.create(user_message=user_message, bot_response=bot_response.text)
        
        return JsonResponse({
            'status': 'success',
            'user_message': user_message,
            'bot_response': bot_response.text  # Use .text to get the string content
        })
    return JsonResponse({'status': 'error'}, status=400)
