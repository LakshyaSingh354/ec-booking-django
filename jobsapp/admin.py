from django.contrib import admin
from .models import*

# Register your models here.
# class ServicesAdmin(admin.ModelAdmin):
#     list_display = ('service_name','status')
#     prepopulated_fields = {'slug': ('service_name',)}





admin.site.register(Country)
admin.site.register(State)
admin.site.register(City)
admin.site.register(Sector)
admin.site.register(Company)
admin.site.register(Job_type)
admin.site.register(Work_mode)
admin.site.register(Job_category)
admin.site.register(Job_role)
admin.site.register(Skill)
admin.site.register(Job)
admin.site.register(Education)
admin.site.register(Applicant)
admin.site.register(Experience)
admin.site.register(Position)
