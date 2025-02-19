from accounts.models import EmailSmtp

def get_smtp():
    # Assuming you only have one set of keys in the database
    emailsmtp = EmailSmtp.objects.first()
    # print(email_setting.enqmail)
    
    if emailsmtp:
        return emailsmtp.EMAIL_HOST,emailsmtp.EMAIL_PORT,emailsmtp.EMAIL_HOST_USER,emailsmtp.EMAIL_HOST_PASSWORD,emailsmtp.EMAIL_USE_TLS
    else:
        raise ValueError("SMTP not found in the database.") 
    
    
def getsmtp():
    # Your SMTP configuration logic here
    emailsmtp = EmailSmtp.objects.first()
    smtp_config = {
        'host': emailsmtp.EMAIL_HOST,
        'port': emailsmtp.EMAIL_PORT,
        'username': emailsmtp.EMAIL_HOST_USER,
        'password': emailsmtp.EMAIL_HOST_PASSWORD,
        'usetls': emailsmtp.EMAIL_USE_TLS,
        # Add other SMTP configuration parameters as needed
    }
    return smtp_config     