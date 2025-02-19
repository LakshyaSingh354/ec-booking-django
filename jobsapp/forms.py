from django import forms
from accounts.validators import allow_only_images_validator
from .models import*

class JobApplicationForm(forms.ModelForm):
    # cat_image = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # is_relocated = forms.ChoiceField(choices=RELOCATE_CHOICES,initial=False)
    class Meta:
        model = Applicant
        fields = ['job_name','job_url','first_name','last_name','email','gender','applicant_phone','qualification','skills','employee_type','working_experience','applicant_position','applicant_country',
                  'applicant_state','applicant_city','applicant_address','last_company_name','last_company_designation','current_ctc','last_ctc','applicant_location','cover_letter','resume',
                  'is_relocated','user_id'
                  ]
        # widgets = {
        # 'last_company_name': forms.TextInput(attrs={'type': 'text','required': '',}),
        # }
    def __init__(self, *args, **kwargs):
        super(JobApplicationForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        self.fields['job_name'].widget.attrs['placeholder'] = 'Job Name'
        self.fields['job_url'].widget.attrs['placeholder'] = 'Job Url'
        self.fields['first_name'].widget.attrs['placeholder'] = 'First Name'
        self.fields['last_name'].widget.attrs['placeholder'] = 'Last Name'
        self.fields['email'].widget.attrs['placeholder'] = 'Email'
        self.fields['gender'].widget.attrs['placeholder'] = 'Gender'
        self.fields['applicant_phone'].widget.attrs['placeholder'] = 'Applicant Phone'
        self.fields['qualification'].widget.attrs['placeholder'] = 'Qualification'
        self.fields['employee_type'].widget.attrs['placeholder'] = 'Employee Type'
        self.fields['working_experience'].widget.attrs['placeholder'] = 'Experience'
        self.fields['applicant_position'].widget.attrs['placeholder'] = 'Applicant Position'
        self.fields['applicant_country'].widget.attrs['placeholder'] = 'Country'
        self.fields['applicant_state'].widget.attrs['placeholder'] = 'State'
        self.fields['applicant_city'].widget.attrs['placeholder'] = 'City'
        self.fields['applicant_address'].widget.attrs['placeholder'] = 'Address'
        self.fields['last_company_name'].widget.attrs['placeholder'] = 'Last Company Name'
        self.fields['last_company_designation'].widget.attrs['placeholder'] = 'Last Company Designation'
        self.fields['current_ctc'].widget.attrs['placeholder'] = 'Current CTC'
        self.fields['last_ctc'].widget.attrs['placeholder'] = 'Last CTC'
        self.fields['applicant_location'].widget.attrs['placeholder'] = 'Applicant Location'
        self.fields['skills'].widget.attrs['placeholder'] = 'Write Your Skills'
        self.fields['cover_letter'].widget.attrs['placeholder'] = 'Cover Letter'
        self.fields['resume'].widget.attrs['placeholder'] = 'Upload Resume'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
# class JobFilterForm(forms.Form):
#     city = forms.ModelChoiceField(queryset=City.objects.all(), required=False)
#     # skill = forms.ModelMultipleChoiceField(queryset=Skill.objects.all(), required=False, widget=forms.CheckboxSelectMultiple)
#     work_mode = forms.ModelChoiceField(queryset=Work_mode.objects.all(), required=False) 

class JobPostForm(forms.ModelForm):
    # cat_image = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    # is_relocated = forms.ChoiceField(choices=RELOCATE_CHOICES,initial=False)
    class Meta:
        model = Job
        fields = ['job_title','description','company_description','job_location','salary','experience',
                  'website_url','company','sector','job_type','job_category','skills_required','work_mode',
                  'Job_role','country','state','city','education','number_of_job','last_date','status'
                  ]
        widgets = {
        # 'last_company_name': forms.TextInput(attrs={'type': 'text','required': '',}),
        # 'country': forms.Select(attrs={'class': 'form-control',}),
        # 'state': forms.Select(attrs={'class': 'form-control',}),
        # 'city': forms.Select(attrs={'class': 'form-control',}),
        # 'brand': forms.Select(attrs={'class': 'form-control',}),
        'last_date': forms.DateInput(attrs={'class': 'form-control','type': 'date',}),
        }
    country = forms.ModelChoiceField(queryset=Country.objects.all(), empty_label="Select Country")
    state = forms.ModelChoiceField(queryset=State.objects.none(), empty_label="Select State")
    city = forms.ModelChoiceField(queryset=City.objects.none(), empty_label="Select City")
    sector = forms.ModelChoiceField(queryset=Sector.objects.all(), empty_label="Select Sector")
    job_category = forms.ModelChoiceField(queryset=Job_category.objects.none(), empty_label="Select Job Category")
    
      
    def __init__(self, *args, **kwargs):
        super(JobPostForm,self).__init__(*args, **kwargs)
        self.fields['state'].queryset = State.objects.none()
        self.fields['city'].queryset = City.objects.none()
        self.fields['job_category'].queryset = Job_category.objects.none()
        self.fields['job_title'].widget.attrs['placeholder'] = 'job title'
        self.fields['description'].widget.attrs['placeholder'] = 'description'
        self.fields['company_description'].widget.attrs['placeholder'] = 'company description'
        self.fields['job_location'].widget.attrs['placeholder'] = 'job location'
        self.fields['salary'].widget.attrs['placeholder'] = 'salary write ex ₹4,00,000 - ₹10,00,000 a year'
        self.fields['experience'].widget.attrs['placeholder'] = 'experience'
        self.fields['website_url'].widget.attrs['placeholder'] = 'website url'
        self.fields['company'].widget.attrs['placeholder'] = 'company'
        
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

        if 'country' in self.data:
            try:
                country_id = int(self.data.get('country'))
                self.fields['state'].queryset = State.objects.filter(country_id=country_id)
            except (ValueError, TypeError):
                pass
        elif self.instance.pk:
            self.fields['state'].queryset = self.instance.country.state_set.all()

        if 'state' in self.data:
            try:
                state_id = int(self.data.get('state'))
                self.fields['city'].queryset = City.objects.filter(state_id=state_id)
            except (ValueError, TypeError):
                pass
        elif self.instance.pk:
            self.fields['city'].queryset = self.instance.state.city_set.all()
            
        if 'sector' in self.data:
            try:
                sector_id = int(self.data.get('sector'))
                self.fields['job_category'].queryset = Job_category.objects.filter(sector_id=sector_id)
            except (ValueError, TypeError):
                pass
        elif self.instance.pk:
            self.fields['job_category'].queryset = self.instance.sector.job_category_set.all() 
            
    # def __init__(self, *args, **kwargs):
    #     super(JobPostForm, self).__init__(*args, **kwargs)
    #     # self.fields['job'].widget.attrs['placeholder'] = 'Job'
    #     self.fields['job_title'].widget.attrs['placeholder'] = 'job title'
    #     self.fields['description'].widget.attrs['placeholder'] = 'description'
    #     self.fields['company_description'].widget.attrs['placeholder'] = 'company description'
    #     self.fields['job_location'].widget.attrs['placeholder'] = 'job location'
    #     self.fields['salary'].widget.attrs['placeholder'] = 'salary'
    #     self.fields['experience'].widget.attrs['placeholder'] = 'experience'
    #     self.fields['website_url'].widget.attrs['placeholder'] = 'website url'
    #     self.fields['company'].widget.attrs['placeholder'] = 'company'
    #     self.fields['sector'].widget.attrs['placeholder'] = 'sector'
    #     self.fields['job_type'].widget.attrs['placeholder'] = 'job type'
    #     self.fields['job_category'].widget.attrs['placeholder'] = 'job category'
    #     self.fields['skills_required'].widget.attrs['placeholder'] = 'skills required'
    #     self.fields['work_mode'].widget.attrs['placeholder'] = 'work mode'
    #     self.fields['Job_role'].widget.attrs['placeholder'] = 'Job role'
    #     self.fields['country'].widget.attrs['placeholder'] = 'country'
    #     self.fields['state'].widget.attrs['placeholder'] = 'state'
    #     self.fields['city'].widget.attrs['placeholder'] = 'city'
    #     self.fields['education'].widget.attrs['placeholder'] = 'education'
    #     self.fields['number_of_job'].widget.attrs['placeholder'] = 'number of job'
    #     self.fields['last_date'].widget.attrs['placeholder'] = 'last_date'
    #     self.fields['status'].widget.attrs['placeholder'] = 'status'
    #     for field in self.fields:
    #         self.fields[field].widget.attrs['class'] = 'form-control'     
class CountryForm(forms.ModelForm):
    class Meta:
        model=Country
        fields=['country_name','status',]
        widgets = {
        'country_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Country Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(CountryForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class StateForm(forms.ModelForm):
    class Meta:
        model=State
        fields=['country','state_name','status',]
        widgets = {
        'state_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'State Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(StateForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class CityForm(forms.ModelForm):
    class Meta:
        model=City
        fields=['state','city_name','status',]
        widgets = {
        'city_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'City Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(CityForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            

class SectorForm(forms.ModelForm):
    class Meta:
        model=Sector
        fields=['sector_name','status',]
        widgets = {
        'sector_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Sector Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(SectorForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class CompanyForm(forms.ModelForm):
    
    company_logo = forms.ImageField(required=False, error_messages = {'invalid':("Image files only")}, widget=forms.FileInput)
    class Meta:
        model=Company
        fields=['company_name','company_logo','email','phone','website_url','sector','country',
                'state','city','address','status',
                ]
        # widgets = {
        # 'company_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Company Name',}),
        # }
    
    def __init__(self, *args, **kwargs):
        super(CompanyForm, self).__init__(*args, **kwargs)
        self.fields['company_name'].widget.attrs['placeholder'] = 'Company Name'
        self.fields['email'].widget.attrs['placeholder'] = 'Email'
        self.fields['phone'].widget.attrs['placeholder'] = 'Phone'
        self.fields['website_url'].widget.attrs['placeholder'] = 'Website Url'
        self.fields['sector'].widget.attrs['placeholder'] = 'Sector'
        self.fields['address'].widget.attrs['placeholder'] = 'address'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class Job_typeForm(forms.ModelForm):
    class Meta:
        model=Job_type
        fields=['name','status',]
        widgets = {
        'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Job Type Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(Job_typeForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
            
class Work_modeForm(forms.ModelForm):
    class Meta:
        model=Work_mode
        fields=['name','status',]
        widgets = {
        'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Work Mode Name',}),
        }
    
    def __init__(self, *args, **kwargs):
        super(Work_modeForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class Job_categoryForm(forms.ModelForm):
    class Meta:
        model=Job_category
        fields=['sector','category_name','status',]
        # widgets = {
        # 'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Work Mode Name',}),
        # }
    
    def __init__(self, *args, **kwargs):
        super(Job_categoryForm, self).__init__(*args, **kwargs)
        # self.fields['job'].widget.attrs['placeholder'] = 'Job'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class Job_roleForm(forms.ModelForm):
    class Meta:
        model=Job_role
        fields=['sector','role_name','status',]
        # widgets = {
        # 'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Work Mode Name',}),
        # }
    
    def __init__(self, *args, **kwargs):
        super(Job_roleForm, self).__init__(*args, **kwargs)
        self.fields['role_name'].widget.attrs['placeholder'] = 'Job Role Name'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class SkillForm(forms.ModelForm):
    class Meta:
        model=Skill
        fields=['sector','job_category','skill_name']
        # widgets = {
        # 'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Work Mode Name',}),
        # }
    
    def __init__(self, *args, **kwargs):
        super(SkillForm, self).__init__(*args, **kwargs)
        self.fields['skill_name'].widget.attrs['placeholder'] = 'Skill Name'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class EducationForm(forms.ModelForm):
    class Meta:
        model=Education
        fields=['education_name']

    def __init__(self, *args, **kwargs):
        super(EducationForm, self).__init__(*args, **kwargs)
        self.fields['education_name'].widget.attrs['placeholder'] = 'Education Name'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class ExperienceForm(forms.ModelForm):
    class Meta:
        model=Experience
        fields=['name']

    def __init__(self, *args, **kwargs):
        super(ExperienceForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Add Experience'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class PositionForm(forms.ModelForm):
    class Meta:
        model=Position
        fields=['job','name']

    def __init__(self, *args, **kwargs):
        super(PositionForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Add Job Position'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'                                                                                                                                                                                