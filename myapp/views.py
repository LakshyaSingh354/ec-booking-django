from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
import requests
from myapp.models import Services,Client,Services_enquiry
from django.contrib import messages,auth
from django.core.mail import send_mail
from datetime import datetime
from django.template.loader import render_to_string
# Create your views here.

from accounts.mymail import get_enqmail
enqmail = get_enqmail()

ALLOWED_HOSTS = ['localhost', 'www.epitomeconsultancy.com', 'epitomeconsultancy.com', '127.0.0.1']
NEXTJS_SERVER = "https://ec-booking-pink.vercel.app"

def services(request):
    services = Services.objects.filter(status=1).order_by('created_on')
    brands = Client.objects.filter(status=1).order_by('created_on')
    paginator = Paginator(services, 8)
    page = request.GET.get('page')
    paged_services = paginator.get_page(page)
    context = {
        'services': paged_services,
        'brands': brands,
    }
   
    return render(request, 'main/services.html',context)


def service_detail(request,service_slug):
    # try:
    #     single_service = get_object_or_404(Services, slug=service_slug)
    #     context ={
    #         'single_service': single_service,
    #     }
    
    #     return render(request, 'main/service_detail.html', context)
    # except:
    #     return HttpResponseNotFound("<h1>This url is not found</h1>")

     single_service = get_object_or_404(Services, slug=service_slug)
     context ={
         'single_service': single_service,
     }
 
     return render(request, 'main/service_detail.html', context)
    
def inquiry(request):
    # print(enqmail)
    # services = get_object_or_404(Services)
    if request.method == 'POST':
        services_id = request.POST['services_id']
        services_title = request.POST['services_title']
        services_url = request.POST['services_url']
        user_id = request.POST['user_id']
        full_name = request.POST['full_name']
        email = request.POST['email']
        phone = request.POST['phone']
        message = request.POST['message']
        # services = request.POST['services']
        
        if request.user.is_authenticated:
            user_id = request.user.id
            has_contacted = Services_enquiry.objects.all().filter(services_id=services_id,services_url=services_url, user_id=user_id)
            if has_contacted:
                messages.error(request, 'You have already made an inquiry about this product. Please wait until we get back to you.')
                return redirect('/services/'+services_url+'/')
            
        contact = Services_enquiry(services_id=services_id,services_title=services_title, services_url=services_url, user_id=user_id,
        full_name=full_name,
        email=email, phone=phone, message=message, create_date= datetime.today())    
        contact.save()
        data = {
            'full_name':full_name,
            'email':email,
            'phone':phone,
            'services_title':services_title,
            'services_url':services_url,
            'message':message,
        }
        message = '''
        Name:\t{}\n
        Phone:\t{}\n
        Email:\t{}\n
        Services:\t{}\n
        Services_url:\t{}\n
        Message:\t{}\n
        '''.format(data['full_name'], data['phone'],  data['email'], data['services_title'], data['services_url'], data['message'],)
        send_mail('New Services Inquiry', message, '', [enqmail])
        messages.success(request, 'Your request has been submitted, we will get back to you shortly.')
        return redirect('/services/'+services_url+'/') 
    
    
    # send_mail('New Services Inquiry', message, '', ['<saggy22108906@gmail.com>'])


def nextjs_page(request, path):
    """Proxy Next.js pages through Django"""
    nextjs_url = f"{NEXTJS_SERVER}/{path}"
    response = requests.get(nextjs_url)
    
    if response.status_code == 200:
        return HttpResponse(response.content, content_type="text/html")
    else:
        return HttpResponseNotFound("<h1>Page Not Found</h1>")