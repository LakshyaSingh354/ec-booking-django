from .models import Services,General,Bg_banner, Products
def service_links(request):
    service = Services.objects.filter(status=1).order_by('-created_on')
    return dict(service=service)

def general_info(request):
    general = General.objects.filter(status=1).first()
    return dict(genlt=general)

def banner_info(request):
    bgimg = Bg_banner.objects.filter(status=1).first()
    return dict(banner=bgimg)

def product_links(request):
    products = Products.objects.filter(status=1).order_by('-created_on')
    print("Products::", products)
    return {'products':products}