from accounts.models import EmailSetting

def get_enqmail():
    # Assuming you only have one set of keys in the database
    email_setting = EmailSetting.objects.first()
    # print(email_setting.enqmail)
    
    if email_setting:
        return email_setting.enqmail
    else:
        raise ValueError("Email not found in the database.") 