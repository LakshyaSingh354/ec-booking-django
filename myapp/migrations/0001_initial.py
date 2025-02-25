# Generated by Django 5.1.6 on 2025-02-25 19:24

import ckeditor_uploader.fields
import datetime
import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='About',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='About Us', max_length=255)),
                ('heading_name', models.CharField(default='GET TO KNOW MORE', max_length=255)),
                ('main_title', models.CharField(default='We Have More Than 20+ Years Of Practical Finance Industries', max_length=255)),
                ('about_img', models.ImageField(upload_to='about/%Y/%m/%d/')),
                ('inner_about', models.ImageField(blank=True, upload_to='about/%Y/%m/%d/')),
                ('inner_about_3', models.ImageField(blank=True, upload_to='about/%Y/%m/%d/')),
                ('services1_name', models.CharField(default='Business Growth', max_length=255)),
                ('services1_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services1_flaticon', models.CharField(blank=True, default='flaticon-business-presentation', max_length=100)),
                ('services1_content', models.CharField(blank=True, max_length=300)),
                ('services2_name', models.CharField(default='Finance Investment', max_length=255)),
                ('services2_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services2_flaticon', models.CharField(blank=True, default='flaticon-investment', max_length=100)),
                ('services2_content', models.CharField(blank=True, max_length=300)),
                ('button_name', models.CharField(default='Our Services', max_length=255)),
                ('button_link', models.URLField(blank=True)),
                ('ceo_name', models.CharField(default='Mark Stranger', max_length=255)),
                ('designation', models.CharField(default='CEO, Gerow Finance', max_length=255)),
                ('section3_title', models.CharField(default='SKILLED TEAM MEMBERS', max_length=255)),
                ('section3_heading', models.CharField(default='Meet Our Dedicated Team', max_length=255)),
                ('section3_content', models.CharField(default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.', max_length=255)),
                ('section4_img', models.ImageField(upload_to='about/%Y/%m/%d/')),
                ('meta_title', models.CharField(blank=True, max_length=150)),
                ('meta_description', models.CharField(blank=True, max_length=300)),
                ('meta_keywords', models.CharField(blank=True, max_length=300)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, max_length=255)),
                ('bg_banner', models.ImageField(blank=True, upload_to='photos/banner')),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('banner_name', models.CharField(max_length=255)),
                ('main_title', models.CharField(default='Need Business Consultation Today', max_length=255)),
                ('description', models.TextField(blank=True, max_length=300)),
                ('main_img', models.ImageField(upload_to='banner/%Y/%m/%d/')),
                ('img_two', models.ImageField(blank=True, upload_to='banner/%Y/%m/%d/')),
                ('img_three', models.ImageField(blank=True, upload_to='banner/%Y/%m/%d/')),
                ('bshape_1', models.ImageField(blank=True, upload_to='banner/%Y/%m/%d/')),
                ('bshape_2', models.ImageField(blank=True, upload_to='banner/%Y/%m/%d/')),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Bg_banner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('bg_banner', models.ImageField(blank=True, upload_to='photos/banner')),
                ('title', models.CharField(default='Banner Title', max_length=100)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Page Banner',
                'verbose_name_plural': 'Page Banners',
            },
        ),
        migrations.CreateModel(
            name='ChatMessage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_message', models.TextField()),
                ('bot_response', models.TextField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('client_name', models.CharField(max_length=100)),
                ('client_Logo', models.ImageField(blank=True, upload_to='photos/clients')),
                ('client_website', models.URLField(blank=True, max_length=100)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Company_overview',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading_name', models.CharField(max_length=255)),
                ('main_title', models.CharField(default='We Prepare An Effective Strategy For Companies', max_length=255)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, max_length=300)),
                ('mask_img', models.ImageField(upload_to='home/%Y/%m/%d/')),
                ('img_two', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('bshape_1', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('bshape_2', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('services1_name', models.CharField(blank=True, default='Business Growth', max_length=255)),
                ('progressbar_1', models.IntegerField(blank=True, default=85)),
                ('services2_name', models.CharField(blank=True, default='Investment', max_length=255)),
                ('progressbar_2', models.IntegerField(blank=True, default=76)),
                ('services3_name', models.CharField(blank=True, default='Investment', max_length=255)),
                ('progressbar_3', models.IntegerField(blank=True, default=90)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('page_name', models.CharField(max_length=100)),
                ('meta_title', models.CharField(blank=True, max_length=150)),
                ('meta_description', models.TextField(blank=True, max_length=300)),
                ('meta_keywords', models.TextField(blank=True, max_length=300)),
                ('bg_banner', models.ImageField(blank=True, upload_to='photos/banner')),
                ('get_in_touch_title', models.CharField(default='Get in touch with us', max_length=100)),
                ('phone_no1', models.CharField(blank=True, max_length=100)),
                ('phone_no2', models.CharField(blank=True, max_length=100)),
                ('email1', models.CharField(blank=True, max_length=100)),
                ('email2', models.CharField(blank=True, max_length=100)),
                ('address1', models.CharField(blank=True, max_length=200)),
                ('address2', models.CharField(blank=True, max_length=200)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Contact',
                'verbose_name_plural': 'Contact Us',
            },
        ),
        migrations.CreateModel(
            name='Counter',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('counter_item1', models.CharField(default='Success Rate', max_length=150)),
                ('data_count1', models.IntegerField(blank=True, default='95')),
                ('counter_item2', models.CharField(default='Complete Projects', max_length=150)),
                ('data_count2', models.IntegerField(blank=True, default='55')),
                ('counter_item3', models.CharField(default='Satisfied Clients', max_length=150)),
                ('data_count3', models.IntegerField(blank=True, default='25')),
                ('counter_item4', models.CharField(default='Trade In The World', max_length=150)),
                ('data_count4', models.IntegerField(blank=True, default='15')),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Counter',
                'verbose_name_plural': 'Counters',
            },
        ),
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=100)),
                ('subject', models.CharField(blank=True, max_length=100)),
                ('email', models.EmailField(max_length=100)),
                ('phone', models.CharField(max_length=18)),
                ('message', models.TextField(blank=True)),
                ('create_date', models.DateTimeField(blank=True, default=datetime.datetime.now)),
            ],
            options={
                'verbose_name': 'feedback',
                'verbose_name_plural': 'feedback',
            },
        ),
        migrations.CreateModel(
            name='General',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('website_name', models.CharField(default='AdvertSneak Technologies', max_length=100)),
                ('meta_title', models.CharField(default='AdvertSneak Technologies', max_length=100)),
                ('meta_description', models.TextField(blank=True, max_length=300)),
                ('meta_keywords', models.TextField(blank=True, max_length=300)),
                ('google_meta_tag', models.CharField(blank=True, max_length=500)),
                ('website_url', models.URLField(blank=True)),
                ('favicon', models.ImageField(blank=True, upload_to='favicon')),
                ('logo', models.ImageField(blank=True, upload_to='logo')),
                ('footer_logo', models.ImageField(blank=True, upload_to='logo')),
                ('phone_no1', models.CharField(blank=True, max_length=50)),
                ('phone_no2', models.CharField(blank=True, max_length=50)),
                ('email1', models.EmailField(blank=True, max_length=200)),
                ('email2', models.EmailField(blank=True, max_length=200)),
                ('whatsapp_link', models.URLField(blank=True, max_length=300)),
                ('address', models.TextField(blank=True, max_length=300)),
                ('facebook_link', models.URLField(blank=True)),
                ('linkedin_link', models.URLField(blank=True)),
                ('instagram_link', models.URLField(blank=True)),
                ('twitter_link', models.URLField(blank=True)),
                ('youtube_link', models.URLField(blank=True)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Home',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('page_name', models.CharField(max_length=100)),
                ('meta_title', models.CharField(blank=True, max_length=150)),
                ('meta_description', models.TextField(blank=True, max_length=300)),
                ('meta_keywords', models.TextField(blank=True, max_length=300)),
                ('brand_title', models.CharField(default='Trusted by 10,000+ companies around the world', max_length=100)),
                ('section1_subtitle', models.CharField(default='WHAT WE DO FOR YOU', max_length=100)),
                ('section1_title', models.CharField(default='The features that make our Service unique', max_length=100)),
                ('section5_subtitle', models.CharField(blank=True, default='COMPLETE PROJECTS', max_length=100)),
                ('section5_title', models.CharField(default='A Complete Solution For Global Business', max_length=100)),
                ('section5_button', models.CharField(blank=True, default='See All Projects', max_length=100)),
                ('team_subtitle', models.CharField(default='EXPERT PEOPLE', max_length=100)),
                ('team_title', models.CharField(default='Dedicated Team Members', max_length=100)),
                ('team_description', models.TextField(blank=True, default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes.', max_length=300)),
                ('testimonial_img', models.ImageField(blank=True, upload_to='testimonial')),
                ('blog_subtitle', models.CharField(blank=True, default='NEWS & BLOGS', max_length=100)),
                ('blog_title', models.CharField(default='Read Our Latest Updates', max_length=100)),
                ('blog_description', models.TextField(blank=True, default='Ever find yourself staring at your computer screen a good consulting slogan to come to mind? Oftentimes', max_length=300)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Home Page',
                'verbose_name_plural': 'Home',
            },
        ),
        migrations.CreateModel(
            name='Know_us',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading_name', models.CharField(max_length=255)),
                ('main_title', models.CharField(default='We are the next gen Business experience', max_length=255)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, max_length=300)),
                ('mask_img', models.ImageField(upload_to='home/%Y/%m/%d/')),
                ('flaticon_class', models.CharField(blank=True, default='flaticon-business-presentation', max_length=100)),
                ('img_two', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('bshape_1', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('bshape_2', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('bshape_3', models.ImageField(blank=True, upload_to='home/%Y/%m/%d/')),
                ('services1_name', models.CharField(default='Business Growth', max_length=255)),
                ('services1_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services1_flaticon', models.CharField(blank=True, default='flaticon-profit', max_length=100)),
                ('services1_content', models.TextField(blank=True, max_length=300)),
                ('services2_name', models.CharField(default='Target Audience', max_length=255)),
                ('services2_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services2_flaticon', models.CharField(blank=True, default='flaticon-mission', max_length=100)),
                ('services2_content', models.TextField(blank=True, max_length=300)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Products',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=100)),
                ('slug', models.SlugField(max_length=200, unique=True)),
                ('meta_title', models.CharField(blank=True, max_length=100)),
                ('meta_description', models.TextField(blank=True, max_length=300)),
                ('meta_keywords', models.TextField(blank=True, max_length=300)),
                ('product_thumb', models.ImageField(blank=True, upload_to='products/thumb')),
                ('flaticon_class', models.CharField(blank=True, default='flaticon-inspiration', max_length=100)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('price', models.DecimalField(decimal_places=2, default=0.0, max_digits=10)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Product',
                'verbose_name_plural': 'Products',
            },
        ),
        migrations.CreateModel(
            name='Services',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('service_name', models.CharField(max_length=100)),
                ('slug', models.SlugField(max_length=200, unique=True)),
                ('meta_title', models.CharField(blank=True, max_length=100)),
                ('meta_description', models.TextField(blank=True, max_length=300)),
                ('meta_keywords', models.TextField(blank=True, max_length=300)),
                ('services_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('flaticon_class', models.CharField(blank=True, default='flaticon-inspiration', max_length=100)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
            options={
                'verbose_name': 'Service',
                'verbose_name_plural': 'Services',
            },
        ),
        migrations.CreateModel(
            name='Services_enquiry',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('services_id', models.IntegerField(blank=True)),
                ('full_name', models.CharField(max_length=100)),
                ('services_title', models.CharField(max_length=300)),
                ('services_url', models.SlugField(max_length=500)),
                ('email', models.EmailField(max_length=100)),
                ('phone', models.CharField(max_length=100)),
                ('city', models.CharField(blank=True, max_length=100)),
                ('message', models.TextField(blank=True)),
                ('user_id', models.IntegerField(blank=True)),
                ('create_date', models.DateTimeField(blank=True, default=datetime.datetime.now)),
            ],
            options={
                'verbose_name': 'enquiry',
                'verbose_name_plural': 'enquiry',
            },
        ),
        migrations.CreateModel(
            name='Team',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('team_name', models.CharField(max_length=255)),
                ('slug', models.SlugField(blank=True, max_length=300, unique=True)),
                ('designation', models.CharField(max_length=255)),
                ('photo', models.ImageField(upload_to='teams/%Y/%m/%d/')),
                ('facebook_link', models.URLField(blank=True)),
                ('twitter_link', models.URLField(blank=True)),
                ('instagram_link', models.URLField(blank=True)),
                ('pinterest_link', models.URLField(blank=True)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Testimonial',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('testimonial_title', models.CharField(max_length=255)),
                ('content', ckeditor_uploader.fields.RichTextUploadingField()),
                ('full_name', models.CharField(blank=True, max_length=255)),
                ('client_photo', models.ImageField(blank=True, upload_to='testimonials/%Y/%m/%d/')),
                ('designation', models.CharField(blank=True, max_length=255)),
                ('company_name', models.CharField(blank=True, max_length=100)),
                ('rating', models.PositiveSmallIntegerField(choices=[(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5')])),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='What_specialty',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('heading_name', models.CharField(default='WHAT SPECIALTY', max_length=255)),
                ('main_title', models.CharField(default='Keep Your Business Safe & Ensure High Availability.', max_length=255)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, default='Ever find yourself staring at your computer s good consulting slogan to come to mind? Oftentimes.', max_length=300)),
                ('img_three', models.ImageField(upload_to='about/%Y/%m/%d/')),
                ('item1_name', models.CharField(default='Accordion Name 1', max_length=255)),
                ('item1_content', models.TextField(blank=True, default='Accordion content 1', max_length=300)),
                ('item2_name', models.CharField(default='Accordion Name 2', max_length=255)),
                ('item2_content', models.TextField(blank=True, default='Accordion content 2', max_length=300)),
                ('item3_name', models.CharField(default='Accordion Name 3', max_length=255)),
                ('item3_content', models.TextField(blank=True, default='Accordion content 3', max_length=300)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Service_detail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('services_img', models.ImageField(blank=True, upload_to='banner/%Y/%m/%d/')),
                ('main_title', models.CharField(default='Make Better Products Make Products Better', max_length=255)),
                ('description', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('services1_name', models.CharField(blank=True, default='Finance Consulting', max_length=255)),
                ('services1_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services1_flaticon', models.CharField(blank=True, default='flaticon-inspiration', max_length=100)),
                ('services1_content', models.TextField(blank=True, max_length=300)),
                ('services2_name', models.CharField(blank=True, default='Finance Consulting', max_length=255)),
                ('services2_thumb', models.ImageField(blank=True, upload_to='services/thumb')),
                ('services2_flaticon', models.CharField(blank=True, default='flaticon-inspiration', max_length=100)),
                ('services2_content', models.TextField(blank=True, max_length=300)),
                ('title_two', models.CharField(blank=True, default='Make Better Products Make Products Better', max_length=255)),
                ('title_two_content', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('list_wrap1', models.CharField(blank=True, default='100% Better results', max_length=255)),
                ('list_wrap2', models.CharField(blank=True, default='Valuable Ideas', max_length=255)),
                ('list_wrap3', models.CharField(blank=True, default='Budget Friendly Theme', max_length=255)),
                ('list_wrap4', models.CharField(blank=True, default='Happy Customers', max_length=255)),
                ('title_three', models.CharField(blank=True, default='Quality Industrial Working', max_length=255)),
                ('info_one', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('img_one', models.ImageField(blank=True, upload_to='services/services_details')),
                ('img_two', models.ImageField(blank=True, upload_to='services/services_details')),
                ('info_two', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
                ('services', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='myapp.services')),
            ],
        ),
        migrations.CreateModel(
            name='Brochure',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brochure_name', models.CharField(max_length=200)),
                ('brochure_file_link', models.URLField(blank=True)),
                ('created_on', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_on', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(choices=[(0, 'Draft'), (1, 'Publish')], default=0)),
                ('services', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.services')),
            ],
        ),
    ]
