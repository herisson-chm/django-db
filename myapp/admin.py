from django.contrib import admin
from django.utils.text import Truncator
from django.contrib.admin import SimpleListFilter
from django.utils.html import format_html


# Register your models here.
from .models import Fieldss, Offers, Types, Countries, AdmLevels, OffType, OffField, OffLevl, OffCountry
#from db.models import *

class LevelsFilter(SimpleListFilter):
	title = 'Level' # a label for our filter
	parameter_name = 'levels' # you can put anything here

	def lookups(self, request, model_admin):
	# This is where you create filter options; we have two:
		return [('bachelor', 'Bachelor'),('master', 'Master'),('PhD', 'PhD'),]
	
	def queryset(self, request, queryset):
	# This is where you process parameters selected by use via filter options:
		if self.value() == 'bachelor':
		# Get websites that have at least one page.
			return queryset.distinct().filter(levels=1)
		if self.value() == 'master':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(levels=2)
		if self.value() == 'PhD':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(levels=3)
			
class FieldsFilter(SimpleListFilter):
	title = 'Field' # a label for our filter
	parameter_name = 'fields' # you can put anything here

	def lookups(self, request, model_admin):
	# This is where you create filter options; we have two:
		return [('Chemistry', 'Chemistry'),('Physics', 'Physics'),('Biology', 'Biology'), ('Material science', 'Material science'), ('Maths', 'Maths'),]
	
	def queryset(self, request, queryset):
	# This is where you process parameters selected by use via filter options:
		if self.value() == 'Chemistry':
		# Get websites that have at least one page.
			return queryset.distinct().filter(fieldss=1)
		if self.value() == 'Physics':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(fieldss=2)
		if self.value() == 'Biology':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(fieldss=3)
		if self.value() == 'Material science':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(fieldss=6)
		if self.value() == 'Maths':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(fieldss=7)

			
			
class TypesFilter(SimpleListFilter):
	title = 'Type' # a label for our filter
	parameter_name = 'types' # you can put anything here

	def lookups(self, request, model_admin):
	# This is where you create filter options; we have two:
		return [('PhD', 'PhD'),('Internship', 'Internship'),('Master Degree', 'Master Degree'), ('Conference', 'Conference'), ('Workshop', 'Workshop'), ('Job', 'Job'), ('Competition', 'Competition'),]
	
	def queryset(self, request, queryset):
	# This is where you process parameters selected by use via filter options:
		if self.value() == 'PhD':
		# Get websites that have at least one page.
			return queryset.distinct().filter(types=1)
		if self.value() == 'Internship':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=2)
		if self.value() == 'Master Degree':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=3)
		if self.value() == 'Conference':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=4)
		if self.value() == 'Workshop':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=5)
		if self.value() == 'Job':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=6)
		if self.value() == 'Competition':
		# Get websites that don't have any pages.
			return queryset.distinct().filter(types=7)

			
	
class OffTypeAdmin(admin.TabularInline):
    model = OffType
	
class OffFieldAdmin(admin.TabularInline):
    model = OffField

class OffLevlAdmin(admin.TabularInline):
    model = OffLevl
	
class OffCountryAdmin(admin.TabularInline):
    model = OffCountry
	
def some_info(obj):
    info = "%s" % obj.info
    return Truncator(info).chars(50)

	
class OffersAdmin(admin.ModelAdmin):
	list_display = ('id_offer', 'offer_name', 'show_url', 'offer_types', some_info, 'deadline', 'offer_fields', 'offer_countries', 'admission_levels')
	list_display_links = ('id_offer', 'offer_name',)
	#actions = [scrape_website]
	list_filter = (LevelsFilter, TypesFilter, FieldsFilter,)
	#fields = ['offer_name', ('link','deadline'), 'info', 'id_type',  'id_field', 'level_name', 'id_country']
	def id_offer(self, obj):
		return obj.get_full_name()
	id_offer.short_description = 'OFFER ID'
	
	def show_url(self, obj):
		return format_html("<a href='{url}'>{url}</a>", url=obj.link)
	show_url.short_description = "Offer URL"
	inlines = (OffTypeAdmin, OffFieldAdmin, OffLevlAdmin, OffCountryAdmin)

	
class OffTypeInline(admin.TabularInline):
    model = OffType
    extra = 1

class OffFieldInline(admin.TabularInline):
    model = OffField
    extra = 1
	

	
admin.site.register(Offers, OffersAdmin)

#admin.site.register(Fields)
#admin.site.register(Offers)
#admin.site.register(Types)
#admin.site.register(Countries)
#admin.site.register(AdmLevels)
#admin.site.register(OffType)
#admin.site.register(OffField)