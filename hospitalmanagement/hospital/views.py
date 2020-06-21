from django.shortcuts import render
from hospital.forms import UserForm,UserProfileInfoForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect, HttpResponse
from django.urls import reverse
from django.contrib.auth.decorators import login_required  
from hospital.models import DoctorProfile,Medicines

def index(request):
    return render(request,'templates/index.html')

@login_required
def special(request):
    return HttpResponse("You are logged in !")

@login_required
def user_logout(request):
    logout(request)
    return HttpResponseRedirect(reverse('index'))

def register(request):
    registered = False
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)
        profile_form = UserProfileInfoForm(data=request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            user.set_password(user.password)
            user.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            profile.save()
            registered = True
        else:
            print(user_form.errors,profile_form.errors)
    else:
        user_form = UserForm()
        profile_form = UserProfileInfoForm()
    return render(request,'templates/registration.html',
                          {'user_form':user_form,
                           'profile_form':profile_form,
                           'registered':registered})


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            if user.is_active:
                login(request,user)
                return HttpResponseRedirect(reverse('index'))
            else:
                return HttpResponse("Your account was inactive.")
        else:
            print("Someone tried to login and failed.")
            print("They used username: {} and password: {}".format(username,password))
            return HttpResponse("Invalid login details given")
    else:
        return render(request, 'templates/login.html', {})


@login_required
def no_beds(request):
    if request.method == 'POST':
        icu_beds= request.POST.get('icu_beds')
        normal_beds=request.POST.get('normal_beds')
        emergency_beds=request.POST.get('emergency_beds')
        if icu_beds==0:
            return  HttpResponse("ICU beds are not available at the moment")

        if normal_beds==0:
            return HttpResponse("Normal beds are not available at this moment ")

        if emergency_beds==0:
            return HttpResponse("Emergency beds are not available at this moment")
    return render(request,'templates/beds.html')


@login_required
def doctors(request):
    if request.method == 'POST':
        doctor=DoctorProfile(data=request.POST)
        doctor.save()
    return render(request,'templates/doc.html')



@login_required
def medicines(request):
    if request.metehod=='POST':
        medici=Medicines(data=request.POST)
        medici.save()

    return render(request,'templates/medicine.html')