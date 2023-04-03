from django.urls import path
from .views import *
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('crop/',ListCrop.as_view()),
    path('crop/<int:pk>/',DetailCrop.as_view()),
    path('disease/',ListDisease.as_view()),
    path('disease/<str:pk>/',DetailDisease.as_view()),
    path('soil/',ListSoil.as_view()),
    path('soil/<int:pk>/',DetailSoil.as_view()),
    path('pest/',ListPest.as_view()),
    path('pest/<int:pk>/',DetailPest.as_view()),
    path('weed/',ListWeed.as_view()),
    path('weed/<int:pk>/',DetailWeed.as_view()),
    path('fertilizer/',ListChemicalFertilizer.as_view()),
    path('fertilizer/<int:pk>/',DetailChemicalFertilizer.as_view()),
    path('get_answer/<str:category>/<str:crop>/<str:query_type>/<str:query>/',get_answer_database),
    path('get_weather/<str:CITY>/',get_weather_info),
    path('get_mandi/<str:crop>/',get_mandi_rate),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
