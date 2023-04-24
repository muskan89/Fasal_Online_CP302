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
import pickle
import pandas as pd
import numpy as np
import re
from googletrans import Translator
# dataset = pd.read_csv('Dataset1.csv',encoding = 'unicode_escape')
dataset = pd.read_csv('D:\\_7th sem\\CP302\\code_fasal\\Fasal_Online_CP302\\backend\\fasalonline_app\\apis\\Dataset1.csv',encoding = 'unicode_escape')

from sentence_transformers import SentenceTransformer, util
model = SentenceTransformer('all-MiniLM-L6-v2')
from spellchecker import SpellChecker
dataset['QueryType'] = dataset['QueryType'].str.replace(r'\t', '')

import requests, json
import nltk
from scipy.spatial import distance

translator = Translator(service_urls=['translate.google.com'])

# API base URL
BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"

import requests
res = requests.get("https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd0000014300ea7a708648397e8195bb436adc38&format=json&limit=1000")
all_data=res.json()

category_dict = {"1": "Todays Weather","2": "Mandi Rate","3": "Vegetables","4":"Spices","5": "Schemes","6": "Communication","7": "Fruits","8": "Cereals",
                   "9": "Oilseeds","10": "Pulses"}

query_type_dict = {"1": "Cultural Practices","2": "Government Schemes","3": "Nutrient Management","4":"Fertilizer Uses","5": "Varieties","6": "Weed Management","7": "Seeds","8": "Contact Number",
                   "9": "Address","10": "Water Management","11": "Plant Protection"}

crop_dict = {"1": "Ash Gourd","2": "Tomato","3": "Sweet Potato","4": "Sponge Gourd",
"5": "Radish","6": "Rabi Onion","7": "Pumpkin","8": "Potato","9": "Peas","10": "Okra",
"11": "Kharif Onion","12": "Garlic","13": "Cucumber",
"14": "Chilli","15": "Cauliflower","16": "Carrot","17": "Bitter Gourd","18": "Capsicum","19": "Cabbage","20": "Brinjal","21": "Coriander","22": "Ginger",
"23": "Turmeric","24": "Sugarcane","25": "Pradhan Mantri Fasal Bima Yojana (PMFBY)",
"26": "PM Kisan Credit card Yojna","27": "Pradhan Mantri KISAN Samman Nidhi Yojana",
"28": "Pradhan Mantri Kisan Maan-Dhan Yojana","29": "PM Kusum Yojana",
"30": "Pardhan Mantri Kisan SAMPADA Yojana","31": "Machinery/Equipment Subsidy",
"32": "Lemon","33": "Lime","34": "Banana","35": "Ber","36": "Grapes","37": "Guava","38": "Jamun",
"39": "Litchi","40": "Mango","41": "Orange","42": "WaterMelon","43": "Malta","44": "Papaya",
"45": "Barley","46": "Maize","47": "Oats","48": "Wheat",
"49": "Rice","50": "Groundnut","51": "Mustard",
"52": "Soybean","53": "Sunflower","54": "Lentil","55": "Bengal Gram","56": "Green Gram","57": "Kidney Bean","58": "Mash",
"59": "Pigeon Pea","60": "RiceBean","61": "Institution","62": "Krishi Vigyan Kendras","63": "Nodal Officer Details (Statewise)"
             }

#!pip install pyspellchecker
#from spellchecker import SpellChecker

spell = SpellChecker()
def spell_check(sentence):
    corrected_sentence = ""
    words = sentence.split(" ")
    for word in words:
        corrected_word = spell.correction(word)
        corrected_sentence += corrected_word + " "
    return corrected_sentence







# import pandas as pd
# import numpy as np
# import re
# from spellchecker import SpellChecker










# spell = SpellChecker()

# # dataset = pd.read_csv('D:\\flutter projects\\btp\\Fasal_Online_CP302\\backend\\fasalonline_app\\apis\\imp_final_data.csv',encoding = 'unicode_escape')
# dataset = pd.read_csv('D:\\_7th sem\\CP302\\code_fasal\\Fasal_Online_CP302\\backend\\fasalonline_app\\apis\\imp_final_data.csv')

# dataset['QueryType'] = dataset['QueryType'].str.replace(r'\t', '',regex='True')
# from sentence_transformers import SentenceTransformer, util

# model = SentenceTransformer('all-MiniLM-L6-v2')
# import requests, json
# # API base URL
# BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"

# res = requests.get("https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd0000014300ea7a708648397e8195bb436adc38&format=json&limit=1000")
# all_data=res.json()



# category_dict = {"1": "Todays Weather","2": "Mandi Rate","3": "Vegetables","4":"Spices","5": "Schemes","6": "Communication","7": "Fruits","8": "Cereals",
#                    "9": "Oilseeds","10": "Pulses"}
# query_type_dict = {"1": "Cultural Practices","2": "Government Schemes","3": "Nutrient Management","4":"Fertilizer Uses","5": "Varieties","6": "Weed Management","7": "Seeds","8": "Contact Number",
#                    "9": "Address","10": "Water Management","11": "Plant Protection"}
# crop_dict = {"1": "Ash Gourd","2": "Turnip","3": "Tomato","4": "Sweet Potato","5": "Squash Melon","6": "Sponge Gourd","7": "Spinach (Palak)",
# "8": "Radish","9": "Rabi Onion(Pyaz)","10": "Pumpkin","11": "Potato","12": "Peas","13": "Okra",
# "14": "Long Melon","15": "Lettuce","16": "Kharif Onion(Pyaz)","17": "Garlic","18": "Cucumber",
# "19": "Chilli","20": "Cauliflower","21": "Carrot","22": "Beetroot","23": "Bitter Gourd","24": "Capsicum","25": "Cabbage","26": "Broccoli","27": "Brinjal","28": "Coriander","29": "Ginger",
# "30": "Turmeric","31": "Pradhan Mantri KISAN Samman Nidhi Yojana","32": "Pradhan Mantri Krishi Sinchai Yojana (PMKSY)","33": "Saur Sinchai Yojana",
# "34": "Rashtriya Krishi Vikas Yojana","35": "Pradhan Mantri Fasal Bima Yojana (PMFBY)",
# "36": "Pradhan Mantri Kisan Maan-Dhan Yojana","37": "Soil Health Card Scheme","38": "PM Kusum Yojana",
# "39": "Pardhan Mantri Kisan SAMPADA Yojana","40": "Machinery/Equipment Subsidy",
# "41": "Lemon","42": "Lime","43": "Banana","44": "Ber","45": "Grapes","46": "Guava","47": "Jamun",
# "48": "Litchi","49": "Mango","50": "Orange/Santra","51": "WaterMelon","52": "Malta","53": "Papaya",
# "54": "Barley(Jow)","55": "Maize(Kharif)","56": "Oats","57": "Wheat",
# "58": "Rice","59": "Sugarcane","60": "Groundnut","61": "Mustard",
# "62": "Soybean","63": "Sunflower","64": "Lentil","65": "Bengal Gram","66": "Green Gram","67": "Kidney Bean","68": "Mash",
# "69": "Pigeon Pea","70": "RiceBean","71": "Institution","72": "Krishi Vigyan Kendras","73": "Nodal Officer Details (Statewise)"
#              }


# def spell_check(sentence):
#     corrected_sentence = ""
#     words = sentence.split(" ")
#     for word in words:
#         corrected_word = spell.correction(word)
#         corrected_sentence += corrected_word + " "
#     return corrected_sentence



class ListVariety(generics.ListCreateAPIView):
    queryset = models.Variety.objects.all()
    serializer_class = VarietySerializer

class DetailVariety(generics.RetrieveAPIView):
    queryset = models.Variety.objects.all()
    serializer_class = VarietySerializer

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
    lang = translator.detect(query).lang
    #if lang not in ['en', 'hi']:
        #print("Please ask your question in either English or Hindi.")
        #return
    if lang == 'hi':
        query = translator.translate(query, dest='en').text

    #print(f"Your language is: {lang}")
    #print(f"Your query: {query}")
    embeddings_ques = model.encode(questions, convert_to_tensor=True)
    embedding_query = model.encode(query, convert_to_tensor=True)

    #Compute cosine-similarities for each sentence with each other sentence
    cosine_scores = util.cos_sim(embeddings_ques, embedding_query)
    results = cosine_scores.reshape(1, -1)
    results = results.numpy()
    res_index = np.argmax(results[0])
    #print(f"Similarity Score of the top resulting question: {results[0][res_index]}")
    sorted_results = np.argsort(results[0])
    sorted_results = sorted_results[::-1] # descending order

    THRESHOLD = 0.5    
    # subset_data = dataset.loc[dataset['Category'] == category_dict[category]]
    # subset_data = subset_data.loc[subset_data['Crop'] == crop_dict[crop]]
    # subset_data = subset_data.loc[subset_data['QueryType'] == query_type_dict[query_type]]
    # dataset_dict = subset_data.to_dict('list')
    # dataset_temp = pd.DataFrame.from_dict(dataset_dict)
    # questions = subset_data['QueryText'].to_list()
    # # Single list of sentences
    # sentences = questions
    # #Compute embeddings
    # embeddings_ques = model.encode(questions, convert_to_tensor=True)
    # embedding_query = model.encode(query, convert_to_tensor=True)

    # #Compute cosine-similarities for each sentence with each other sentence
    # cosine_scores = util.cos_sim(embeddings_ques, embedding_query)
    # results = cosine_scores.reshape(1, -1)
    # res_index = np.argmax(results[0]).item()
    # res_index
    # #print(f"Similarity Score of the top resulting question: {results[0][res_index]}")
    sim_scr=results[0][res_index]
    Question=""
    Question_Database=""
    Answer=""
    Reference=""
    Message=""
    # THRESHOLD = 0.3
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
        Message="Here is your answer!"
        Question_Database=dataset_temp['QueryText'][res_index]
        Answer=dataset_temp['KccAns'][res_index]
        if lang == 'hi':
            Answer = translator.translate(Answer, dest='hi').text
        Reference=dataset_temp['Refer'][res_index]
        # for i, ind in enumerate(sorted_results[1:4]):
        #   ques = dataset_temp['QueryText'][ind]
        #   if lang == 'hi':
        #     ques = translator.translate(ques, dest='hi').text
        #   print(f"{i+1}: {ques}")
    elif results[0][res_index]>=0 and results[0][res_index]<=THRESHOLD:
        # print("We find some similar answer for your question.Thank You ")
        # print(f"Question on Database: {dataset_temp['QueryText'][res_index]}")
        # print("========================================")
        # print(f"Answer: {dataset_temp['KccAns'][res_index]}")
        # print("========================================")
        # print(f" {dataset_temp['Refer'][res_index]}")  
        Question=query
        Message="We have some similar question answer for you.Thank You"
        if lang == 'hi':
            Message = translator.translate(Message, dest='hi').text
        Question_Database=dataset_temp['QueryText'][res_index]
        Answer=dataset_temp['KccAns'][res_index]
        Reference=dataset_temp['Refer'][res_index]
    else:
        Message="Sorry.We are not find your question in our database. But we also answer various types of queries like 1.Plant Protection 2.Cultural Practices 3.Government Schemes 4.Nutrient Management 5.Fertilizer Uses 6.Varieties 7.Weed Management 8.Others 9.Seeds 10.Water Management"
        if lang == 'hi':
            Message = translator.translate(Message, dest='hi').text
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
        errorrr="Enter the correct city name"
        #print("Error in the HTTP request")
    return Response({'error':errorrr,'City_id': City_id, 'Temperature': Temperature, 'feel_like':feel_like, 'Humidity':Humidity,'atm_pressure':atm_pressure,'weth_Report':weth_Report,'Wind_Speed':Wind_Speed})

@api_view()
@permission_classes([AllowAny])
def get_mandi_rate(request,crop):
    # lang = translator.detect(crop).lang
    # if lang == 'hi':
    #     crop=translator.translate(crop, dest='en').text
    # #if lang not in ['en', 'hi']:
        #print("Please ask your question in either English or Hindi.")
        #return
    
    updated_crop = spell_check(crop)
    updated_crop = updated_crop.strip()
    print(updated_crop)
    crop.lower()
    resul=""
    errorr=""

    for x in all_data["records"]:
        if x['commodity'].lower() == updated_crop.lower():
            # resul+=x['commodity'].lower()+"\n"
            #print(x['commodity'].lower())
            # if lang == 'hi':
            #     com= translator.translate(x['commodity'], dest='hi').text
            #     resul+="Crop_Name : "+com+ "\nState : "+x['state']+ "\nDistrict : "+x['district']+  "\nMarket Name : "+x['market']+  "\nMinimum_price : "+x['min_price']+  "\nMaximum_price : "+x['max_price']+ "\nModal_price : "+x['modal_price']+"\n\n"
            # #print("Crop_Name = ",x['commodity']," ""State = ",x['state']," " "District=",x['district']," " "Market Name=",x['market']," " "Minimum_price=",x['min_price']," " "Maximum_price=",x['max_price']," " "Modal_price=",x['modal_price'])
            # else:
            resul+="Crop_Name : "+x['commodity']+ "\nState : "+x['state']+ "\nDistrict : "+x['district']+  "\nMarket Name : "+x['market']+  "\nMinimum_price : Rs. "+x['min_price']+  "\nMaximum_price : Rs. "+x['max_price']+ "\nModal_price : Rs. "+x['modal_price']+"\n\n"
    if(len(resul)==0):
        errorr="You entered wrong name of crop. Try again with the correct one."
        # if lang == 'hi':
        #     errorr= translator.translate(errorr, dest='hi').text
    return Response({'result':resul,'error':errorr})