from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseRedirect
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from .forms import JobApplicationForm
from jobsapp.models import Job,Applicant,Sector,Skill,City,Work_mode,Job_type
from django.contrib import messages,auth
from django.core.mail import send_mail
from django.core.mail import EmailMessage
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.db.models import Q
from accounts.mymail import get_enqmail
enqmail = get_enqmail()
# Create your views here.
def jobpost(request,sector_slug=None):
    sectors = None
    jobs = None
    if sector_slug != None:
        sectors = get_object_or_404(Sector, slug=sector_slug)
        jobs = Job.objects.filter(sector=sectors, status=1).order_by('-created_on')
        paginator = Paginator(jobs, 9)
        page = request.GET.get('page')
        paged_jobs = paginator.get_page(page)
        job_count = jobs.count()
    else:
        jobs = Job.objects.filter(status=1).order_by('-created_on')
        paginator = Paginator(jobs, 4)
        page = request.GET.get('page')
        paged_jobs = paginator.get_page(page)
        job_count = jobs.count()
        # category_filter = request.GET.get('category')
        # feature_filter = request.GET.getlist('feature')
        city_filter = request.GET.get('city')
        work_mode_filter = request.GET.get('work_mode')
        sector_filter = request.GET.get('sector')
        job_type_filter = request.GET.get('job_type')
        
        if city_filter:
            jobs = jobs.filter(city__city_name=city_filter)
            
        if work_mode_filter:
            jobs = jobs.filter(work_mode__name=work_mode_filter)
            
        if sector_filter:
            jobs = jobs.filter(sector__sector_name=sector_filter)
            
        if job_type_filter:
            jobs = jobs.filter(job_type__name=job_type_filter)         
            
        if not jobs.exists():
            messages.warning(request, 'No job found matching your criteria.')        
        
    # location_type_filter = request.GET.get('location_type')
    context = {
        'jobs': paged_jobs,
        'job_count': job_count,
        'modes': Work_mode.objects.all(),
        'cities': City.objects.all(),
        'sectors': Sector.objects.all(),
        'jobtypes': Job_type.objects.all(),
    }
   
    return render(request, 'main/job_list.html',context)


# def job_detail(request,job_slug):
#     try:
#         single_job = get_object_or_404(Job, slug=job_slug)
#         jobs = Job.objects.filter(is_available=True).order_by('-created_on')[0:8]
#         context ={
#             'single_job': single_job,
#             # 'jobs': jobs,
#         }
    
#         return render(request, 'main/job_details.html', context)
#     except:
#         return HttpResponseNotFound("<h1>This url is not found</h1>")
    
    
def job_detail(request,job_slug):
    single_job = get_object_or_404(Job, slug=job_slug)
    jobs = Job.objects.filter(status=1).order_by('-created_on')[0:8]
    context ={
        'single_job': single_job,
        'jobs': jobs,
        'current_slug':job_slug,
    }

    return render(request, 'main/job_details.html', context) 




# def send_job_application_email(application_data):
#     email_html_message = render_to_string('job_application_email.html', application_data)

#     email = EmailMessage(
#         'New Job Application for {}'.format(application_data['job_name']),
#         email_html_message,
#         # 'sender@example.com',  # From
#         ['dharmendrayadav076@gmail.com'],  # To
#     )
#     email.content_subtype = "html"  # Set content to HTML

#     # Attach the resume if it's present
#     if 'resume' in application_data and hasattr(application_data['resume'], 'path'):
#         with open(application_data['resume'].path, 'rb') as f:
#             email.attach('Resume-{}-{}.pdf'.format(application_data['first_name'], application_data['last_name']), f.read(), 'application/pdf')

#     email.send()


def apply_job(request,job_slug):
    job = get_object_or_404(Job, slug=job_slug)
    # jobs = Job.objects.filter(status=1).order_by('-created_on')[0:8]
    if request.method == "POST":
        if request.POST.get('employee_type') == 'experienced':
            form = JobApplicationForm (request.POST,request.FILES)
        else:
            form = JobApplicationForm (request.POST,request.FILES)
        if form.is_valid():
            application = form.save(commit=False)
            application.job = job
            application.save()
            current_site = get_current_site(request)
            # Send Email
            subject = "New job application from {}".format(application.first_name)
            msg_html = render_to_string('emails/job_application_email.html', 
                                        {'first_name': application.first_name, 'last_name': application.last_name, 'email': application.email, 'phone': application.applicant_phone, 'gender': application.gender,
                                         'job_name': application.job_name, 'qualification': application.qualification, 'skills': application.skills, 'position': application.applicant_position, 'relocated': application.is_relocated,
                                         'resume': application.resume,'cover_letter': application.cover_letter,'location': application.applicant_location,'domain': current_site,'employee_type': application.employee_type,
                                         'experience': application.working_experience,'country': application.applicant_country,'state': application.applicant_state,'city': application.applicant_city,'address': application.applicant_address,
                                         'last_company': application.last_company_name,'last_designation': application.last_company_designation,'current_ctc': application.current_ctc,'last_ctc': application.last_ctc,
                                         }
                                        )
        
            send_mail(
                subject,
                application.email,
                application.applicant_phone,
                [enqmail],
                html_message=msg_html,
            )
            messages.success(request, 'Your Job Application has been successfully! submited')
            return redirect('jobpost')  # Redirect to wherever you want after applying
    else:
        form = JobApplicationForm ()
    
    
    context ={
        'job': job,
        'form': form,
    }

    return render(request, 'main/apply_job.html', context) 


def applicant_detail(request, applicant_id):
    applicant = get_object_or_404(Applicant, id=applicant_id)
    return render(request, 'main/applicant_detail.html', {'applicant': applicant})


# def search(request):
#     if 'keyword' in request.GET:
#         keyword = request.GET['keyword']
#         if keyword:
#             jobs = Job.objects.order_by('-created_on').filter(Q(job_title__icontains=keyword))
#             job_count = jobs.count()
#     context = {
#         'jobs': jobs,
#         'job_count': job_count,
#     }
#     return render(request, 'main/joblist.html', context)

def search(request):
    query = request.GET.get('query')
    # jobs = Job.objects.all()
    jobs = Job.objects.filter(status=1).order_by('-created_on')

    if query:
        query_list = query.split()
        jobs = jobs.filter(
            Q(job_title__icontains=query) |
            Q(description__icontains=query) |
            Q(city__city_name__in=query_list) |
            Q(skills_required__skill_name__in=query_list) |
            Q(work_mode__name__in=query_list) |
            Q(sector__sector_name__icontains=query) |
            Q(state__state_name__icontains=query) |
            Q(country__country_name__in=query_list) |
            Q(experience__name__icontains=query) |
            Q(company__company_name__icontains=query) |
            Q(job_type__name__icontains=query)
        ).distinct()
        # job_count = jobs.count()
    #Search Filter     
    city_filter = request.GET.get('city')
    work_mode_filter = request.GET.get('work_mode')
    sector_filter = request.GET.get('sector')
    job_type_filter = request.GET.get('job_type')
    
    if city_filter:
        jobs = jobs.filter(city__city_name=city_filter)
        # job_count = jobs.count()
        
    if work_mode_filter:
        jobs = jobs.filter(work_mode__name=work_mode_filter)
        # job_count = jobs.count()
        
    if sector_filter:
            jobs = jobs.filter(sector__sector_name=sector_filter)
            # job_count = jobs.count()
            
    if job_type_filter:
        jobs = jobs.filter(job_type__name=job_type_filter)
        # job_count = jobs.count()      
        
    if not jobs.exists():
        messages.warning(request, 'No job found matching your criteria.')
        
    context = {
        'jobs':jobs,
        # 'job_count': job_count,
        'modes': Work_mode.objects.all(),
        'cities': City.objects.all(),
        'sectors': Sector.objects.all(),
        'jobtypes': Job_type.objects.all(),
    }         

    return render(request, 'main/job_list.html',context)
