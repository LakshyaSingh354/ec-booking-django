import json
from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect, JsonResponse
from django.db.models import Q
from fastapi.responses import JSONResponse
import requests
# from myapp.models import Banner,Client,Services,Team,Know_us,Company_overview,Testimonial,About,What_specialty,Contact,Feedback
from myapp.models import*
from blog.models import Post,BlogComment,Category
from jobsapp.models import Job,Sector
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from myapp.forms import FeedbackForm
from django.contrib import messages,auth
from django.core.mail import send_mail
from django.template.loader import render_to_string
from accounts.mymail import get_enqmail
import google.generativeai as genai
from myapp.models import ChatMessage
from chatbot.settings import GENERATIVE_AI_KEY
from chatbotapp.models import ChatMessage
enqmail = get_enqmail()

from django.views.decorators.csrf import csrf_exempt
# Create your views here.
def home(request):
    banner = Banner.objects.filter(status=1).order_by('-created_on')[0:1]
    home_pages = Home.objects.filter(status=1).order_by('created_on')[0:1]
    services = Services.objects.filter(status=1).order_by('-created_on')[0:4]
    team = Team.objects.filter(status=1).order_by('created_on')[0:4]
    know_us = Know_us.objects.filter(status=1).order_by('created_on')[0:1]
    overview = Company_overview.objects.filter(status=1).order_by('created_on')[0:1]
    brands = Client.objects.filter(status=1).order_by('created_on')
    testimonials = Testimonial.objects.filter(status=1).order_by('created_on')
    posts = Post.objects.filter(status=1).order_by('-created_on')[0:3]
    counters = Counter.objects.filter(status=1).order_by('-created_on')[0:1]
    context = {
        'team': team,
        'services': services,
        'brands': brands,
        'banner': banner,
        'know_us': know_us,
        'overview': overview,
        'testimonials': testimonials,
        'posts': posts,
        'home_pages': home_pages,
        'counters': counters,
        'messages': ChatMessage.objects.all().order_by('-created_at')[:10]  # Show last 10 messages
    }
    
    return render(request, 'main/home.html',context)

def about(request):
    team = Team.objects.filter(status=1).order_by('created_on')[0:4]
    brands = Client.objects.filter(status=1).order_by('created_on')
    testimonials = Testimonial.objects.filter(status=1).order_by('created_on')
    about = About.objects.filter(status=1).order_by('created_on')[0:1]
    specialty = What_specialty.objects.filter(status=1).order_by('created_on')[0:1]
    context = {
        'team': team,
        'brands': brands,
        'testimonials': testimonials,
        'about': about,
        'specialty': specialty,
    }
    
    return render(request, 'main/about.html',context)


def testimonials(request):
    # slider = Slider.objects.filter(status=1).order_by('created_on')[0:3]
    # fronts = Home_page.objects.filter(status=1).order_by('created_on')[0:1]
    # products = Product.objects.filter(is_available=True).order_by('-created_on')[0:8]
    # services = Services.objects.filter(status=1).order_by('created_on')[0:4]
    # context = {
    #     'fronts': fronts,
    #     'slider': slider,
    #     'products': products,
    #     'services': services,
    # }
    
    return render(request, 'main/testimonials.html')


def contact(request):
    if request.method == "POST":
        form = FeedbackForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            email = form.cleaned_data['email']
            phone = form.cleaned_data['phone']
            message = form.cleaned_data['message']
            full_name = form.cleaned_data['full_name']
            feedback = Feedback(full_name=full_name, subject=subject, email=email, phone=phone, message=message)
            feedback.save()
            msg_html = render_to_string('emails/email_template.html', {'subject': subject, 'full_name': full_name, 'email': email, 'phone': phone, 'message': message})
    
            send_mail(
                subject,
                message,
                email,
                [enqmail],
                html_message=msg_html,
            )
            messages.success(request, 'Your Message has been send sucessfully!')
            return redirect('contact')
    else:
        form = FeedbackForm()
        contacts = Contact.objects.filter(status=1).order_by('created_on')[0:1]
    
    context = {
        'contacts': contacts,
        'form': form,
    }
    
    return render(request, 'main/contact.html',context)


# def blogsearch(request):
#     if 'query' in request.GET:
#         query = request.GET['query']
#         if query:
#             posts = Post.objects.order_by('-created_on').filter(Q(content__icontains=query) | Q(title__icontains=query))
#             post_count = posts.count()
        
#         if not posts.exists():
#             messages.warning(request, 'No post found matching your keyword.')       
#     context = {
#         'posts': posts,
#         'post_count': post_count,
#     }
#     return render(request, 'main/blog-list.html', context)

def blogsearch(request):
    query = request.GET.get('query')
    posts = Post.objects.filter(status=1).order_by('-created_on')
    
    if query:
        query_list = query.split()
        posts = posts.filter(
            Q(title__icontains=query) |
            Q(content__icontains=query) |
            Q(category__category_name__in=query_list)
        ).distinct()
        post_count = posts.count()
        
    context = {
        'posts': posts,
        'post_count': post_count,
    }
    return render(request, 'main/blog-list.html', context)        
  


NEXTJS_SERVER = "https://ec-booking-pink.vercel.app"  # Adjust if necessary

def nextjs_proxy(request, path):
    """ Proxy Next.js static files (CSS, JS, etc.) from .next/static/ through Django """
    nextjs_url = f"{NEXTJS_SERVER}/.next/static/{path}"
    try:


        response = requests.get(nextjs_url, stream=True)
        if response.status_code == 200:
            return HttpResponse(
                response.content,
                status=200,
                content_type=response.headers.get("Content-Type"),
            )
        else:
            return HttpResponseNotFound(f"<h1>404 Not Found: {nextjs_url}</h1>")
    except requests.RequestException:
        return HttpResponseNotFound("<h1>Next.js Server Unreachable</h1>")

@csrf_exempt
def nextjs_page(request, path):
    """ Proxy Next.js pages (e.g., /events) through Django """
    nextjs_url = f"{NEXTJS_SERVER}/next/{path}"
    local_url = f"{request.scheme}://{request.get_host()}/next/events"
    print("🔄 Proxying request to:", nextjs_url)
    print("Method:", request.method)
    try:
        if request.method == "GET":
            for i in range(5):
                test_resp = requests.get(f"{NEXTJS_SERVER}/next/events", stream=True)
                if test_resp.status_code == 200:
                    break

                if i == 4:
                    return HttpResponseNotFound("<h1>Could not call /next/events locally after 5 tries.</h1>")
            response = requests.get(nextjs_url, stream=True)
            if response.status_code == 200:
                return HttpResponse(
                    response.content,
                    status=200,
                    content_type=response.headers.get("Content-Type"),
                )
            else:
                return HttpResponseNotFound(f"<h1>404 Not Found: {nextjs_url}</h1>")

        elif request.method == "POST":
            try:
                # Read raw JSON body
                data = json.loads(request.body.decode("utf-8"))  
                print("✅ Forwarding JSON Body:", data)
            except json.JSONDecodeError:
                return JSONResponse({"error": "Invalid JSON"}, status=400)

            # Forward request with correct JSON body
            headers = {"Content-Type": "application/json"}
            response = requests.post(nextjs_url, json=data, headers=headers)
            
            return JsonResponse(response.json(), status=response.status_code)

    except requests.RequestException as e:
        print("❌ Next.js Server Unreachable:", e)
        return HttpResponseNotFound("<h1>Next.js Server Unreachable</h1>")
    

def send_message(request):
    if request.method == 'POST':
        genai.configure(api_key=GENERATIVE_AI_KEY)
        model = genai.GenerativeModel("gemini-pro")

        user_message = request.POST.get('user_message')
        bot_response = model.generate_content(user_message)

        ChatMessage.objects.create(user_message=user_message, bot_response=bot_response.text)

        return JsonResponse({
            'status': 'success',
            'user_message': request.POST.get('user_message'),
            'bot_response': bot_response 
        })

    return JsonResponse({'error': 'Invalid request'}, status=400)

def list_messages(request):
    messages = ChatMessage.objects.all()
    return render(request, 'chatbot/list_messages.html', { 'messages': messages })


def products(request):
    products = Products.objects.filter(status=1).order_by('created_on')
    brands = Client.objects.filter(status=1).order_by('created_on')
    paginator = Paginator(products, 8)
    page = request.GET.get('page')
    paged_products = paginator.get_page(page)
    context = {
        'products': paged_products,
        'brands': brands,
    }
    return render(request, 'main/products.html', context)

def product_detail(request, product_slug):
    single_product = get_object_or_404(Products, slug=product_slug)
    context = {
        'single_product': single_product,
    }
    return render(request, 'main/product_detail.html', context)