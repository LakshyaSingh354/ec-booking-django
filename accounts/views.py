from django.shortcuts import render, redirect, get_object_or_404
from .forms import UserForm,UserProfileForm,AdminUpdateForm
from .models import User, UserProfile
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
from myapp.models import*
from jobsapp.models import*

from datetime import datetime
import datetime

# Create your views here.
# Restrict the vendor from accessing the customer page

def myhome(request):
   
    return render(request, 'main/home.html')
def check_role_myadmin(user):
    if user.role == 1:
        return True
    else:
        raise PermissionDenied

# Restrict the customer from accessing the vendor page
def check_role_customer(user):
    if user.role == 2:
        return True
    else:
        raise PermissionDenied 

def user_signup(request):
    # if request.user.is_authenticated:
    #     messages.warning(request, 'You are already logged in!')
    #     return redirect('dashboard')
    # elif request.method == 'POST':
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            # Create the user using the form
            # password = form.cleaned_data['password']
            # user = form.save(commit=False)
            # user.set_password(password)
            # user.role = User.CUSTOMER
            # user.save()

            # Create the user using create_user method
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = BookingUser.objects.create_user(first_name=first_name, last_name=last_name, username=username, email=email, password=password)
            user.role = BookingUser.CUSTOMER
            user.save()

            # Send verification email
            mail_subject = 'Please activate your account'
            email_template = 'emails/account_verification_email.html'
            send_verification_email(request, user, mail_subject, email_template)
            messages.success(request, 'Your account has been registered sucessfully!')
            return redirect('user_signup')
        else:
            print('invalid form')
            print(form.errors)
    else:
        form = UserForm()
    context = {
        'form': form,
    }
    return render(request, 'accounts/user_signup.html', context)


def activate(request, uidb64, token):
    # Activate the user by setting the is_active status to True
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = BookingUser._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, BookingUser.DoesNotExist):
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(request, 'Congratulation! Your account is activated.')
        return redirect('myAccount')
    else:
        messages.error(request, 'Invalid activation link')
        return redirect('myAccount')

def login(request):
    if request.user.is_authenticated:
        messages.warning(request, 'You are already logged in!')
        return redirect('myAccount')
    elif request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        user = auth.authenticate(email=email, password=password)

        if user is not None:
            auth.login(request, user)
            messages.success(request, 'You are now logged in.')
            return redirect('myAccount')
        else:
            messages.error(request, 'Invalid login credentials')
            return redirect('login')
    return render(request, 'accounts/login.html')

# Create your views here.
@login_required(login_url='login')
def myAccount(request):
    user = request.user
    redirectUrl = detectUser(user)
    return redirect(redirectUrl)


def logout(request):
    auth.logout(request)
    messages.success(request, 'You are logged out.')
    return redirect('login')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def change_password(request):
    if request.method == 'POST':
        current_password = request.POST['current_password']
        new_password = request.POST['new_password']
        confirm_password = request.POST['confirm_password']

        user = BookingUser.objects.get(username__exact=request.user.username)

        if new_password == confirm_password:
            success = user.check_password(current_password)
            if success:
                user.set_password(new_password)
                user.save()
                # auth.logout(request)
                messages.success(request, 'Password updated successfully.')
                return redirect('change_password')
            else:
                messages.error(request, 'Please enter valid current password')
                return redirect('change_password')
        else:
            messages.error(request, 'Password does not match!')
            return redirect('change_password')
    return render(request, 'myadmin/change_password.html')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def edit_profile(request):
    userprofile = get_object_or_404(UserProfile, user=request.user)
    if request.method == 'POST':
        user_form = AdminUpdateForm(request.POST, instance=request.user)
        profile_form = UserProfileForm(request.POST, request.FILES, instance=userprofile)
        if user_form.is_valid() and profile_form.is_valid():
            user=user_form.save()
            # user.set_password(user.password)
            user.save()
            profile=profile_form.save(commit=False)
            # profile.address=profile_form.cleaned_data['address']
            # profile.country=profile_form.cleaned_data['country']
            # profile.state=profile_form.cleaned_data['state']
            # profile.city=profile_form.cleaned_data['city']
            # profile.pin_code=profile_form.cleaned_data['pin_code']
            profile.save()
            messages.success(request, 'Your profile has been updated.')
            return redirect('edit_profile')
    else:
        user_form = AdminUpdateForm(instance=request.user)
        profile_form = UserProfileForm(instance=userprofile)
        
    context = {
        'user_form': user_form,
        'profile_form': profile_form,
        # 'userprofile': userprofile,
    }
    return render(request, 'myadmin/edit_profile.html', context)


def forgot_password(request):
    if request.method == 'POST':
        email = request.POST['email']

        if BookingUser.objects.filter(email=email).exists():
            user = BookingUser.objects.get(email__exact=email)

            # send reset password email
            mail_subject = 'Reset Your Password'
            email_template = 'emails/reset_password_email.html'
            send_verification_email(request, user, mail_subject, email_template)

            messages.success(request, 'Password reset link has been sent to your email address.')
            return redirect('login')
        else:
            messages.error(request, 'Account does not exist')
            return redirect('forgot_password')
    return render(request, 'accounts/forgot_password.html')


def reset_password_validate(request, uidb64, token):
    # validate the user by decoding the token and user pk
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = BookingUser._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, BookingUser.DoesNotExist):
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        request.session['uid'] = uid
        messages.info(request, 'Please reset your password')
        return redirect('reset_password')
    else:
        messages.error(request, 'This link has been expired!')
        return redirect('myAccount')


def reset_password(request):
    if request.method == 'POST':
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password == confirm_password:
            pk = request.session.get('uid')
            user = BookingUser.objects.get(pk=pk)
            user.set_password(password)
            user.is_active = True
            user.save()
            messages.success(request, 'Password reset successful')
            return redirect('login')
        else:
            messages.error(request, 'Password do not match!')
            return redirect('reset_password')
    return render(request, 'accounts/reset_password.html')


@login_required(login_url='login')
@user_passes_test(check_role_myadmin)
def myDashboard(request):
    enquiry = Services_enquiry.objects.all().order_by('-id')
    jobs = Job.objects.filter(status=1).order_by('-created_on')[0:8]
    feedback = Feedback.objects.all().order_by('-id')
    applicants = Applicant.objects.all().order_by('-id')
    enquiry_count = enquiry.count()
    job_count = jobs.count()
    feedback_count = feedback.count()
    applicant_count = applicants.count()

    context = {
        'enquiry': enquiry,
        'enquiry_count': enquiry_count,
        'applicant_count': applicant_count,
        'feedback_count': feedback_count,
        'job_count': job_count,
    }
    return render(request, 'myadmin/dashboard.html',context)
    # return render(request, 'myadmin/adhome.html',context)