from django.shortcuts import render
from rest_framework import generics
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
# Create your views here.

from fasals import models
from .serializers import *

import pandas as pd
import numpy as np
import re
from spellchecker import SpellChecker

spell = SpellChecker()
dataset = pd.read_csv('D:\\flutter projects\\Fasal_Online_CP302-main\\backend\\fasalonline_app\\apis\\imp_final_data.csv',encoding = 'unicode_escape')

dataset['QueryType'] = dataset['QueryType'].str.replace(r'\t', '',regex='True')
from sentence_transformers import SentenceTransformer, util

model = SentenceTransformer('all-MiniLM-L6-v2')
import requests, json
# API base URL
BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"

res = requests.get("https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd0000014300ea7a708648397e8195bb436adc38&format=json&limit=1000")
all_data=res.json()
# for y in all_data["records"][:2]:
#   for k in y:
#     print(k,y[k])

category_dict = {"1": "Todays Weather","2": "Mandi Rate","3": "Vegetables","4":"Spices","5": "Schemes","6": "Communication","7": "Fruits","8": "Cereals",
                   "9": "Oilseeds","10": "Pulses"}
query_type_dict = {"1": "Cultural Practices","2": "Government Schemes","3": "Nutrient Management","4":"Fertilizer Uses","5": "Varieties","6": "Weed Management","7": "Seeds","8": "Contact Number",
                   "9": "Address","10": "Water Management","11": "Plant Protection"}
crop_dict = {"1": "Ash Gourd","2": "Turnip","3": "Tomato","4": "Sweet Potato","5": "Squash Melon","6": "Sponge Gourd","7": "Spinach (Palak)",
"8": "Radish","9": "Rabi Onion(Pyaz)","10": "Pumpkin","11": "Potato","12": "Peas","13": "Okra",
"14": "Long Melon","15": "Lettuce","16": "Kharif Onion(Pyaz)","17": "Garlic","18": "Cucumber",
"19": "Chilli","20": "Cauliflower","21": "Carrot","22": "Beetroot","23": "Bitter Gourd","24": "Capsicum","25": "Cabbage","26": "Broccoli","27": "Brinjal","28": "Coriander","29": "Ginger",
"30": "Turmeric","31": "Pradhan Mantri KISAN Samman Nidhi Yojana","32": "Pradhan Mantri Krishi Sinchai Yojana (PMKSY)","33": "Saur Sinchai Yojana",
"34": "Rashtriya Krishi Vikas Yojana","35": "Pradhan Mantri Fasal Bima Yojana (PMFBY)",
"36": "Pradhan Mantri Kisan Maan-Dhan Yojana","37": "Soil Health Card Scheme","38": "PM Kusum Yojana",
"39": "Pardhan Mantri Kisan SAMPADA Yojana","40": "Machinery/Equipment Subsidy",
"41": "Lemon","42": "Lime","43": "Banana","44": "Ber","45": "Grapes","46": "Guava","47": "Jamun",
"48": "Litchi","49": "Mango","50": "Orange/Santra","51": "WaterMelon","52": "Malta","53": "Papaya",
"54": "Barley(Jow)","55": "Maize(Kharif)","56": "Oats","57": "Wheat",
"58": "Rice","59": "Sugarcane","60": "Groundnut","61": "Mustard",
"62": "Soybean","63": "Sunflower","64": "Lentil","65": "Bengal Gram","66": "Green Gram","67": "Kidney Bean","68": "Mash",
"69": "Pigeon Pea","70": "RiceBean","71": "Institution","72": "Krishi Vigyan Kendras","73": "Nodal Officer Details (Statewise)"
             }


def spell_check(sentence):
    corrected_sentence = ""
    words = sentence.split(" ")
    for word in words:
        corrected_word = spell.correction(word)
        corrected_sentence += corrected_word + " "
    return corrected_sentence





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




@api_view()
@permission_classes([AllowAny])
def get_answer_database(request,query_type, query,crop,category):
    """
        returns the answer from the database based on query
    """
    subset_data = dataset.loc[dataset['Category'] == category_dict[category]]
    subset_data = subset_data.loc[subset_data['Crop'] == crop_dict[crop]]
    subset_data = subset_data.loc[subset_data['QueryType'] == query_type_dict[query_type]]
    dataset_dict = subset_data.to_dict('list')
    dataset_temp = pd.DataFrame.from_dict(dataset_dict)
    questions = subset_data['QueryText'].to_list()
    # Single list of sentences
    sentences = questions
    #Compute embeddings
    embeddings_ques = model.encode(questions, convert_to_tensor=True)
    embedding_query = model.encode(query, convert_to_tensor=True)

    #Compute cosine-similarities for each sentence with each other sentence
    cosine_scores = util.cos_sim(embeddings_ques, embedding_query)
    results = cosine_scores.reshape(1, -1)
    res_index = np.argmax(results[0]).item()
    res_index
    #print(f"Similarity Score of the top resulting question: {results[0][res_index]}")
    sim_scr=results[0][res_index]
    Question=""
    Question_Database=""
    Answer=""
    Reference=""
    Message=""
    THRESHOLD = 0.3
    if results[0][res_index] > THRESHOLD:
        # Respective question found on the database
        #print("========================================")
        #print(f"Question: {query}")
        #print(f"Question on Database: {dataset_temp['QueryText'][res_index]}")
        #print("========================================")
        # print(f"Answer: {dataset_temp['KccAns'][res_index]}")
        # print("========================================")
        # print(f"Reference: {dataset_temp['Refer'][res_index]}")
        # print("========================================")
        Question=query
        Question_Database=dataset_temp['QueryText'][res_index]
        Answer=dataset_temp['KccAns'][res_index]
        Reference=dataset_temp['Refer'][res_index]
    elif results[0][res_index]>=0 and results[0][res_index]<=THRESHOLD:
        # print("We find some similar answer for your question.Thank You ")
        # print(f"Question on Database: {dataset_temp['QueryText'][res_index]}")
        # print("========================================")
        # print(f"Answer: {dataset_temp['KccAns'][res_index]}")
        # print("========================================")
        # print(f" {dataset_temp['Refer'][res_index]}")  
        Message="We find some similar answer for your question.Thank You "
        Question_Database=dataset_temp['QueryText'][res_index]
        Answer=dataset_temp['KccAns'][res_index]
        Reference=dataset_temp['Refer'][res_index]
    else:
        Message="Sorry.We are not find your question in our database. But we also answer various types of queries like 1.Plant Protection 2.Cultural Practices 3.Government Schemes 4.Nutrient Management 5.Fertilizer Uses 6.Varieties 7.Weed Management 8.Others 9.Seeds 10.Water Management"
        # print("========================================")
        # print(f"Sorry.We are not find your question in our database. But we also answer various types of queries like 1.Plant Protection 2.Cultural Practices 3.Government Schemes 4.Nutrient Management 5.Fertilizer Uses 6.Varieties 7.Weed Management 8.Others 9.Seeds 10.Water Management")
    return Response({'Similar_score':sim_scr,'Message': Message, 'Question': Question, 'Question_Database':Question_Database, 'Answer':Answer,'Reference':Reference})


@api_view()
@permission_classes([AllowAny])
def get_weather_info(request,CITY):
    API_KEY = "9a86fa9066224859399de5ee1bb8602e"
    URL = BASE_URL + "q=" + CITY + "&appid=" + API_KEY
    response = requests.get(URL)
    City_id=""
    Temperature=""
    feel_like=""
    Humidity=""
    atm_pressure=""
    weth_Report=""
    Wind_Speed=""
    errorrr=""


    if response.status_code == 200:

        data = response.json()
        main = data['main']
        temperature = main['temp']
        temp_feel_like = main['feels_like']  
        humidity = main['humidity']
        pressure = main['pressure']
        weather_report = data['weather']
        wind_report = data['wind']

        #    print(f"{CITY:-^35}")
        #    print(f"City ID: {data['id']}")

        temp = float(temperature) 
        f = ((temp - 273.15) * 9/5)+32
        celsius = (f - 32) * 5/9
        feels_like = float(temp_feel_like)
        f1 = ((feels_like - 273.15) * 9/5)+32
        celsius1 = (f1 - 32) * 5/9

        #    print("")
        #    print("====================================")
        #    print(f"Temperature:" "{0:.2f}°C".format(celsius))
        #    print(f"Feel Like:" "{0:.2f}°C".format(celsius1))    
        #    print(f"Humidity: {humidity} %")
        #    print(f"Atmospheric Pressure: {pressure} hPa")
        #    print(f"Weather Report: {weather_report[0]['description']}")
        #    print(f"Wind Speed: {wind_report['speed']} km/h")
        #    print("====================================")
        #    print("")
        City_id=data['id']
        Temperature="{0:.2f}°C".format(celsius)
        feel_like="{0:.2f}°C".format(celsius1)
        Humidity=str(humidity)+"%"
        atm_pressure=str(pressure)+" hPa"
        weth_Report=weather_report[0]['description']
        Wind_Speed=str(wind_report['speed'])+" km/h"
    else:
        errorrr="Error in the HTTP request"
        #print("Error in the HTTP request")
    return Response({'error':errorrr,'City_id': City_id, 'Temperature': Temperature, 'feel_like':feel_like, 'Humidity':Humidity,'atm_pressure':atm_pressure,'weth_Report':weth_Report,'Wind_Speed':Wind_Speed})

@api_view()
@permission_classes([AllowAny])
def get_mandi_rate(request,crop):
    updated_crop = spell_check(crop)
    updated_crop = updated_crop.strip()
    print(updated_crop)
    #crop.lower()
    resul=""
    for x in all_data["records"]:
        if x['commodity'].lower() == updated_crop.lower():
            # resul+=x['commodity'].lower()+"\n"
            #print(x['commodity'].lower())
            resul+="Crop_Name = "+x['commodity']+ " State = "+x['state']+ " District= "+x['district']+  " Market Name= "+x['market']+  " Minimum_price= "+x['min_price']+  "Maximum_price="+x['max_price']+ "Modal_price= "+x['modal_price']+"\n"
            #print("Crop_Name = ",x['commodity']," ""State = ",x['state']," " "District=",x['district']," " "Market Name=",x['market']," " "Minimum_price=",x['min_price']," " "Maximum_price=",x['max_price']," " "Modal_price=",x['modal_price'])
    return Response({'result':resul})
