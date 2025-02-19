from django.shortcuts import render, redirect, get_object_or_404
from .forms import*
from django.contrib import messages,auth
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse
from django.core.exceptions import PermissionDenied
# Verification email
from .utils import detectUser, send_verification_email
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
from django.core.mail import EmailMessage
from django.template.defaultfilters import slugify
from datetime import datetime
import datetime
####Admin View
from accounts.models import EmailSetting
from django.http import JsonResponse
from accounts.views import check_role_myadmin,check_role_customer
from myapp.models import*
from myapp.forms import*
from jobsapp.models import*
from jobsapp.forms import*
from blog.models import*
from blog.forms import*




@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def enquiry_list(request):
    enquiry = Services_enquiry.objects.all().order_by('-id')
    context = {
        'enquiry': enquiry,
    }

    return render(request, 'myadmin/enquiry_list.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def enquiry_detail(request,pk=None):
    # enquiry=Product_enquiry.objects.get(pk=id)
    enquiry = get_object_or_404(Services_enquiry, pk=pk)
    context = {
        'enquiry': enquiry,
    }

    return render(request, 'myadmin/enquiry_detail.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def delete_enquiry(request, pk=None):
    enquiry = get_object_or_404(Services_enquiry, pk=pk)
    enquiry.delete()
    messages.success(request, 'Enquiry has been deleted successfully!')
    return redirect('enquiry_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def feedback_list(request):
    feedback = Feedback.objects.all().order_by('-id')
    context = {
        'feedback': feedback,
    }

    return render(request, 'myadmin/feedback_list.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def feedback_detail(request,pk=None):
    # enquiry=Product_enquiry.objects.get(pk=id)
    feedback = get_object_or_404(Feedback, pk=pk)
    context = {
        'feedback': feedback,
    }

    return render(request, 'myadmin/feedback_detail.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def delete_feedback(request, pk=None):
    feedback = get_object_or_404(Feedback, pk=pk)
    feedback.delete()
    messages.success(request, 'Feedback has been deleted successfully!')
    return redirect('feedback_list')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_services(request):
    if request.method == 'POST':
        form = ServicesForm(request.POST, request.FILES)
        if form.is_valid():
            servicesname = form.cleaned_data['service_name']
            sform = form.save(commit=False)
            sform.slug = slugify(servicesname )
            sform.save()
            messages.success(request, 'Services added successfully!')
            return redirect('maservices_list')
        else:
            print(form.errors)
    else:
        form = ServicesForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_services.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_services(request,pk=None):
    service = get_object_or_404(Services, pk=pk)
    if request.method == 'POST':
        form = ServicesForm(request.POST, request.FILES,instance=service)
        if form.is_valid():
            servicesname = form.cleaned_data['service_name']
            sform = form.save(commit=False)
            sform.slug = slugify(servicesname )
            sform.save()
            messages.success(request, 'Services has been updated successfully!')
            return redirect('maservices_list')
        else:
            print(form.errors)
    else:
        form = ServicesForm(instance=service)
    context = {
        'form': form,
        'service': service,
    }
    return render(request, 'myadmin/edit_services.html',context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def maservices_list(request):
    # products = Product.objects.all().filter(is_available=True)[0:8]
    services = Services.objects.all().order_by('id')
    context = {
        'services': services,
    }

    return render(request, 'myadmin/services_list.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def delete_services(request, pk=None):
    service = get_object_or_404(Services, pk=pk)
    service.delete()
    messages.success(request, 'Service has been deleted successfully!')
    return redirect('maservices_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_services_detail(request):
    if request.method == 'POST':
        form = ServicesDetailForm(request.POST, request.FILES)
        if form.is_valid():
            # servicesname = form.cleaned_data['service_name']
            sform = form.save(commit=False)
            sform.save()
            messages.success(request, 'Services Details added successfully!')
            return redirect('maservices_list')
        else:
            print(form.errors)
    else:
        form = ServicesDetailForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_services_detail.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_services_detail(request,pk=None):
    service_detail = get_object_or_404(Service_detail, pk=pk)
    if request.method == 'POST':
        form = ServicesDetailForm(request.POST, request.FILES,instance=service_detail)
        if form.is_valid():
            # servicesname = form.cleaned_data['service_name']
            sform = form.save(commit=False)
            sform.save()
            messages.success(request, 'Services detail has been updated successfully!')
            return redirect('maservices_list')
        else:
            print(form.errors)
    else:
        form = ServicesDetailForm(instance=service_detail)
    context = {
        'form': form,
        'service_detail': service_detail,
    }
    return render(request, 'myadmin/edit_services_detail.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def maservices_detail_list(request):
    # products = Product.objects.all().filter(is_available=True)[0:8]
    services = Service_detail.objects.all().order_by('id')
    context = {
        'services': services,
    }

    return render(request, 'myadmin/services_detail_list.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def delete_services_detail(request, pk=None):
    service = get_object_or_404(Service_detail, pk=pk)
    service.delete()
    messages.success(request, 'Service Details has been deleted successfully!')
    return redirect('maservices_detail_list')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_jobpost(request):
    if request.method == 'POST':
        form = JobPostForm(request.POST,request.FILES)
        if form.is_valid():
            jobname = form.cleaned_data['job_title']
            job = form.save(commit=False)
            job.slug = slugify(jobname)
            form.save()
            messages.success(request, 'job post added successfully!')
            return redirect('job_list')
        else:
            print(form.errors)
    else:
        form = JobPostForm()
        # modify this form
        # form.fields['category'].queryset = Category.objects.filter(vendor=get_vendor(request))
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_jobpost.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_jobpost(request,pk=None):
    jobpost = get_object_or_404(Job, pk=pk)
    if request.method == 'POST':
        form = JobPostForm(request.POST,request.FILES,instance=jobpost)
        if form.is_valid():
            jobname = form.cleaned_data['job_title']
            job = form.save(commit=False)
            job.slug = slugify(jobname)
            form.save()
            messages.success(request, 'job post updated successfully!')
            return redirect('job_list')
        else:
            print(form.errors)
    else:
        form = JobPostForm(instance=jobpost)
        # modify this form
    context = {
        'form': form,
        'jobpost': jobpost,
    }
    return render(request, 'myadmin/edit_jobpost.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def job_list(request):
    jobs = Job.objects.all().order_by('-id')
    context = {
        'jobs': jobs,
    }

    return render(request, 'myadmin/jobpost_list.html', context)
@login_required(login_url='login')

@user_passes_test(check_role_myadmin)
def delete_jobpost(request, pk=None):
    jobpost = get_object_or_404(Job, pk=pk)
    jobpost.delete()
    messages.success(request, 'Jobpost has been deleted successfully!')
    return redirect('job_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def applicant_list(request):
    applicant = Applicant.objects.all().order_by('-id')
    context = {
        'applicant': applicant,
    }

    return render(request, 'myadmin/applicant_list.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def myapplicant_detail(request,pk=None):
    # enquiry=Product_enquiry.objects.get(pk=id)
    applicant = get_object_or_404(Applicant, pk=pk)
    context = {
        'applicant': applicant,
    }

    return render(request, 'myadmin/applicant_detail.html', context)

@user_passes_test(check_role_myadmin)
def delete_applicant(request, pk=None):
    applicant = get_object_or_404(Applicant, pk=pk)
    applicant.delete()
    messages.success(request, 'Applicant has been deleted successfully!')
    return redirect('applicant_list')




@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_country(request):
    country = Country.objects.all().order_by('-id')
    if request.method == 'POST':
        form = CountryForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['country_name']
            country = form.save(commit=False)
            country.slug = slugify(name)
            form.save()
            messages.success(request, 'Country added successfully!')
            return redirect('add_country')
        else:
            print(form.errors)
    else:
        form = CountryForm()
    context = {
        'form': form,
        'country': country,
    }
    return render(request, 'myadmin/country_list.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_country(request,pk=None):
    country = Country.objects.all().order_by('-id')
    mycountry = get_object_or_404(Country, pk=pk)
    if request.method == 'POST':
        form = CountryForm(request.POST,request.FILES,instance=mycountry)
        if form.is_valid():
            name = form.cleaned_data['country_name']
            country = form.save(commit=False)
            country.slug = slugify(name)
            form.save()
            messages.success(request, 'Country Updated successfully!')
            return redirect('add_country')
        else:
            print(form.errors)
    else:
        form = CountryForm(instance=mycountry)
    context = {
        'form': form,
        'country': country,
        'mycountry': mycountry,
    }
    return render(request, 'myadmin/edit_country.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def country_list(request):
    country = Country.objects.all().order_by('-id')
    context = {
        'country': country,
    }

    return render(request, 'myadmin/country_list.html', context)

@user_passes_test(check_role_myadmin)
def delete_country(request, pk=None):
    country = get_object_or_404(Country, pk=pk)
    country.delete()
    messages.success(request, 'Country has been deleted successfully!')
    return redirect('add_country')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_state(request):
    state = State.objects.all().order_by('-id')
    if request.method == 'POST':
        form = StateForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['state_name']
            sta = form.save(commit=False)
            sta.slug = slugify(name)
            form.save()
            messages.success(request, 'State  added successfully!')
            return redirect('add_state')
        else:
            print(form.errors)
    else:
        form = StateForm()
    context = {
        'form': form,
        'state': state,
    }
    return render(request, 'myadmin/add_state.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_state(request,pk=None):
    state = State.objects.all().order_by('-id')
    mystate = get_object_or_404(State, pk=pk)
    if request.method == 'POST':
        form = StateForm(request.POST,request.FILES, instance=mystate)
        if form.is_valid():
            name = form.cleaned_data['state_name']
            sta = form.save(commit=False)
            sta.slug = slugify(name)
            form.save()
            messages.success(request, 'State  Update successfully!')
            return redirect('add_state')
        else:
            print(form.errors)
    else:
        form = StateForm(instance=mystate)
    context = {
        'form': form,
        'state': state,
        'mystate': mystate,
    }
    return render(request, 'myadmin/edit_state.html', context)


@user_passes_test(check_role_myadmin)
def delete_state(request, pk=None):
    state = get_object_or_404(State, pk=pk)
    state.delete()
    messages.success(request, 'State has been deleted successfully!')
    return redirect('add_state')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_city(request):
    city = City.objects.all().order_by('-id')
    if request.method == 'POST':
        form = CityForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['city_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'City  added successfully!')
            return redirect('add_city')
        else:
            print(form.errors)
    else:
        form = CityForm()
    context = {
        'form': form,
        'city': city,
    }
    return render(request, 'myadmin/add_city.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_city(request,pk=None):
    city = City.objects.all().order_by('-id')
    mycity = get_object_or_404(City, pk=pk)
    if request.method == 'POST':
        form = CityForm(request.POST,request.FILES, instance=mycity)
        if form.is_valid():
            name = form.cleaned_data['city_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'City  Update successfully!')
            return redirect('add_city')
        else:
            print(form.errors)
    else:
        form = CityForm(instance=mycity)
    context = {
        'form': form,
        'city': city,
        'mycity': mycity,
    }
    return render(request, 'myadmin/edit_city.html', context)


@user_passes_test(check_role_myadmin)
def delete_city(request, pk=None):
    city = get_object_or_404(City, pk=pk)
    city.delete()
    messages.success(request, 'City has been deleted successfully!')
    return redirect('add_city')

##

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_sector(request):
    sector = Sector.objects.all().order_by('-id')
    if request.method == 'POST':
        form = SectorForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['sector_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Sector added successfully!')
            return redirect('add_sector')
        else:
            print(form.errors)
    else:
        form = SectorForm()
    context = {
        'form': form,
        'sector': sector,
    }
    return render(request, 'myadmin/add_sector.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_sector(request,pk=None):
    sector = Sector.objects.all().order_by('-id')
    mysector = get_object_or_404(Sector, pk=pk)
    if request.method == 'POST':
        form = SectorForm(request.POST,request.FILES, instance=mysector)
        if form.is_valid():
            name = form.cleaned_data['sector_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Sector  Update successfully!')
            return redirect('add_sector')
        else:
            print(form.errors)
    else:
        form = SectorForm(instance=mysector)
    context = {
        'form': form,
        'sector': sector,
        'mysector': mysector,
    }
    return render(request, 'myadmin/edit_sector.html', context)


@user_passes_test(check_role_myadmin)
def delete_sector(request, pk=None):
    sector = get_object_or_404(Sector, pk=pk)
    sector.delete()
    messages.success(request, 'Sector has been deleted successfully!')
    return redirect('add_sector')


#Company
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def company_list(request):
    company = Company.objects.all().order_by('-id')
    
    context = {
        'company': company,
    }
    return render(request, 'myadmin/company_list.html', context)
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_company(request):
    company = Company.objects.all().order_by('-id')
    if request.method == 'POST':
        form = CompanyForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['company_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Company added successfully!')
            return redirect('company_list')
        else:
            print(form.errors)
    else:
        form = CompanyForm()
    context = {
        'form': form,
        'company': company,
    }
    return render(request, 'myadmin/add_company.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_company(request,pk=None):
    mycompany = get_object_or_404(Company, pk=pk)
    if request.method == 'POST':
        form = CompanyForm(request.POST,request.FILES, instance=mycompany)
        if form.is_valid():
            name = form.cleaned_data['company_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Company Update successfully!')
            return redirect('company_list')
        else:
            print(form.errors)
    else:
        form = CompanyForm(instance=mycompany)
    context = {
        'form': form,
        'mycompany': mycompany,
    }
    return render(request, 'myadmin/edit_company.html', context)


@user_passes_test(check_role_myadmin)
def delete_company(request, pk=None):
    company = get_object_or_404(Company, pk=pk)
    company.delete()
    messages.success(request, 'Company has been deleted successfully!')
    return redirect('company_list')


##Job Type
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_jobtype(request):
    jobtype = Job_type.objects.all().order_by('-id')
    if request.method == 'POST':
        form = Job_typeForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Type added successfully!')
            return redirect('add_jobtype')
        else:
            print(form.errors)
    else:
        form = Job_typeForm()
    context = {
        'form': form,
        'jobtype': jobtype,
    }
    return render(request, 'myadmin/add_jobtype.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_jobtype(request,pk=None):
    jobtype = Job_type.objects.all().order_by('-id')
    myjobtype = get_object_or_404(Job_type, pk=pk)
    if request.method == 'POST':
        form = Job_typeForm(request.POST,request.FILES, instance=myjobtype)
        if form.is_valid():
            name = form.cleaned_data['name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Type  Update successfully!')
            return redirect('add_jobtype')
        else:
            print(form.errors)
    else:
        form = Job_typeForm(instance=myjobtype)
    context = {
        'form': form,
        'jobtype': jobtype,
        'myjobtype': myjobtype,
    }
    return render(request, 'myadmin/edit_jobtype.html', context)


@user_passes_test(check_role_myadmin)
def delete_jobtype(request, pk=None):
    jobtype = get_object_or_404(Job_type, pk=pk)
    jobtype.delete()
    messages.success(request, 'Job Type has been deleted successfully!')
    return redirect('add_jobtype')

##WorkMode
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_workmode(request):
    workmode = Work_mode.objects.all().order_by('-id')
    if request.method == 'POST':
        form = Work_modeForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Work Mode added successfully!')
            return redirect('add_workmode')
        else:
            print(form.errors)
    else:
        form = Work_modeForm()
    context = {
        'form': form,
        'workmode': workmode,
    }
    return render(request, 'myadmin/add_workmode.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_workmode(request,pk=None):
    workmode = Work_mode.objects.all().order_by('-id')
    myworkmode = get_object_or_404(Work_mode, pk=pk)
    if request.method == 'POST':
        form = Work_modeForm(request.POST,request.FILES, instance=myworkmode)
        if form.is_valid():
            name = form.cleaned_data['name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Work Mode Update successfully!')
            return redirect('add_workmode')
        else:
            print(form.errors)
    else:
        form = Work_modeForm(instance=myworkmode)
    context = {
        'form': form,
        'workmode': workmode,
        'myworkmode': myworkmode,
    }
    return render(request, 'myadmin/edit_myworkmode.html', context)


@user_passes_test(check_role_myadmin)
def delete_workmode(request, pk=None):
    workmode = get_object_or_404(Work_mode, pk=pk)
    workmode.delete()
    messages.success(request, 'Work mode has been deleted successfully!')
    return redirect('add_workmode')

##Job categorye
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_jobcategory(request):
    jobcategory = Job_category.objects.all().order_by('-id')
    if request.method == 'POST':
        form = Job_categoryForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['category_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job category added successfully!')
            return redirect('add_jobcategory')
        else:
            print(form.errors)
    else:
        form = Job_categoryForm()
    context = {
        'form': form,
        'jobcategory': jobcategory,
    }
    return render(request, 'myadmin/add_jobcategory.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_jobcategory (request,pk=None):
    jobcategory  = Job_category.objects.all().order_by('-id')
    myjobcategory  = get_object_or_404(Job_category, pk=pk)
    if request.method == 'POST':
        form = Job_categoryForm(request.POST,request.FILES, instance=myjobcategory)
        if form.is_valid():
            name = form.cleaned_data['category_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job category Update successfully!')
            return redirect('add_jobcategory')
        else:
            print(form.errors)
    else:
        form = Job_categoryForm(instance=myjobcategory)
    context = {
        'form': form,
        'jobcategory': jobcategory,
        'myjobcategory': myjobcategory,
    }
    return render(request, 'myadmin/edit_jobcategory.html', context)


@user_passes_test(check_role_myadmin)
def delete_jobcategory(request, pk=None):
    jobcategory = get_object_or_404(Job_category, pk=pk)
    jobcategory.delete()
    messages.success(request, 'Job category has been deleted successfully!')
    return redirect('add_jobcategory')

##Job Role
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_jobrole(request):
    jobrole = Job_role.objects.all().order_by('-id')
    if request.method == 'POST':
        form = Job_roleForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['role_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Role added successfully!')
            return redirect('add_jobrole')
        else:
            print(form.errors)
    else:
        form = Job_roleForm()
    context = {
        'form': form,
        'jobrole': jobrole,
    }
    return render(request, 'myadmin/add_jobrole.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_jobrole (request,pk=None):
    jobrole  = Job_role.objects.all().order_by('-id')
    myjobrole  = get_object_or_404(Job_role, pk=pk)
    if request.method == 'POST':
        form = Job_roleForm(request.POST,request.FILES, instance=myjobrole)
        if form.is_valid():
            name = form.cleaned_data['role_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Role Update successfully!')
            return redirect('add_jobrole')
        else:
            print(form.errors)
    else:
        form = Job_roleForm(instance=myjobrole)
    context = {
        'form': form,
        'jobrole': jobrole,
        'myjobrole': myjobrole,
    }
    return render(request, 'myadmin/edit_jobrole.html', context)


@user_passes_test(check_role_myadmin)
def delete_jobrole(request, pk=None):
    jobrole = get_object_or_404(Job_role, pk=pk)
    jobrole.delete()
    messages.success(request, 'Job Role has been deleted successfully!')
    return redirect('add_jobrole')

##Skill
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_skill(request):
    skill = Skill.objects.all().order_by('-id')
    if request.method == 'POST':
        form = SkillForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['skill_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Skill added successfully!')
            return redirect('add_skill')
        else:
            print(form.errors)
    else:
        form = SkillForm()
    context = {
        'form': form,
        'skill': skill,
    }
    return render(request, 'myadmin/add_skill.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_skill (request,pk=None):
    skill  = Skill.objects.all().order_by('-id')
    myskill  = get_object_or_404(Skill, pk=pk)
    if request.method == 'POST':
        form = SkillForm(request.POST,request.FILES, instance=myskill)
        if form.is_valid():
            name = form.cleaned_data['skill_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Skill Update successfully!')
            return redirect('add_skill')
        else:
            print(form.errors)
    else:
        form = SkillForm(instance=myskill)
    context = {
        'form': form,
        'skill': skill,
        'myskill': myskill,
    }
    return render(request, 'myadmin/edit_skill.html', context)


@user_passes_test(check_role_myadmin)
def delete_skill(request, pk=None):
    skill = get_object_or_404(Skill, pk=pk)
    skill.delete()
    messages.success(request, 'Skill has been deleted successfully!')
    return redirect('add_skill')


##Education
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_education(request):
    edu = Education.objects.all().order_by('-id')
    if request.method == 'POST':
        form = EducationForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['education_name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Education added successfully!')
            return redirect('add_education')
        else:
            print(form.errors)
    else:
        form = EducationForm()
    context = {
        'form': form,
        'edu': edu,
    }
    return render(request, 'myadmin/add_education.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_education(request,pk=None):
    edu  = Education.objects.all().order_by('-id')
    myedu  = get_object_or_404(Education, pk=pk)
    if request.method == 'POST':
        form = EducationForm(request.POST,request.FILES, instance=myedu)
        if form.is_valid():
            name = form.cleaned_data['education_name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Education Update successfully!')
            return redirect('add_education')
        else:
            print(form.errors)
    else:
        form = EducationForm(instance=myedu)
    context = {
        'form': form,
        'edu': edu,
        'myedu': myedu,
    }
    return render(request, 'myadmin/edit_education.html', context)


@user_passes_test(check_role_myadmin)
def delete_education(request, pk=None):
    edu = get_object_or_404(Education, pk=pk)
    edu.delete()
    messages.success(request, 'Education has been deleted successfully!')
    return redirect('add_education')

##Experience
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_experience(request):
    exp= Experience.objects.all().order_by('-id')
    if request.method == 'POST':
        form = ExperienceForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Experience added successfully!')
            return redirect('add_experience')
        else:
            print(form.errors)
    else:
        form = ExperienceForm()
    context = {
        'form': form,
        'exp': exp,
    }
    return render(request, 'myadmin/add_experience.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_experience(request,pk=None):
    exp  = Experience.objects.all().order_by('-id')
    myexp  = get_object_or_404(Experience, pk=pk)
    if request.method == 'POST':
        form = ExperienceForm(request.POST,request.FILES, instance=myexp)
        if form.is_valid():
            name = form.cleaned_data['name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Experience Update successfully!')
            return redirect('add_experience')
        else:
            print(form.errors)
    else:
        form = ExperienceForm(instance=myexp)
    context = {
        'form': form,
        'exp': exp,
        'myexp': myexp,
    }
    return render(request, 'myadmin/edit_experience.html', context)

@user_passes_test(check_role_myadmin)
def delete_experience(request, pk=None):
    exp = get_object_or_404(Experience, pk=pk)
    exp.delete()
    messages.success(request, 'Experience has been deleted successfully!')
    return redirect('add_experience')

##Position
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_position(request):
    position= Position.objects.all().order_by('-id')
    if request.method == 'POST':
        form = PositionForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['name']
            cty = form.save(commit=False)
            cty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Position added successfully!')
            return redirect('add_position')
        else:
            print(form.errors)
    else:
        form = PositionForm()
    context = {
        'form': form,
        'position': position,
    }
    return render(request, 'myadmin/add_position.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_position(request,pk=None):
    position  = Position.objects.all().order_by('-id')
    myposition = get_object_or_404(Position, pk=pk)
    if request.method == 'POST':
        form = PositionForm(request.POST,request.FILES, instance=myposition)
        if form.is_valid():
            name = form.cleaned_data['name']
            sty = form.save(commit=False)
            sty.slug = slugify(name)
            form.save()
            messages.success(request, 'Job Position Update successfully!')
            return redirect('add_position')
        else:
            print(form.errors)
    else:
        form = PositionForm(instance=myposition)
    context = {
        'form': form,
        'position': position,
        'myposition': myposition,
    }
    return render(request, 'myadmin/edit_position.html', context)

@user_passes_test(check_role_myadmin)
def delete_position(request, pk=None):
    position = get_object_or_404(Position, pk=pk)
    position.delete()
    messages.success(request, 'Job Position has been deleted successfully!')
    return redirect('add_position')

#About US Static 
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_about(request):
    # about = get_object_or_404(About, pk=pk)
    about = About.objects.first()
    if request.method == 'POST':
        form = AboutForm(request.POST,request.FILES,instance=about)
        if form.is_valid():
            abt = form.save(commit=False)
            abt.save()
            messages.success(request, 'About Us updated successfully!')
            return redirect('edit_about')
        else:
            print(form.errors)
    else:
        form = AboutForm(instance=about)
        # modify this form
    context = {
        'form': form,
    }
    return render(request, 'myadmin/edit_about.html', context)

#What_specialty
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_specialty(request):
    # about = get_object_or_404(About, pk=pk)
    about = What_specialty.objects.first()
    if request.method == 'POST':
        form = SpecialtyForm(request.POST,request.FILES,instance=about)
        if form.is_valid():
            abt = form.save(commit=False)
            abt.save()
            messages.success(request, 'What specialty updated successfully!')
            return redirect('edit_specialty')
        else:
            print(form.errors)
    else:
        form = SpecialtyForm(instance=about)
        # modify this form
    context = {
        'form': form,
    }
    return render(request, 'myadmin/edit_specialty.html', context)

##Team
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_team(request):
    if request.method == 'POST':
        form = TeamForm(request.POST,request.FILES)
        if form.is_valid():
            name = form.cleaned_data['team_name']
            tm = form.save(commit=False)
            tm.slug = slugify(name)
            form.save()
            messages.success(request, 'Team added successfully!')
            return redirect('team_list')
        else:
            print(form.errors)
    else:
        form = TeamForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_team.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_team(request,pk=None):
    myteam = get_object_or_404(Team, pk=pk)
    if request.method == 'POST':
        form = TeamForm(request.POST,request.FILES, instance=myteam)
        if form.is_valid():
            name = form.cleaned_data['team_name']
            tm = form.save(commit=False)
            tm.slug = slugify(name)
            form.save()
            messages.success(request, 'Team Update successfully!')
            return redirect('team_list')
        else:
            print(form.errors)
    else:
        form = TeamForm(instance=myteam)
    context = {
        'form': form,
        'myteam': myteam,
    }
    return render(request, 'myadmin/edit_team.html', context)

@user_passes_test(check_role_myadmin)
def delete_team(request, pk=None):
    team = get_object_or_404(Team, pk=pk)
    team.delete()
    messages.success(request, 'Team has been deleted successfully!')
    return redirect('team_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def team_list(request):
    team = Team.objects.all().order_by('-id')
    
    context = {
        'team': team,
    }
    return render(request, 'myadmin/team_list.html', context)

##Testimonial
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_testimonial(request):
    if request.method == 'POST':
        form = TestimonialForm(request.POST,request.FILES)
        if form.is_valid():
            tm = form.save(commit=False)
            tm.save()
            messages.success(request, 'Testimonial added successfully!')
            return redirect('testimonial_list')
        else:
            print(form.errors)
    else:
        form = TestimonialForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_testimonial.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_testimonial(request,pk=None):
    mytestimonial = get_object_or_404(Testimonial, pk=pk)
    if request.method == 'POST':
        form = TestimonialForm(request.POST,request.FILES, instance=mytestimonial)
        if form.is_valid():
            tm = form.save(commit=False)
            tm.save()
            messages.success(request, 'Testimonial Update successfully!')
            return redirect('testimonial_list')
        else:
            print(form.errors)
    else:
        form = TestimonialForm(instance=mytestimonial)
    context = {
        'form': form,
        'mytestimonial': mytestimonial,
    }
    return render(request, 'myadmin/edit_testimonial.html', context)

@user_passes_test(check_role_myadmin)
def delete_testimonial(request, pk=None):
    testimonial = get_object_or_404(Testimonial, pk=pk)
    testimonial.delete()
    messages.success(request, 'Testimonial has been deleted successfully!')
    return redirect('testimonial_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def testimonial_list(request):
    testimonial= Testimonial.objects.all().order_by('-id')
    
    context = {
        'testimonial': testimonial,
    }
    return render(request, 'myadmin/testimonial_list.html', context)

##Client
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_client(request):
    if request.method == 'POST':
        form = ClientForm(request.POST,request.FILES)
        if form.is_valid():
            tm = form.save(commit=False)
            tm.save()
            messages.success(request, 'Client added successfully!')
            return redirect('client_list')
        else:
            print(form.errors)
    else:
        form = ClientForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_clients.html', context)


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_client(request,pk=None):
    myclient = get_object_or_404(Client, pk=pk)
    if request.method == 'POST':
        form = ClientForm(request.POST,request.FILES, instance=myclient)
        if form.is_valid():
            tm = form.save(commit=False)
            tm.save()
            messages.success(request, 'Client Update successfully!')
            return redirect('client_list')
        else:
            print(form.errors)
    else:
        form = ClientForm(instance=myclient)
    context = {
        'form': form,
        'myclient': myclient,
    }
    return render(request, 'myadmin/edit_client.html', context)

@user_passes_test(check_role_myadmin)
def delete_client(request, pk=None):
    client= get_object_or_404(Client, pk=pk)
    client.delete()
    messages.success(request, 'Client has been deleted successfully!')
    return redirect('client_list')

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def client_list(request):
    clients= Client.objects.all().order_by('-id')
    
    context = {
        'clients': clients,
    }
    return render(request, 'myadmin/client_list.html', context)

#Hone Hero Banner
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_banner(request):
    # about = get_object_or_404(About, pk=pk)
    banner = Banner.objects.first()
    if request.method == 'POST':
        form = BannerForm(request.POST,request.FILES,instance=banner)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Home Page Hero Banner updated successfully!')
            return redirect('edit_banner')
        else:
            print(form.errors)
    else:
        form = BannerForm(instance=banner)
        # modify this form
    context = {
        'form': form,
        'banner': banner,
    }
    return render(request, 'myadmin/edit_banner.html', context)

#Hone Page Edit
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_home(request):
    # about = get_object_or_404(About, pk=pk)
    home = Home.objects.first()
    if request.method == 'POST':
        form = HomeForm(request.POST,request.FILES,instance=home)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Home Page Info updated successfully!')
            return redirect('edit_home')
        else:
            print(form.errors)
    else:
        form = HomeForm(instance=home)
        # modify this form
    context = {
        'form': form,
        'home': home,
    }
    return render(request, 'myadmin/edit_home.html', context)

#knowus
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_knowus(request):
    # about = get_object_or_404(About, pk=pk)
    knowus = Know_us.objects.first()
    if request.method == 'POST':
        form = KnowUsForm(request.POST,request.FILES,instance=knowus)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Know Us Home Page updated successfully!')
            return redirect('edit_knowus')
        else:
            print(form.errors)
    else:
        form = KnowUsForm(instance=knowus)
        # modify this form
    context = {
        'form': form,
        'knowus': knowus,
    }
    return render(request, 'myadmin/edit_knowus.html', context)

#overview
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_overview(request):
    # about = get_object_or_404(About, pk=pk)
    overview = Company_overview.objects.first()
    if request.method == 'POST':
        form = OverviewForm(request.POST,request.FILES,instance=overview)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Overview Home Page updated successfully!')
            return redirect('edit_overview')
        else:
            print(form.errors)
    else:
        form = OverviewForm(instance=overview)
        # modify this form
    context = {
        'form': form,
        'overview': overview,
    }
    return render(request, 'myadmin/edit_overview.html', context)

#Counter
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_counter(request):
    # about = get_object_or_404(About, pk=pk)
    counter = Counter.objects.first()
    if request.method == 'POST':
        form = CounterForm(request.POST,request.FILES,instance=counter)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Counter Home Page updated successfully!')
            return redirect('edit_counter')
        else:
            print(form.errors)
    else:
        form = CounterForm(instance=counter)
        # modify this form
    context = {
        'form': form,
        'counter': counter,
    }
    return render(request, 'myadmin/edit_counter.html', context)

#ContactPage
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_contact(request):
    # about = get_object_or_404(About, pk=pk)
    contact = Contact.objects.first()
    if request.method == 'POST':
        form = ContactPageForm(request.POST,request.FILES,instance=contact)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Contact Page info updated successfully!')
            return redirect('edit_contact')
        else:
            print(form.errors)
    else:
        form = ContactPageForm(instance=contact)
        # modify this form
    context = {
        'form': form,
        'contact': contact,
    }
    return render(request, 'myadmin/edit_contact.html', context)

##Blog Category
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_category(request):
    if request.method == 'POST':
        form = BlogCategoryForm(request.POST, request.FILES)
        if form.is_valid():
            categoryname = form.cleaned_data['category_name']
            sform = form.save(commit=False)
            sform.slug = slugify(categoryname)
            form.save()
            messages.success(request, 'Category Add successfully!')
            return redirect('category_list')
        else:
            print(form.errors)
    else:
        form = BlogCategoryForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_category.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_category(request,pk=None):
    category = get_object_or_404(Category, pk=pk)
    if request.method == 'POST':
        form = BlogCategoryForm(request.POST, request.FILES,instance=category)
        if form.is_valid():
            categoryname = form.cleaned_data['category_name']
            sform = form.save(commit=False)
            sform.slug = slugify(categoryname)
            form.save()
            messages.success(request, 'Category has been updated successfully!')
            return redirect('category_list')
        else:
            print(form.errors)
    else:
        form = BlogCategoryForm(instance=category)
    context = {
        'form': form,
        'category': category,
    }
    return render(request, 'myadmin/edit_category.html',context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def category_list(request):
    # products = Product.objects.all().filter(is_available=True)[0:8]
    category = Category.objects.all().order_by('sno')
    context = {
        'category': category,
    }

    return render(request, 'myadmin/category_list.html', context)

@user_passes_test(check_role_myadmin)
def delete_category(request, pk=None):
    category= get_object_or_404(Category, pk=pk)
    category.delete()
    messages.success(request, 'category has been deleted successfully!')
    return redirect('category_list')

##Blog Post
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_post(request):
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES)
        if form.is_valid():
            titlename = form.cleaned_data['title']
            sform = form.save(commit=False)
            sform.slug = slugify(titlename)
            form.save()
            messages.success(request, 'Post Add successfully!')
            return redirect('post_list')
        else:
            print(form.errors)
    else:
        form = BlogPostForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_post.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_post(request,pk=None):
    post = get_object_or_404(Post, pk=pk)
    if request.method == 'POST':
        form = BlogPostForm(request.POST, request.FILES,instance=post)
        if form.is_valid():
            titlename = form.cleaned_data['title']
            sform = form.save(commit=False)
            sform.slug = slugify(titlename)
            form.save()
            messages.success(request, 'Post has been updated successfully!')
            return redirect('post_list')
        else:
            print(form.errors)
    else:
        form = BlogPostForm(instance=post)
    context = {
        'form': form,
        'post': post,
    }
    return render(request, 'myadmin/edit_post.html',context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def post_list(request):
    # products = Product.objects.all().filter(is_available=True)[0:8]
    post = Post.objects.all().order_by('-sno')
    context = {
        'post': post,
    }

    return render(request, 'myadmin/post_list.html', context)

@user_passes_test(check_role_myadmin)
def delete_post(request, pk=None):
    post= get_object_or_404(Post, pk=pk)
    post.delete()
    messages.success(request, 'Post has been deleted successfully!')
    return redirect('post_list')


#General
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_general(request):
    # about = get_object_or_404(About, pk=pk)
    general = General.objects.first()
    if request.method == 'POST':
        form = GeneralForm(request.POST,request.FILES,instance=general)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'General info updated successfully!')
            return redirect('edit_general')
        else:
            print(form.errors)
    else:
        form = GeneralForm(instance=general)
        # modify this form
    context = {
        'form': form,
        'general': general,
    }
    return render(request, 'myadmin/edit_general.html', context)

#PageBgBanner
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_bgbanner(request):
    # about = get_object_or_404(About, pk=pk)
    bgbanner = Bg_banner.objects.first()
    if request.method == 'POST':
        form = PageBgForm(request.POST,request.FILES,instance=bgbanner)
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Page Hero Background Banner Updated Successfully!')
            return redirect('edit_bgbanner')
        else:
            print(form.errors)
    else:
        form = PageBgForm(instance=bgbanner)
        # modify this form
    context = {
        'form': form,
        'bgbanner': bgbanner,
    }
    return render(request, 'myadmin/edit_bgbanner.html', context)

#EmaiSetup
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def emailsetup(request):
    # about = get_object_or_404(About, pk=pk)
    emailsetup = EmailSetting.objects.first()
    if request.method == 'POST':
        form = EmailSetupForm(request.POST,request.FILES,instance=emailsetup )
        if form.is_valid():
            bnr = form.save(commit=False)
            bnr.save()
            messages.success(request, 'Email Setup Updated Successfully!')
            return redirect('emailsetup')
        else:
            print(form.errors)
    else:
        form = EmailSetupForm(instance=emailsetup)
        # modify this form
    context = {
        'form': form,
        'emailsetup': emailsetup,
    }
    return render(request, 'myadmin/emailsetup.html', context)

##Author Post
@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def add_author(request):
    if request.method == 'POST':
        form = AuthorForm(request.POST, request.FILES)
        if form.is_valid():
            titlename = form.cleaned_data['author_name']
            sform = form.save(commit=False)
            sform.author_slug = slugify(titlename)
            form.save()
            messages.success(request, 'Author Add successfully!')
            return redirect('author_list')
        else:
            print(form.errors)
    else:
        form = AuthorForm()
    context = {
        'form': form,
    }
    return render(request, 'myadmin/add_author.html', context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_author(request,pk=None):
    author = get_object_or_404(Author, pk=pk)
    if request.method == 'POST':
        form = AuthorForm(request.POST, request.FILES,instance=author)
        if form.is_valid():
            titlename = form.cleaned_data['author_name']
            sform = form.save(commit=False)
            sform.author_slug = slugify(titlename)
            form.save()
            messages.success(request, 'Author has been updated successfully!')
            return redirect('author_list')
        else:
            print(form.errors)
    else:
        form = AuthorForm(instance=author)
    context = {
        'form': form,
        'author': author,
    }
    return render(request, 'myadmin/edit_author.html',context)

@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def author_list(request):
    # products = Product.objects.all().filter(is_available=True)[0:8]
    author = Author.objects.all().order_by('-id')
    context = {
        'author': author,
    }

    return render(request, 'myadmin/author_list.html', context)

@user_passes_test(check_role_myadmin)
def delete_author(request, pk=None):
    author= get_object_or_404(Author, pk=pk)
    author.delete()
    messages.success(request, 'Author has been deleted successfully!')
    return redirect('author_list')

def get_states(request):
    country_id = request.GET.get('country_id')
    states = State.objects.filter(country_id=country_id).values('id', 'state_name')
    return JsonResponse(list(states), safe=False)

def get_cities(request):
    state_id = request.GET.get('state_id')
    cities = City.objects.filter(state_id=state_id).values('id', 'city_name')
    return JsonResponse(list(cities), safe=False)

def get_job_categories(request):
    sector_id = request.GET.get('sector_id')
    job_categories = Job_category.objects.filter(sector_id=sector_id).values('id', 'category_name')
    return JsonResponse(list(job_categories), safe=False)
