from django.core import validators
from accounts.validators import allow_only_images_validator
from django import forms
from .models import*

      
class FeedbackForm(forms.ModelForm):
    class Meta:
        model=Feedback
        fields=[
            'full_name','subject','email','phone','message'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(FeedbackForm, self).__init__(*args, **kwargs)
        self.fields['full_name'].widget.attrs['placeholder'] = 'Your Name'
        self.fields['subject'].widget.attrs['placeholder'] = 'Subject'
        self.fields['email'].widget.attrs['placeholder'] = 'Email'
        self.fields['phone'].widget.attrs['placeholder'] = 'Phone No.'
        self.fields['message'].widget.attrs['placeholder'] = 'Type Your Message'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
class AboutForm(forms.ModelForm):
    bg_banner = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    inner_about = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    inner_about_3 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    section4_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=About
        fields=[
            'name','heading_name','main_title','description','about_img','inner_about','inner_about_3','services1_name',
            'services1_flaticon','services1_content','services2_name','services2_flaticon','services2_content','button_name',
            'button_link','ceo_name','designation','section3_title','section3_heading','section3_content','meta_title','meta_description',
            'meta_keywords','bg_banner','section4_img','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(AboutForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Name'
        self.fields['heading_name'].widget.attrs['placeholder'] = 'Heading Name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'Main title'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['services1_name'].widget.attrs['placeholder'] = 'services1 name'
        self.fields['services1_flaticon'].widget.attrs['placeholder'] = 'services1 flaticon'
        self.fields['services1_content'].widget.attrs['placeholder'] = 'services1 content'
        self.fields['services2_name'].widget.attrs['placeholder'] = 'services2 name'
        self.fields['services2_flaticon'].widget.attrs['placeholder'] = 'services2_flaticon'
        self.fields['services2_content'].widget.attrs['placeholder'] = 'services2 content'
        self.fields['button_name'].widget.attrs['placeholder'] = 'button name'
        self.fields['button_link'].widget.attrs['placeholder'] = 'button link'
        self.fields['ceo_name'].widget.attrs['placeholder'] = 'ceo name'
        self.fields['designation'].widget.attrs['placeholder'] = 'designation'
        self.fields['section3_title'].widget.attrs['placeholder'] = 'section3 title'
        self.fields['section3_heading'].widget.attrs['placeholder'] = 'section3 heading'
        self.fields['section3_content'].widget.attrs['placeholder'] = 'section3 content'
        self.fields['meta_title'].widget.attrs['placeholder'] = 'meta title'
        self.fields['meta_description'].widget.attrs['placeholder'] = 'meta description'
        self.fields['meta_keywords'].widget.attrs['placeholder'] = 'meta keywords'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class SpecialtyForm(forms.ModelForm):
    img_three = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=What_specialty
        fields=[
            'heading_name','main_title','description','img_three','item1_name','item1_content','item2_name','item2_content',
            'item3_name','item3_content','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(SpecialtyForm, self).__init__(*args, **kwargs)
        self.fields['heading_name'].widget.attrs['placeholder'] = 'heading name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'main title'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['item1_name'].widget.attrs['placeholder'] = 'Item1 Name'
        self.fields['item1_content'].widget.attrs['placeholder'] = 'Item1 Content'
        self.fields['item2_name'].widget.attrs['placeholder'] = 'Item2 Name'
        self.fields['item2_content'].widget.attrs['placeholder'] = 'Item2 Content'
        self.fields['item3_name'].widget.attrs['placeholder'] = 'Item3 Name'
        self.fields['item3_content'].widget.attrs['placeholder'] = 'Item3 Content'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
            
class TeamForm(forms.ModelForm):
    photo = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Team
        fields=[
            'team_name','designation','photo','facebook_link','twitter_link','instagram_link','pinterest_link',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(TeamForm, self).__init__(*args, **kwargs)
        self.fields['team_name'].widget.attrs['placeholder'] = 'Team Name'
        self.fields['designation'].widget.attrs['placeholder'] = 'Designation'
        self.fields['facebook_link'].widget.attrs['placeholder'] = 'facebook link'
        self.fields['twitter_link'].widget.attrs['placeholder'] = 'twitter link'
        self.fields['instagram_link'].widget.attrs['placeholder'] = 'instagram link'
        self.fields['pinterest_link'].widget.attrs['placeholder'] = 'pinterest link'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
class TestimonialForm(forms.ModelForm):
    client_photo = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Testimonial
        fields=[
            'testimonial_title','content','full_name','client_photo','designation','company_name','rating',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(TestimonialForm, self).__init__(*args, **kwargs)
        self.fields['testimonial_title'].widget.attrs['placeholder'] = 'Testimonial Title'
        self.fields['content'].widget.attrs['placeholder'] = 'Content'
        self.fields['full_name'].widget.attrs['placeholder'] = 'Full Name'
        self.fields['designation'].widget.attrs['placeholder'] = 'Designation'
        self.fields['company_name'].widget.attrs['placeholder'] = 'Company Name'
        self.fields['rating'].widget.attrs['placeholder'] = 'Rating'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
       
            
class ClientForm(forms.ModelForm):
    client_Logo = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Client
        fields=[
            'client_name','client_Logo','client_website',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(ClientForm, self).__init__(*args, **kwargs)
        self.fields['client_name'].widget.attrs['placeholder'] = 'Client Name'
        self.fields['client_website'].widget.attrs['placeholder'] = 'Client Website'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class BannerForm(forms.ModelForm):
    main_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    img_two= forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    img_three = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_1 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_2 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Banner
        fields=[
            'banner_name','main_title','description','main_img','img_two','img_three','bshape_1','bshape_2',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(BannerForm, self).__init__(*args, **kwargs)
        self.fields['banner_name'].widget.attrs['placeholder'] = 'Banner Name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'Main Title'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            
class HomeForm(forms.ModelForm):
    testimonial_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Home
        fields=[
            'page_name','meta_title','meta_description','meta_keywords','brand_title','section1_subtitle','section1_title','section5_subtitle',
            'section5_title','section5_button','team_subtitle','team_title','team_description','testimonial_img','blog_subtitle','blog_title','blog_description',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(HomeForm, self).__init__(*args, **kwargs)
        self.fields['page_name'].widget.attrs['placeholder'] = 'Page Name'
        self.fields['meta_title'].widget.attrs['placeholder'] = 'Meta Title'
        self.fields['meta_description'].widget.attrs['placeholder'] = 'Meta Description'
        self.fields['meta_keywords'].widget.attrs['placeholder'] = 'Meta Keywords'
        self.fields['brand_title'].widget.attrs['placeholder'] = 'Brand Title'
        self.fields['section1_subtitle'].widget.attrs['placeholder'] = 'Section1 Subtitle'
        self.fields['section1_title'].widget.attrs['placeholder'] = 'Section1 Title'
        self.fields['section5_subtitle'].widget.attrs['placeholder'] = 'Section5 Subtitle'
        self.fields['section5_title'].widget.attrs['placeholder'] = 'Section5 Title'
        self.fields['section5_button'].widget.attrs['placeholder'] = 'Section5 Button'
        self.fields['team_subtitle'].widget.attrs['placeholder'] = 'Team Subtitle'
        self.fields['team_title'].widget.attrs['placeholder'] = 'Team Title'
        self.fields['team_description'].widget.attrs['placeholder'] = 'Team Description'
        self.fields['blog_subtitle'].widget.attrs['placeholder'] = 'Blog Subtitle'
        self.fields['blog_title'].widget.attrs['placeholder'] = 'Blog Title'
        self.fields['blog_description'].widget.attrs['placeholder'] = 'Blog Description'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
       
            
class KnowUsForm(forms.ModelForm):
    mask_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    img_two= forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_1 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_2 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_3 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Know_us
        fields=[
            'heading_name','main_title','description','mask_img','flaticon_class','img_two','bshape_1','bshape_2','bshape_3',
            'services1_name','services1_flaticon','services1_content','services2_name','services2_flaticon','services2_content',
            'status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(KnowUsForm, self).__init__(*args, **kwargs)
        self.fields['heading_name'].widget.attrs['placeholder'] = 'Heading Name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'Main Title'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['flaticon_class'].widget.attrs['placeholder'] = 'flaticon class'
        self.fields['services1_name'].widget.attrs['placeholder'] = 'Services1 name'
        self.fields['services1_flaticon'].widget.attrs['placeholder'] = 'Services1 flaticon'
        self.fields['services1_content'].widget.attrs['placeholder'] = 'Services1 content'
        self.fields['services2_name'].widget.attrs['placeholder'] = 'Services2 name'
        self.fields['services2_flaticon'].widget.attrs['placeholder'] = 'Services2 flaticon'
        self.fields['services2_content'].widget.attrs['placeholder'] = 'Services2 content'

        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
            
class OverviewForm(forms.ModelForm):
    mask_img = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    img_two= forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_1 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    bshape_2 = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Company_overview
        fields=[
            'heading_name','main_title','description','mask_img','img_two','bshape_1','bshape_2','services1_name','progressbar_1',
            'services2_name','progressbar_2','services3_name','progressbar_3','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(OverviewForm, self).__init__(*args, **kwargs)
        self.fields['heading_name'].widget.attrs['placeholder'] = 'Heading Name'
        self.fields['main_title'].widget.attrs['placeholder'] = 'Main Title'
        self.fields['description'].widget.attrs['placeholder'] = 'Description'
        self.fields['services1_name'].widget.attrs['placeholder'] = 'Services1 name'
        self.fields['progressbar_1'].widget.attrs['placeholder'] = 'Progressbar 1'
        self.fields['services2_name'].widget.attrs['placeholder'] = 'Services2 name'
        self.fields['progressbar_2'].widget.attrs['placeholder'] = 'Progressbar 2'
        self.fields['services3_name'].widget.attrs['placeholder'] = 'Services3 Name'
        self.fields['progressbar_3'].widget.attrs['placeholder'] = 'Progressbar 3'

        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
   
            
class CounterForm(forms.ModelForm):
    class Meta:
        model=Counter
        fields=[
            'name','counter_item1','data_count1','counter_item2','data_count2','counter_item3','data_count3','counter_item4','data_count4','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(CounterForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Name'
        self.fields['counter_item1'].widget.attrs['placeholder'] = 'Counter Item1'
        self.fields['data_count1'].widget.attrs['placeholder'] = 'Data Count1'
        self.fields['counter_item2'].widget.attrs['placeholder'] = 'Counter Item2'
        self.fields['data_count2'].widget.attrs['placeholder'] = 'Data Count2'
        self.fields['counter_item3'].widget.attrs['placeholder'] = 'Counter Item3'
        self.fields['data_count3'].widget.attrs['placeholder'] = 'Data Count3'
        self.fields['counter_item4'].widget.attrs['placeholder'] = 'Counter Item4'
        self.fields['data_count4'].widget.attrs['placeholder'] = 'Data Count4'
  
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
         
            
class ContactPageForm(forms.ModelForm):
    bg_banner = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Contact
        fields=[
            'page_name','meta_title','meta_description','meta_keywords','bg_banner','get_in_touch_title','phone_no1','phone_no2',
            'email1','email2','address1','address2','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(ContactPageForm, self).__init__(*args, **kwargs)
        self.fields['page_name'].widget.attrs['placeholder'] = 'Page Name'
        self.fields['meta_title'].widget.attrs['placeholder'] = 'Meta Title'
        self.fields['meta_description'].widget.attrs['placeholder'] = 'Meta Description'
        self.fields['meta_keywords'].widget.attrs['placeholder'] = 'Meta Keywords'
        self.fields['get_in_touch_title'].widget.attrs['placeholder'] = 'get in touch title'
        self.fields['phone_no1'].widget.attrs['placeholder'] = 'Phone No1'
        self.fields['phone_no2'].widget.attrs['placeholder'] = 'Phone No2'
        self.fields['email1'].widget.attrs['placeholder'] = 'Email1'
        self.fields['email2'].widget.attrs['placeholder'] = 'Email2'
        self.fields['address1'].widget.attrs['placeholder'] = 'Address1'
        self.fields['address2'].widget.attrs['placeholder'] = 'Address2'
  
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            
            
class GeneralForm(forms.ModelForm):
    favicon = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    logo= forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    footer_logo = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=General
        fields=[
            'website_name','meta_title','meta_description','meta_keywords','google_meta_tag','website_url','favicon','logo','footer_logo',
            'phone_no1','phone_no2','email1','email2','whatsapp_link','address','facebook_link','linkedin_link','instagram_link','twitter_link',
            'youtube_link','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(GeneralForm, self).__init__(*args, **kwargs)
        self.fields['website_name'].widget.attrs['placeholder'] = 'Website Name'
        self.fields['meta_title'].widget.attrs['placeholder'] = 'Meta Title'
        self.fields['meta_description'].widget.attrs['placeholder'] = 'Meta Description'
        self.fields['meta_keywords'].widget.attrs['placeholder'] = 'Meta Keywords'
        self.fields['google_meta_tag'].widget.attrs['placeholder'] = 'Google Meta Tag'
        self.fields['website_url'].widget.attrs['placeholder'] = 'Website Url'
        self.fields['phone_no1'].widget.attrs['placeholder'] = 'Phone No1'
        self.fields['phone_no2'].widget.attrs['placeholder'] = 'Phone No2'
        self.fields['email1'].widget.attrs['placeholder'] = 'Email1'
        self.fields['email2'].widget.attrs['placeholder'] = 'Email2'
        self.fields['whatsapp_link'].widget.attrs['placeholder'] = 'Whatsapp Link'
        self.fields['address'].widget.attrs['placeholder'] = 'Address'
        self.fields['facebook_link'].widget.attrs['placeholder'] = 'Facebook Link'
        self.fields['twitter_link'].widget.attrs['placeholder'] = 'Twitter Link'
        self.fields['instagram_link'].widget.attrs['placeholder'] = 'Instagram Link'
        self.fields['linkedin_link'].widget.attrs['placeholder'] = 'Linkedin Link'
        self.fields['youtube_link'].widget.attrs['placeholder'] = 'YouTube Link'
  
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control' 
            

class PageBgForm(forms.ModelForm):
    bg_banner = forms.FileField(widget=forms.FileInput(attrs={'class': 'btn btn-info w-100'}), validators=[allow_only_images_validator])
    class Meta:
        model=Bg_banner
        fields=[
            'name','bg_banner','title','status'
        ]
        # widgets = {
        # 'message':forms.Textarea(attrs={'rows': 3, 'cols': 30})
        # }
    def __init__(self, *args, **kwargs):
        super(PageBgForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs['placeholder'] = 'Banner Name'
        self.fields['title'].widget.attrs['placeholder'] = 'Banner Title'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'                                                                                                                                                              