from django import forms
from .models import User, UserProfile,EmailSetting,Author
from myapp.models import*
from .validators import allow_only_images_validator


class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
    confirm_password = forms.CharField(widget=forms.PasswordInput())
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email','phone_number','password']

    def clean(self):
        cleaned_data = super(UserForm, self).clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')

        if password != confirm_password:
            raise forms.ValidationError(
                "Password does not match!"
            )
    
    
    def __init__(self, *args, **kwargs):
        super(UserForm, self).__init__(*args, **kwargs)
        self.fields['first_name'].widget.attrs['placeholder'] = 'First Name'
        self.fields['last_name'].widget.attrs['placeholder'] = 'last Name'
        self.fields['email'].widget.attrs['placeholder'] = 'Email Address'
        self.fields['phone_number'].widget.attrs['placeholder'] = 'Mobile Number'
        self.fields['username'].widget.attrs['placeholder'] = 'Username'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control unicase-form-control text-input'        


class UserProfileForm(forms.ModelForm):
    # address = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Start typing...', 'required': 'required'}))
    # profile_picture = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info'}), validators=[allow_only_images_validator])
    profile_picture = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    
    class Meta:
        model = UserProfile
        fields = ['profile_picture','address', 'country', 'state', 'city', 'pin_code']
        
        
    def __init__(self, *args, **kwargs):
        super(UserProfileForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'phone_number']
        
class AdminUpdateForm(forms.ModelForm):
    class Meta:
        model=User
        fields=['first_name','last_name','email','phone_number','username']
        widgets = {
        'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'First Name',}),
        'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Last Name',}),
        'phone_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone No.',}),
        'email': forms.TextInput(attrs={'type': 'email','class': 'form-control', 'placeholder': 'Email','readonly':'readonly',}),
        'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'username', 'readonly':'readonly',}),
        } 
        
class ServicesForm(forms.ModelForm):
    services_thumb = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model = Services
        fields = ['service_name', 'meta_title','meta_description','meta_keywords','services_thumb','flaticon_class','description','status']
    def __init__(self, *args, **kwargs):
        super(ServicesForm, self).__init__(*args, **kwargs)
        self.fields['service_name'].widget.attrs['placeholder'] = 'Services name'
        self.fields['services_thumb'].widget.attrs['placeholder'] = 'Services Thumb'
        self.fields['flaticon_class'].widget.attrs['placeholder'] = 'font awesome icon class'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['meta_title'].widget.attrs['placeholder'] = 'Meta Title'
        self.fields['meta_description'].widget.attrs['placeholder'] = 'Meta Description'
        self.fields['meta_keywords'].widget.attrs['placeholder'] = 'Meta Keywords'
        # self.fields['consultants'].widget.attrs['placeholder'] = 'Consultants'
        # self.fields['price'].widget.attrs['placeholder'] = 'Price'
        # self.fields['duration'].widget.attrs['placeholder'] = 'Duration'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
class ServicesDetailForm(forms.ModelForm):
    # services_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # services1_thumb = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # services2_thumb = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # img_one = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # img_two = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    services_img  = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    services1_thumb  = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    services2_thumb  = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    img_one  = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    img_two  = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    class Meta:
        model = Service_detail
        fields = ['services','services_img','main_title','description','services1_name','services1_thumb','services1_flaticon','services1_content','services2_name','services2_thumb','services2_flaticon',
                  'services2_content','title_two','title_two_content','list_wrap1','list_wrap2','list_wrap3','list_wrap4','title_three','info_one','img_one','img_two','info_two','status'
                  ]
    def __init__(self, *args, **kwargs):
        super(ServicesDetailForm, self).__init__(*args, **kwargs)
        self.fields['services'].widget.attrs['placeholder'] = 'Services name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'main title'
        self.fields['description'].widget.attrs['placeholder'] = 'Services Details'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['services1_name'].widget.attrs['placeholder'] = 'services1 name'
        self.fields['services1_flaticon'].widget.attrs['placeholder'] = 'services1 flaticon'
        self.fields['services1_content'].widget.attrs['placeholder'] = 'services1 content'
        self.fields['services2_name'].widget.attrs['placeholder'] = 'services2 name'
        self.fields['services2_flaticon'].widget.attrs['placeholder'] = 'services2 flaticon'
        self.fields['services2_content'].widget.attrs['placeholder'] = 'services2 content'
        self.fields['title_two'].widget.attrs['placeholder'] = 'title two'
        self.fields['title_two_content'].widget.attrs['placeholder'] = 'title two content'
        self.fields['list_wrap1'].widget.attrs['placeholder'] = 'list wrap1'
        self.fields['list_wrap2'].widget.attrs['placeholder'] = 'list wrap2'
        self.fields['list_wrap3'].widget.attrs['placeholder'] = 'list wrap3'
        self.fields['list_wrap4'].widget.attrs['placeholder'] = 'list wrap4'
        self.fields['title_three'].widget.attrs['placeholder'] = 'title three'
        self.fields['info_one'].widget.attrs['placeholder'] = 'info one'
        self.fields['list_wrap3'].widget.attrs['placeholder'] = 'list wrap3'
        self.fields['list_wrap4'].widget.attrs['placeholder'] = 'list wrap4'
        self.fields['info_two'].widget.attrs['placeholder'] = 'info two'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            

class AuthorForm(forms.ModelForm):
    class Meta:
        model=Author
        fields=[
            'user','user_profile','author_name','content','designation','is_approved'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
        widgets = {
            'user': forms.Select(attrs={'class': 'form-control',}),
            'user_profile': forms.Select(attrs={'class': 'form-control',}),
            'author_name': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Author Name',}),
            'content': forms.Textarea(attrs={'class': 'form-control','placeholder': 'Write Author Bio',}),
            'designation': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Designation',}),
            'is_approved': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
        }
        

            
class EmailSetupForm(forms.ModelForm):
    class Meta:
        model = EmailSetting
        fields = ['name','enqmail',]
    def __init__(self, *args, **kwargs):
        super(EmailSetupForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Name'
        self.fields['enqmail'].widget.attrs['placeholder'] = 'Enquiry Receiving Email'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'                                         