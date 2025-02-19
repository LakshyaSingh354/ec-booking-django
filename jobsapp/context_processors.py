from .models import Sector

def sector_links(request):
    jobsec = Sector.objects.filter(status=1).order_by('-created_on')
    return dict(jobsec=jobsec)