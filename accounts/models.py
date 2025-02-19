from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db.models.fields.related import ForeignKey, OneToOneField
from ckeditor_uploader.fields import RichTextUploadingField
from django.utils import timezone
from django.urls import reverse

# Create your models here.
STATUS = (
    (0,"Draft"),
    (1,"Publish")
)
class UserManager(BaseUserManager):
    def create_user(self, first_name, last_name, username, email, password=None):
        if not email:
            raise ValueError('User must have an email address')

        if not username:
            raise ValueError('User must have an username')

        user = self.model(
            email = self.normalize_email(email),
            username = username,
            first_name = first_name,
            last_name = last_name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, first_name, last_name, email, username, password):
        user = self.create_user(
            email = self.normalize_email(email),
            username = username,
            password = password,
            first_name = first_name,
            last_name = last_name,
        )
        user.is_admin = True
        user.is_active = True
        user.is_staff = True
        user.is_superadmin = True
        user.save(using=self._db)
        return user



class User(AbstractBaseUser):
    MYADMIN = 1
    CUSTOMER = 2

    ROLE_CHOICE = (
        (MYADMIN, 'Myadmin'),
        (CUSTOMER, 'Customer'),
    )
    first_name      = models.CharField(max_length=50)
    last_name       = models.CharField(max_length=50)
    username        = models.CharField(max_length=50, unique=True)
    email           = models.EmailField(max_length=100, unique=True)
    phone_number    = models.CharField(max_length=12, blank=True)
    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICE, blank=True, null=True)

    # required
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now_add=True)
    created_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=False)
    is_superadmin = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    objects = UserManager()

    def full_name(self):
        return f'{self.first_name} {self.last_name}'

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, add_label):
        return True
    
    def get_role(self):
        if self.role == 1:
            user_role = 'Myadmin'
        elif self.role == 2:
            user_role = 'Customer'
               
        return user_role
         
    
    
class UserProfile(models.Model):
    user = OneToOneField(User, on_delete=models.CASCADE, blank=True)
    profile_picture = models.ImageField(upload_to='users/profile_pictures', blank=True)
    # bio = RichTextUploadingField(max_length=350, blank=True)
    address = models.CharField(max_length=250, blank=True)
    country = models.CharField(max_length=15, blank=True)
    state = models.CharField(max_length=15, blank=True)
    city = models.CharField(max_length=15, blank=True)
    pin_code = models.CharField(max_length=6, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # def full_address(self):
    #     return f'{self.address_line_1}, {self.address_line_2}'

    def __str__(self):
        return self.user.first_name
    
class Author(models.Model):
    user = models.OneToOneField(User, related_name='user', on_delete=models.CASCADE)
    user_profile = models.OneToOneField(UserProfile, related_name='userprofile', on_delete=models.CASCADE)
    author_name = models.CharField(max_length=50)
    author_slug = models.SlugField(max_length=100, blank=True, null=True, unique=True)
    content = RichTextUploadingField(blank=True, null=True)
    designation = models.CharField(max_length=255,blank=True)
    is_approved = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.author_name 
    
class EmailSetting(models.Model):
    name = models.CharField(max_length=100, help_text="Email Name")
    enqmail = models.EmailField(max_length=200, help_text="Enquiry Mail Add")
    
    def __str__(self):
        return "Receiving Email"
    
    
class EmailSmtp(models.Model):
    EMAIL_HOST = models.CharField(max_length=255)
    EMAIL_PORT = models.IntegerField()
    EMAIL_HOST_USER = models.CharField(max_length=255)
    EMAIL_HOST_PASSWORD = models.CharField(max_length=255)
    EMAIL_USE_TLS = models.BooleanField(default=False)

    def __str__(self):
        return self.EMAIL_HOST          