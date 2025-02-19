from django.db import models
from django.utils.timezone import now
from django.utils import timezone
from datetime import datetime
from django.urls import reverse
from django.db.models.fields.related import ForeignKey, OneToOneField
from ckeditor_uploader.fields import RichTextUploadingField
# Create your models here.
STATUS = (
    (0,"Draft"),
    (1,"Publish")
)

#Banner model     
class Banner(models.Model):
    banner_name = models.CharField(max_length=255)
    main_title = models.CharField(max_length=255, default='Need Business Consultation Today')
    description = models.TextField(max_length=300, blank=True)
    main_img = models.ImageField(upload_to='banner/%Y/%m/%d/')
    img_two = models.ImageField(upload_to='banner/%Y/%m/%d/',blank=True)
    img_three = models.ImageField(upload_to='banner/%Y/%m/%d/',blank=True)
    bshape_1= models.ImageField(upload_to='banner/%Y/%m/%d/',blank=True)
    bshape_2= models.ImageField(upload_to='banner/%Y/%m/%d/',blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
       
    def __str__(self):
        return self.banner_name
    
#Client model     
class Client(models.Model):
    # vendor = models.ForeignKey(Vendor, on_delete=models.CASCADE)
    client_name = models.CharField(max_length=100)
    client_Logo = models.ImageField(upload_to='photos/clients', blank=True)
    client_website = models.URLField(max_length=100, blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
    def __str__(self):
        return self.client_name 
    
    

class Services(models.Model):
    service_name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=200, unique=True)
    meta_title = models.CharField(max_length=100, blank=True)
    meta_description = models.TextField(max_length=300, blank=True)
    meta_keywords = models.TextField(max_length=300, blank=True)
    services_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    flaticon_class = models.CharField(max_length=100, default='flaticon-inspiration', blank=True)
    description = RichTextUploadingField(blank=True, null=True)
    # consultants = models.ManyToManyField(Consultant, blank=True)  # Add Consultants
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    # price = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    # duration = models.CharField(max_length=100, blank=True)
    class Meta:
        verbose_name = 'Service'
        verbose_name_plural = 'Services'
    
    def get_url(self):
        return reverse('service_detail', args=[self.slug])
    
    def __str__(self):
        return self.service_name

    
    
class Service_detail(models.Model):
    services = OneToOneField(Services, on_delete=models.CASCADE, blank=True, null=True)
    services_img = models.ImageField(upload_to='banner/%Y/%m/%d/',blank=True)
    main_title = models.CharField(max_length=255, default='Make Better Products Make Products Better')
    description = RichTextUploadingField(blank=True, null=True)
    services1_name = models.CharField(max_length=255, default='Finance Consulting',blank=True)
    services1_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services1_flaticon = models.CharField(max_length=100, default='flaticon-inspiration', blank=True)
    services1_content    = models.TextField(max_length=300,blank=True)
    services2_name = models.CharField(max_length=255, default='Finance Consulting',blank=True)
    services2_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services2_flaticon = models.CharField(max_length=100, default='flaticon-inspiration', blank=True)
    services2_content    = models.TextField(max_length=300,blank=True)
    title_two = models.CharField(max_length=255, default='Make Better Products Make Products Better',blank=True)
    title_two_content = RichTextUploadingField(blank=True, null=True)
    list_wrap1 = models.CharField(max_length=255, default='100% Better results',blank=True)
    list_wrap2 = models.CharField(max_length=255, default='Valuable Ideas', blank=True)
    list_wrap3 = models.CharField(max_length=255, default='Budget Friendly Theme',blank=True)
    list_wrap4 = models.CharField(max_length=255, default='Happy Customers',blank=True)
    title_three = models.CharField(max_length=255, default='Quality Industrial Working',blank=True)
    info_one = RichTextUploadingField(blank=True, null=True)
    img_one = models.ImageField(upload_to='services/services_details', blank=True)
    img_two = models.ImageField(upload_to='services/services_details', blank=True)
    info_two = RichTextUploadingField(blank=True, null=True)
    
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)


    def __str__(self):
        return self.main_title + ".... " + self.services.service_name
    
class Brochure(models.Model):
    services = models.ForeignKey(Services,on_delete=models.CASCADE)
    brochure_name = models.CharField(max_length=200)
    brochure_file_link = models.URLField(blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)


    def __str__(self):
        return self.brochure_name + ".... " + self.services.service_name 
    
    
class Team(models.Model):
    team_name = models.CharField(max_length=255)
    slug        = models.SlugField(max_length=300, unique=True,blank=True)
    designation = models.CharField(max_length=255)
    photo = models.ImageField(upload_to='teams/%Y/%m/%d/')
    facebook_link = models.URLField(max_length=200, blank=True)
    twitter_link = models.URLField(max_length=200, blank=True)
    instagram_link = models.URLField(max_length=200, blank=True)
    pinterest_link = models.URLField(max_length=200, blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)

    def __str__(self):
        return self.team_name   
    
    
#KNOW US     
class Know_us(models.Model):
    heading_name = models.CharField(max_length=255)
    main_title = models.CharField(max_length=255, default='We are the next gen Business experience')
    description = RichTextUploadingField(max_length=300, blank=True)
    mask_img = models.ImageField(upload_to='home/%Y/%m/%d/')
    flaticon_class = models.CharField(max_length=100, default='flaticon-business-presentation', blank=True)
    img_two = models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    bshape_1= models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    bshape_2= models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    bshape_3= models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    services1_name = models.CharField(max_length=255, default='Business Growth')
    services1_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services1_flaticon = models.CharField(max_length=100, default='flaticon-profit', blank=True)
    services1_content    = models.TextField(max_length=300,blank=True)
    services2_name = models.CharField(max_length=255, default='Target Audience')
    services2_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services2_flaticon = models.CharField(max_length=100, default='flaticon-mission', blank=True)
    services2_content    = models.TextField(max_length=300,blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
       
    def __str__(self):
        return self.heading_name 
    
    
#COMPANY OVERVIEW     
class Company_overview(models.Model):
    heading_name = models.CharField(max_length=255)
    main_title = models.CharField(max_length=255, default='We Prepare An Effective Strategy For Companies')
    description = RichTextUploadingField(max_length=300, blank=True)
    mask_img = models.ImageField(upload_to='home/%Y/%m/%d/')
    img_two = models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    bshape_1= models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    bshape_2= models.ImageField(upload_to='home/%Y/%m/%d/',blank=True)
    services1_name = models.CharField(max_length=255, default='Business Growth',blank=True)
    progressbar_1 = models.IntegerField(default=85,blank=True)
    services2_name = models.CharField(max_length=255, default='Investment',blank=True)
    progressbar_2 = models.IntegerField(default=76,blank=True)
    services3_name = models.CharField(max_length=255, default='Investment',blank=True)
    progressbar_3 = models.IntegerField(default=90,blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
       
    def __str__(self):
        return self.heading_name
    
      
class Testimonial(models.Model):
    RATING_CHOICES = (
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    )
    testimonial_title = models.CharField(max_length=255)
    content = RichTextUploadingField()
    full_name = models.CharField(max_length=255, blank=True)
    client_photo = models.ImageField(upload_to='testimonials/%Y/%m/%d/', blank=True)
    designation = models.CharField(max_length=255, blank=True)
    company_name = models.CharField(max_length=100, blank=True)
    rating = models.PositiveSmallIntegerField(choices=RATING_CHOICES)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)

    def __str__(self):
        return self.testimonial_title
    
    
class General(models.Model):
    website_name = models.CharField(max_length=100, default='AdvertSneak Technologies')
    meta_title = models.CharField(max_length=100, default='AdvertSneak Technologies')
    meta_description = models.TextField(max_length=300,blank=True)
    meta_keywords = models.TextField(max_length=300,blank=True)
    google_meta_tag = models.CharField(max_length=500, blank=True)
    website_url = models.URLField(max_length=200, blank=True)
    favicon = models.ImageField(upload_to='favicon', blank=True)
    logo= models.ImageField(upload_to='logo', blank=True)
    footer_logo= models.ImageField(upload_to='logo', blank=True)
    phone_no1 = models.CharField(max_length=50,blank=True)
    phone_no2 = models.CharField(max_length=50,blank=True)
    email1 = models.EmailField(max_length=200,blank=True)
    email2 = models.EmailField(max_length=200,blank=True)
    whatsapp_link = models.URLField(max_length=300, blank=True)
    address = models.TextField(max_length=300,blank=True)
    facebook_link = models.URLField(max_length=200, blank=True)
    linkedin_link = models.URLField(max_length=200, blank=True)
    instagram_link = models.URLField(max_length=200, blank=True)
    twitter_link = models.URLField(max_length=200, blank=True)
    youtube_link = models.URLField(max_length=200, blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    

    def __str__(self):
        return self.website_name
    
#about     
class About(models.Model):
    name = models.CharField(max_length=255,default='About Us')
    heading_name = models.CharField(max_length=255,default='GET TO KNOW MORE')
    main_title = models.CharField(max_length=255, default='We Have More Than 20+ Years Of Practical Finance Industries')
    about_img = models.ImageField(upload_to='about/%Y/%m/%d/')
    inner_about = models.ImageField(upload_to='about/%Y/%m/%d/',blank=True)
    inner_about_3= models.ImageField(upload_to='about/%Y/%m/%d/',blank=True)
    services1_name = models.CharField(max_length=255, default='Business Growth')
    services1_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services1_flaticon = models.CharField(max_length=100, default='flaticon-business-presentation', blank=True)
    services1_content    = models.CharField(max_length=300,blank=True)
    services2_name = models.CharField(max_length=255, default='Finance Investment')
    services2_thumb = models.ImageField(upload_to='services/thumb', blank=True)
    services2_flaticon = models.CharField(max_length=100, default='flaticon-investment', blank=True)
    services2_content    = models.CharField(max_length=300,blank=True)
    button_name = models.CharField(max_length=255,default='Our Services')
    button_link = models.URLField(max_length=200, blank=True)
    ceo_name = models.CharField(max_length=255,default='Mark Stranger')
    designation = models.CharField(max_length=255,default='CEO, Gerow Finance')
    section3_title = models.CharField(max_length=255,default='SKILLED TEAM MEMBERS')
    section3_heading = models.CharField(max_length=255,default='Meet Our Dedicated Team')
    section3_content = models.CharField(max_length=255,default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.')
    section4_img = models.ImageField(upload_to='about/%Y/%m/%d/')
    meta_title      = models.CharField(max_length=150, blank=True)
    meta_description = models.CharField(max_length=300,blank=True)
    meta_keywords    = models.CharField(max_length=300,blank=True)
    description = RichTextUploadingField(max_length=255, blank=True)
    bg_banner = models.ImageField(upload_to='photos/banner', blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
       
    def __str__(self):
        return self.name
    
class What_specialty(models.Model):
    heading_name = models.CharField(max_length=255,default='WHAT SPECIALTY')
    main_title = models.CharField(max_length=255, default='Keep Your Business Safe & Ensure High Availability.')
    description = RichTextUploadingField(max_length=300, blank=True,default='Ever find yourself staring at your computer s good consulting slogan to come to mind? Oftentimes.')
    img_three = models.ImageField(upload_to='about/%Y/%m/%d/')
    item1_name = models.CharField(max_length=255, default='Accordion Name 1')
    item1_content    = models.TextField(max_length=300,blank=True,default='Accordion content 1')
    item2_name = models.CharField(max_length=255, default='Accordion Name 2')
    item2_content    = models.TextField(max_length=300,blank=True,default='Accordion content 2')
    item3_name = models.CharField(max_length=255, default='Accordion Name 3')
    item3_content    = models.TextField(max_length=300,blank=True,default='Accordion content 3')
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    
       
    def __str__(self):
        return self.heading_name
                                          
class Contact(models.Model):
    page_name = models.CharField(max_length=100)
    meta_title      = models.CharField(max_length=150, blank=True)
    meta_description = models.TextField(max_length=300,blank=True)
    meta_keywords    = models.TextField(max_length=300,blank=True)
    bg_banner = models.ImageField(upload_to='photos/banner', blank=True)
    get_in_touch_title= models.CharField(max_length=100, default='Get in touch with us')
    phone_no1 = models.CharField(max_length=100, blank=True)
    phone_no2 = models.CharField(max_length=100, blank=True)
    email1 = models.CharField(max_length=100, blank=True)
    email2 = models.CharField(max_length=100, blank=True)
    address1 = models.CharField(max_length=200, blank=True)
    address2 = models.CharField(max_length=200, blank=True)
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    

    class Meta:
        verbose_name = 'Contact'
        verbose_name_plural = 'Contact Us'

    def __str__(self):
        return self.page_name 

   
# Create your models here.
class Feedback(models.Model):
    full_name = models.CharField(max_length=100)
    subject = models.CharField(max_length=100,blank=True)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=18)
    message = models.TextField(blank=True)
    create_date = models.DateTimeField(blank=True, default=datetime.now)
    
    class Meta:
        verbose_name = 'feedback'
        verbose_name_plural = 'feedback'
    def __str__(self):
        return self.email
    
# Create your models here.
class Services_enquiry(models.Model):
    # services = models.ForeignKey(Services, on_delete=models.PROTECT, related_name='sevices_enquiries')
    services_id = models.IntegerField(blank=True)
    full_name = models.CharField(max_length=100)
    services_title = models.CharField(max_length=300)
    services_url = models.SlugField(max_length=500)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=100)
    city = models.CharField(max_length=100,blank=True)
    message = models.TextField(blank=True)
    user_id = models.IntegerField(blank=True)
    create_date = models.DateTimeField(blank=True, default=datetime.now)
    
    class Meta:
        verbose_name = 'enquiry'
        verbose_name_plural = 'enquiry'
    def __str__(self):
        return self.email
    
                                                   
class Home(models.Model):
    page_name = models.CharField(max_length=100)
    meta_title      = models.CharField(max_length=150, blank=True)
    meta_description = models.TextField(max_length=300,blank=True)
    meta_keywords    = models.TextField(max_length=300,blank=True)
    brand_title= models.CharField(max_length=100, default='Trusted by 10,000+ companies around the world')
    section1_subtitle= models.CharField(max_length=100, default='WHAT WE DO FOR YOU')
    section1_title= models.CharField(max_length=100, default='The features that make our Service unique')
    section5_subtitle = models.CharField(max_length=100, blank=True,default='COMPLETE PROJECTS')
    section5_title= models.CharField(max_length=100, default='A Complete Solution For Global Business')
    section5_button = models.CharField(max_length=100, blank=True,default='See All Projects')
    team_subtitle= models.CharField(max_length=100, default='EXPERT PEOPLE')
    team_title= models.CharField(max_length=100, default='Dedicated Team Members')
    team_description = models.TextField(max_length=300,blank=True,default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.')
    testimonial_img = models.ImageField(upload_to='testimonial', blank=True)
    blog_subtitle = models.CharField(max_length=100, blank=True,default='NEWS & BLOGS')
    blog_title= models.CharField(max_length=100, default='Read Our Latest Updates')
    blog_description = models.TextField(max_length=300,blank=True,default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes')
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    

    class Meta:
        verbose_name = 'Home Page'
        verbose_name_plural = 'Home'

    def __str__(self):
        return self.page_name 
    
    
class Counter(models.Model):
    name = models.CharField(max_length=100)
    counter_item1      = models.CharField(max_length=150, default='Success Rate')
    data_count1    = models.IntegerField(blank=True,default='95')
    counter_item2      = models.CharField(max_length=150, default='Complete Projects')
    data_count2    = models.IntegerField(blank=True,default='55')
    counter_item3      = models.CharField(max_length=150, default='Satisfied Clients')
    data_count3    = models.IntegerField(blank=True,default='25')
    counter_item4      = models.CharField(max_length=150, default='Trade In The World')
    data_count4    = models.IntegerField(blank=True,default='15')
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    

    class Meta:
        verbose_name = 'Counter'
        verbose_name_plural = 'Counters'

    def __str__(self):
        return self.name
    
class Bg_banner(models.Model):
    name = models.CharField(max_length=100)
    bg_banner = models.ImageField(upload_to='photos/banner', blank=True)
    title= models.CharField(max_length=100, default='Banner Title')
    created_on = models.DateTimeField(default=timezone.now)
    updated_on = models.DateTimeField(auto_now=True)
    status = models.IntegerField(choices=STATUS, default=0)
    

    class Meta:
        verbose_name = 'Page Banner'
        verbose_name_plural = 'Page Banners'

    def __str__(self):
        return self.name                                                  
    


