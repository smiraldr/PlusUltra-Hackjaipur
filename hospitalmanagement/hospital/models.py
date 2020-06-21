from django.db import models
from model_utils import Choices
from django.contrib.auth.models import User

# Create your models here.
class DoctorProfile(models.Model):
    first_name=models.CharField(max_length=200)
    last_name=models.CharField(max_length=200)
    speciality=models.CharField(max_length=100)
    email_id=models.EmailField(blank=True,unique=True)
    phone_number=models.CharField(max_length=10,unique=True)
    STATUS = Choices('available', 'notavailable')
    status=models.CharField(max_length=20,choices=STATUS,default=STATUS.notavailable)

    def __str__(self):
        return self.first_name


class PatientProfile(models.Model):
    first_name=models.CharField(max_length=200)
    last_name=models.CharField(max_length=200)
    purpose_of_visit=models.CharField(max_length=100)
    email_id=models.EmailField(blank=True,unique=True)
    phone_number=models.CharField(max_length=10,unique=True)

    def __str__(self):
        return self.first_name


class Medicines(models.Model):
    medicine_name=models.CharField(max_length=100)
    salt_name=models.CharField(max_length=100,unique=True)
    STATUS=Choices('instock','outofstock')
    status=models.CharField(max_length=20,choices=STATUS,default='notavilable')      
    price=models.IntegerField(blank=False)    

    def __str__(self):
        return self.medicine_name     



class Beds(models.Model):
    emergency_beds=models.IntegerField(blank=False)
    normal_beds=models.IntegerField(blank=False)
    icu_beds=models.IntegerField(blank=False) 


class UserProfileInfo(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE)
    portfolio_site = models.URLField(blank=True)
    address=models.TextField(max_length=500)        
    contact=models.CharField(unique=True,max_length=10,blank=False)
    information=models.TextField(blank=True)


    def __str__(self):
        return self.user

        