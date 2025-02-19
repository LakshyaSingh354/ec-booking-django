

def get_smtp():
    # Assuming you only have one set of keys in the database
    from accounts.models import EmailSmtp
    emailsmtp = EmailSmtp.objects.first()
    # print(email_setting.enqmail)
    
    if emailsmtp:
        return emailsmtp.EMAIL_HOST,emailsmtp.EMAIL_PORT,emailsmtp.EMAIL_HOST_USER,emailsmtp.EMAIL_HOST_PASSWORD,emailsmtp.EMAIL_USE_TLS
    else:
        raise ValueError("SMTP not found in the database.") 
    
    
# def getsmtp():
#     # Your SMTP configuration logic here
#     from django.core.mail import EmailMessage
#     from accounts.models import EmailSmtp
    
#     email_config = EmailSmtp.objects.first()
#     # EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
#     # EMAIL_HOST = email_config.EMAIL_HOST
#     # EMAIL_PORT = email_config.EMAIL_PORT
#     # EMAIL_HOST_USER = email_config.EMAIL_HOST_USER
#     # EMAIL_HOST_PASSWORD = email_config.EMAIL_HOST_PASSWORD
#     # EMAIL_USE_TLS = email_config.EMAIL_USE_TLS
#     if email_config:
#         return email_config.EMAIL_HOST,email_config.EMAIL_PORT,email_config.EMAIL_HOST_USER,email_config.EMAIL_HOST_PASSWORD,email_config.EMAIL_USE_TLS
#     else:
#         raise ValueError("SMTP not found in the database.") 


# from django.core.mail import EmailMessage
# from accounts.models import EmailSmtp

# email_config = EmailSmtp.objects.first()

# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = email_config.EMAIL_HOST
# EMAIL_PORT = email_config.EMAIL_PORT
# EMAIL_HOST_USER = email_config.EMAIL_HOST_USER
# EMAIL_HOST_PASSWORD = email_config.EMAIL_HOST_PASSWORD
# EMAIL_USE_TLS = email_config.EMAIL_USE_TLS
