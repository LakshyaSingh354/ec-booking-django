from django.db import models
# from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from accounts.models import User,Author,UserProfile
# from django.conf import settings
from django.utils.timezone import now
from django.utils import timezone
from datetime import datetime
from ckeditor_uploader.fields import RichTextUploadingField
from django.urls import reverse
from django.utils.text import slugify
import uuid
# Create your models here.
STATUS = (
    (0,"Draft"),
    (1,"Publish")
)
class Country(models.Model):
    country_name = models.CharField(max_length=100,unique=True)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    country_pic= models.ImageField(upload_to='country/%Y/%m/%d/',null=True,blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    class Meta:
        verbose_name = 'Country'
        verbose_name_plural = 'Countries'
        ordering = ['-created_on']
  
    # @property
    # def get_instance(self):
    #     return self
    def __str__(self):
        return self.country_name
    
class State(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    state_name = models.CharField(max_length=100,unique=True)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
  
    def __str__(self):
        return self.state_name
    
class City(models.Model):
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    city_name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    photo= models.ImageField(upload_to='city/%Y/%m/%d/',null=True,blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    class Meta:
        verbose_name = 'City'
        verbose_name_plural = 'Cities'
        ordering = ['-created_on']
  
    def __str__(self):
        return self.city_name 
    
class Sector(models.Model):
    sector_name = models.CharField(max_length=250,default='IT')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    
    def get_url(self):
            return reverse('jobs_by_sector', args=[self.slug])
        
    def __str__(self):
        return self.sector_name
    def get_all_sectors(self):
        return Sector.objects.filter(status=1).order_by('created_on')
    
class Company(models.Model):
    company_name = models.CharField(max_length=250)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    company_logo= models.ImageField(upload_to='company/%Y/%m/%d/',null=True,blank=True)
    email = models.EmailField(max_length=100,blank=True)
    phone = models.CharField(max_length=100,blank=True)
    website_url = models.URLField(max_length=100, blank=True)
    sector = models.ManyToManyField(Sector)
    country = models.ForeignKey(Country, on_delete=models.SET_NULL, null=True)
    state = models.ForeignKey(State, on_delete=models.SET_NULL, null=True)
    city = models.ForeignKey(City, on_delete=models.SET_NULL, null=True)
    address = models.CharField(max_length=250)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    class Meta:
        verbose_name = 'Company'
        verbose_name_plural = 'Companies'
        ordering = ['-created_on']

    def __str__(self):
        return self.company_name     
        
  
class Job_type(models.Model):
    name = models.CharField(max_length=100, default='Full time')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
  
    def __str__(self):
        return self.name
    
class Work_mode(models.Model):
    name = models.CharField(max_length=100, default='Remote')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    photo= models.ImageField(upload_to='work/%Y/%m/%d/',null=True,blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
  
    def __str__(self):
        return self.name    
    
class Job_category(models.Model):
    sector = models.ForeignKey(Sector, on_delete=models.CASCADE)
    category_name = models.CharField(max_length=100,default='Devops')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    class Meta:
        verbose_name = 'Job Category'
        verbose_name_plural = 'Job Categories'
        ordering = ['-created_on']

    def __str__(self):
        return self.category_name  
    
class Job_role(models.Model):
    sector = models.ForeignKey(Sector, on_delete=models.CASCADE)
    role_name = models.CharField(max_length=100,default='Full Stack Developer')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)

    def __str__(self):
        return self.role_name 
    
class Skill(models.Model):
    sector = models.ForeignKey(Sector, on_delete=models.CASCADE)
    job_category = models.ForeignKey(Job_category, on_delete=models.CASCADE)
    skill_name = models.CharField(max_length=255, unique=True)
    slug = models.SlugField(max_length=600,unique=True,null=True)

    def __str__(self):
        return self.skill_name
    
class Education(models.Model):
    education_name = models.CharField(max_length=255, default='Bachelor Degree',unique=True)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    def __str__(self):
        return self.education_name   
 
class Experience(models.Model):
    name = models.CharField(max_length=255, default='Less than a year',unique=True)
    slug = models.SlugField(max_length=600,unique=True,null=True)
    def __str__(self):
        return self.name        
             
class Job(models.Model):
    job_title = models.CharField(max_length=300)
    # slug = models.SlugField(default='', max_length=500, null=True, unique=True)
    slug = models.SlugField(max_length=600,unique=True)
    job_uuid = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    description = RichTextUploadingField(blank=True, null=True)
    company_description = models.TextField(max_length=300,blank=True)
    job_location = models.CharField(max_length=250)
    salary = models.CharField(max_length=250,blank=True)
    experience = models.ForeignKey(Experience, on_delete=models.SET_NULL,null=True)
    website_url = models.URLField(max_length=100, blank=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    sector = models.ForeignKey(Sector, on_delete=models.SET_NULL, null=True)
    job_type = models.ForeignKey(Job_type, on_delete=models.SET_NULL, null=True)
    job_category = models.ForeignKey(Job_category, on_delete=models.CASCADE)
    skills_required = models.ManyToManyField(Skill)
    work_mode = models.ForeignKey(Work_mode, on_delete=models.CASCADE)
    Job_role = models.ForeignKey(Job_role, on_delete=models.SET_NULL, null=True)
    country = models.ForeignKey(Country, on_delete=models.CASCADE, null=True)
    state = models.ForeignKey(State, on_delete=models.CASCADE, null=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, null=True)
    education= models.ForeignKey(Education, on_delete=models.SET_NULL,null=True)
    number_of_job = models.PositiveIntegerField(blank=True,null=True)
    last_date = models.DateTimeField()
    filled = models.BooleanField(default=False)
    created_on = models.DateTimeField(default=now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    def save(self, *args, **kwargs):
        self.full_clean()  # Runs the custom validation
        super(Job, self).save(*args, **kwargs)
        
    def save(self, *args, **kwargs):
        self.slug = slugify(f"{self.job_title}-{self.job_uuid}")
        super(Job, self).save(*args, **kwargs)
    
            
        
    def get_url(self):
         return reverse('job_detail', args=[self.slug])       

    def __str__(self):
        return self.job_title 
    

class Position(models.Model):
    job = models.ForeignKey(Job, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, default='Fullstack')
    slug = models.SlugField(max_length=600,unique=True,null=True)
    def __str__(self):
        return self.name   
    
class Applicant(models.Model):
    GENDER_CHOICES = (
    ('male', 'Male'),
    ('female', 'Female')
    )
    RELOCATE_CHOICES = (
    ('yes', 'Yes'),
    ('no', 'No')
    )
    EMPLOYEE_TYPE_CHOICES = (
        ('fresher', 'Fresher'),
        ('experienced', 'Experienced'),
    )
    job = models.ForeignKey(Job, on_delete=models.CASCADE, related_name='applicants')
    job_name = models.CharField(max_length=500,blank=True)
    job_url = models.SlugField(max_length=700,blank=True)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    gender = models.CharField(choices=GENDER_CHOICES, max_length=50)
    applicant_phone = models.CharField(max_length=16)
    qualification = models.CharField(max_length=100)
    skills = models.TextField(max_length=300)
    applicant_position = models.ForeignKey(Position, on_delete=models.SET_NULL,null=True)
    is_relocated = models.CharField(choices=RELOCATE_CHOICES, max_length=100)
    applicant_country = models.CharField(max_length=15)
    applicant_state = models.CharField(max_length=15)
    applicant_city = models.CharField(max_length=100)
    applicant_address = models.CharField(max_length=250)
    employee_type = models.CharField(choices=EMPLOYEE_TYPE_CHOICES, max_length=100)
    working_experience = models.ForeignKey(Experience, on_delete=models.SET_NULL,null=True)
    last_company_name = models.CharField(max_length=250, blank=True)
    last_company_designation = models.CharField(max_length=250, blank=True)
    current_ctc = models.CharField(max_length=150, blank=True)
    last_ctc = models.CharField(max_length=150, blank=True)
    applicant_location = models.CharField(max_length=250)
    cover_letter = models.TextField(blank=True)
    resume = models.FileField(upload_to='doc')
    user_id = models.IntegerField(blank=True)
    created_on = models.DateTimeField(blank=True, default=datetime.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    @property
    def full_name(self):
        return self.first_name+" "+self.last_name
       
    def __str__(self):
        return self.full_name + ".... " + self.job.job_title            