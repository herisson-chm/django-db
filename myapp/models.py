from django.db import models

# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.



class AdmLevels(models.Model):
	id_level = models.AutoField(primary_key=True)
	level_name = models.CharField(max_length=100)
	
	def __str__(self):
		return self.level_name
	
	class Meta:
		managed = False
		db_table = 'adm_levels'


class Countries(models.Model):
	id_country = models.AutoField(primary_key=True)
	country_name = models.CharField(max_length=100)
	
	def __str__(self):
		return self.country_name

	class Meta:
		managed = False
		db_table = 'countries'


class Fieldss(models.Model):
	id_field = models.AutoField(primary_key=True)
	fields_name = models.CharField(max_length=100)
	
	def __str__(self):
		return self.fields_name
		
	class Meta:
		managed = False
		db_table = 'fieldss'


class OffCountry(models.Model):
	id_offer = models.ForeignKey('Offers', models.DO_NOTHING, db_column='id_offer')
	id_country = models.ForeignKey(Countries, models.DO_NOTHING, db_column='id_country')
	
	
	class Meta:
		managed = False
		db_table = 'off_country'


class OffField(models.Model):
	id_offer = models.ForeignKey('Offers', models.DO_NOTHING, db_column='id_offer')
	id_field = models.ForeignKey(Fieldss, models.DO_NOTHING, db_column='id_field')
	
		
	class Meta:
		managed = False
		db_table = 'off_field'


class OffLevl(models.Model):
	id_offer = models.ForeignKey('Offers', models.DO_NOTHING, db_column='id_offer')
	id_level = models.ForeignKey(AdmLevels, models.DO_NOTHING, db_column='id_level')
	
		
	class Meta:
		managed = False
		db_table = 'off_levl'


class OffType(models.Model):
	id_offer = models.ForeignKey('Offers', models.DO_NOTHING, db_column='id_offer')
	id_type = models.ForeignKey('Types', models.DO_NOTHING, db_column='id_type')
	
		
	class Meta:
		managed = False
		db_table = 'off_type'


class Types(models.Model):
	id_type = models.AutoField(primary_key=True)
	type_name = models.CharField(max_length=100)
	
	def __str__(self):
		return self.type_name
	
	class Meta:
		managed = False
		db_table = 'types'
		
	
class Offers(models.Model):
	id_offer = models.AutoField(primary_key=True)
	offer_name = models.CharField(max_length=200)
	info = models.TextField()
	link = models.URLField(max_length=200)
	deadline = models.DateField()
	#offer_n = models.CharField(max_length=200)
	types = models.ManyToManyField(Types, through='OffType', through_fields=('id_offer', 'id_type'),)
	fieldss = models.ManyToManyField(Fieldss, through='OffField', through_fields=('id_offer', 'id_field'),)
	countries = models.ManyToManyField(Countries, through='OffCountry', through_fields=('id_offer', 'id_country'),)
	levels = models.ManyToManyField(AdmLevels, through='OffLevl', through_fields=('id_offer', 'id_level'),)
	def __str__(self):
		return self.offer_name
		
	def offer_types(self):
		return ", ".join([p.type_name for p in self.types.all()])
	def offer_fields(self):
		return ", ".join([p.fields_name for p in self.fieldss.all()])
	def offer_countries(self):
		return ", ".join([p.country_name for p in self.countries.all()])
	def admission_levels(self):
		return ", ".join([p.level_name for p in self.levels.all()])
		
	class Meta:
		managed = False
		db_table = 'offers'
		verbose_name = 'Offer'
		verbose_name_plural = 'Offers'



