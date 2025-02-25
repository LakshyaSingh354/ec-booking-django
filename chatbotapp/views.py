from django.shortcuts import redirect, render
from chatbot.settings import GENERATIVE_AI_KEY
from chatbotapp.models import ChatMessage
from django.urls import reverse
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
    if request.method == 'GET':
        messages = []  # or ChatMessage.objects.all() if you want to show history
        return render(request, 'chatbot/list_messages.html', {'messages': messages})
    return redirect(reverse('list_messages'))

@require_http_methods(["POST"])
def process_message(request):
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        system_instruction = "You are a chatbot deployed on the website of Epitome Consulting. Epitome Consulting is a business consultancy firm that provides services to businesses in the areas of business development, business strategy, and business operations. You are expected to provide information about the services offered by Epitome Consulting, answer questions about the company, and provide general information about the company. \n Deny any requests that are not related to the services offered by Epitome Consulting. Keep your answers very short, just one or two lines. \n Users can book a service by going to /services and going to the service detail page of the respecive service and clicking on the 'Book Now' button. \n Users can also explore the products offered by Epitome Consulting by going to /products. \n In case of any enquiries, users can go to /contact-us or contact the company via call on +91-7977515433. \n In no case are you allowed to entertain any requests not related to Epitome Consulting. Simply deny them by saying 'I'm sorry, I cannot help you with that'."
        user_message = request.POST.get('user_message')
        genai.configure(api_key=GENERATIVE_AI_KEY)
        model = genai.GenerativeModel("gemini-1.5-flash-latest", system_instruction=system_instruction)
        bot_response = model.generate_content(user_message)

        # Store the text content of the response
        ChatMessage.objects.create(user_message=user_message, bot_response=bot_response.text)

        return JsonResponse({
            'status': 'success',
            'user_message': user_message,
            'bot_response': bot_response.text
        })
    return JsonResponse({'status': 'error'}, status=400)
