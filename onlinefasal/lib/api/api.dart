import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinefasal/models/dbresponse.dart';
import '../models/crop.dart';
import '../models/disease.dart';
import '../models/pest.dart';
import '../models/soil.dart';
import '../models/fertilizer.dart';
import '../models/weather.dart';
import '../models/mandiRate.dart';

class CropProvider with ChangeNotifier {
  CropProvider() {
    fetchTasks();
  }

  List<Crop> _crops = [];

  List<Crop> get crops {
    return [..._crops];
  }

  fetchTasks() async {
    const url = 'http://172.21.71.8:8000/apis/v1/crop/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _crops = data.map<Crop>((json) => Crop.fromJson(json)).toList();
    }
  }
}

class DiseaseProvider with ChangeNotifier {
  DiseaseProvider() {
    fetchTasks();
  }

  List<Disease> _diseases = [];

  List<Disease> get diseases {
    return [..._diseases];
  }

  fetchTasks() async {
    const url = 'http://172.21.71.8:8000/apis/v1/disease/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _diseases = data.map<Disease>((json) => Disease.fromJson(json)).toList();
    }
  }
}

class FertilizerProvider with ChangeNotifier {
  FertilizerProvider() {
    fetchTasks();
  }

  List<Fertilizer> _fertilizers = [];

  List<Fertilizer> get fertilizers {
    return [..._fertilizers];
  }

  fetchTasks() async {
    const url = 'http://172.21.71.8:8000/apis/v1/fertilizer/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _fertilizers =
          data.map<Fertilizer>((json) => Fertilizer.fromJson(json)).toList();
    }
  }
}

class PestProvider with ChangeNotifier {
  PestProvider() {
    fetchTasks();
  }

  List<Pest> _pests = [];

  List<Pest> get pests {
    return [..._pests];
  }

  fetchTasks() async {
    const url = 'http://172.21.71.8:8000/apis/v1/pest/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _pests = data.map<Pest>((json) => Pest.fromJson(json)).toList();
    }
  }
}

class SoilProvider with ChangeNotifier {
  SoilProvider() {
    fetchTasks();
  }

  List<Soil> _soils = [];

  List<Soil> get soils {
    return [..._soils];
  }

  fetchTasks() async {
    const url = 'http://172.21.71.8:8000/apis/v1/soil/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _soils = data.map<Soil>((json) => Soil.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch soil from database');
    }
  }
}

Future<Weather> getWeather(String city) async {
  var url = 'http://172.21.71.8:8000/apis/v1/get_weather/$city/?format=json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    log("response body");
    log(response.body);
    var data = json.decode(response.body);
    return Weather.fromJson(data);
  } else {
    throw Exception('Failed to get weather');
  }
}

Future<MandiRate> getMandiRate(String crop) async {
  var url = 'http://172.21.71.8:8000/apis/v1/get_mandi/$crop/?format=json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    log("response body");
    log(response.body);
    var data = json.decode(response.body);
    return MandiRate.fromJson(data);
  } else {
    throw Exception('Failed to get MandiRate');
  }
}

Future<DBResponse> getAnswer(
    String crop, String query, String querytype, String category) async {
  var url =
      'http://172.21.71.8:8000/apis/v1/get_answer/$category/$crop/$querytype/$query?format=json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    log("response: ");
    log(response.body);
    var data = json.decode(response.body);
    return DBResponse.fromJson(data);
  } else {
    throw Exception("Failed to get answer");
  }
}
