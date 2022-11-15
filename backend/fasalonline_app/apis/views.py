from django.shortcuts import render
from rest_framework import generics
# Create your views here.

from fasals import models
from .serializers import *

class ListCrop(generics.ListCreateAPIView):
    queryset = models.Crop.objects.all()
    serializer_class = CropSerializer

class DetailCrop(generics.RetrieveAPIView):
    queryset = models.Crop.objects.all()
    serializer_class = CropSerializer

class ListDisease(generics.ListCreateAPIView):
    queryset = models.Disease.objects.all()
    serializer_class = DiseaseSerializer

class DetailDisease(generics.RetrieveAPIView):
    queryset = models.Disease.objects.all()
    serializer_class = DiseaseSerializer

class ListSoil(generics.ListCreateAPIView):
    queryset = models.Soil.objects.all()
    serializer_class = SoilSerializer

class DetailSoil(generics.RetrieveAPIView):
    queryset = models.Soil.objects.all()
    serializer_class = SoilSerializer

class ListPest(generics.ListCreateAPIView):
    queryset = models.Pest.objects.all()
    serializer_class = PestSerializer

class DetailPest(generics.RetrieveAPIView):
    queryset = models.Pest.objects.all()
    serializer_class = PestSerializer

class ListWeed(generics.ListCreateAPIView):
    queryset = models.Weed.objects.all()
    serializer_class = WeedSerializer

class DetailWeed(generics.RetrieveAPIView):
    queryset = models.Weed.objects.all()
    serializer_class = WeedSerializer

class ListChemicalFertilizer(generics.ListCreateAPIView):
    queryset = models.ChemicalFertilizer.objects.all()
    serializer_class = ChemicalFertilizerSerializer

class DetailChemicalFertilizer(generics.RetrieveAPIView):
    queryset = models.ChemicalFertilizer.objects.all()
    serializer_class = ChemicalFertilizerSerializer




