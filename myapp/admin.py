from django.contrib import admin
from .models import*
from django.shortcuts import redirect
# Register your models here.
class ServicesAdmin(admin.ModelAdmin):
    list_display = ('service_name','status')
    prepopulated_fields = {'slug': ('service_name',)}
    
    def response_add(self, request, obj, post_url_continue=None):
        return redirect('/next/events/new')
    
class TeamAdmin(admin.ModelAdmin):
    list_display = ('team_name','status')
    prepopulated_fields = {'slug': ('team_name',)}    











admin.site.register(Banner)
admin.site.register(Client)
admin.site.register(Services,ServicesAdmin)
admin.site.register(Service_detail)
admin.site.register(Brochure)
admin.site.register(Team,TeamAdmin)
admin.site.register(Know_us)
admin.site.register(Company_overview)
admin.site.register(Testimonial)
admin.site.register(General)
admin.site.register(About)
admin.site.register(What_specialty)
admin.site.register(Contact)
admin.site.register(Feedback)
admin.site.register(Services_enquiry)
admin.site.register(Home)
admin.site.register(Counter)
admin.site.register(Bg_banner)