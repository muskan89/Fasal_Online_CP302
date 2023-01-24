import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Crop.dart';
import '../models/Disease.dart';
import '../models/Pest.dart';
import '../models/Soil.dart';
import '../models/Fertilizer.dart';

class CropProvider with ChangeNotifier {
  CropProvider() {
    this.fetchTasks();
  }

  List<Crop> _crops = [];

  List<Crop> get crops {
    return [..._crops];
  }

  fetchTasks() async {
    const url = 'http://127.0.0.1:8000/apis/v1/crop/?format=json';
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
    this.fetchTasks();
  }

  List<Disease> _diseases = [];

  List<Disease> get diseases {
    return [..._diseases];
  }

  fetchTasks() async {
    const url = 'http://127.0.0.1:8000/apis/v1/disease/?format=json';
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
    this.fetchTasks();
  }

  List<Fertilizer> _fertilizers = [];

  List<Fertilizer> get fertilizers {
    return [..._fertilizers];
  }

  fetchTasks() async {
    const url = 'http://127.0.0.1:8000/apis/v1/fertilizer/?format=json';
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
    this.fetchTasks();
  }

  List<Pest> _pests = [];

  List<Pest> get pests {
    return [..._pests];
  }

  fetchTasks() async {
    const url = 'http://127.0.0.1:8000/apis/v1/pest/?format=json';
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
    this.fetchTasks();
  }

  List<Soil> _soils = [];

  List<Soil> get soils {
    return [..._soils];
  }

  fetchTasks() async {
    const url = 'http://127.0.0.1:8000/apis/v1/soil/?format=json';
    final response = await http.get(Uri.parse(url));
    //log(response.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      log(response.body);
      _soils = data.map<Soil>((json) => Soil.fromJson(json)).toList();
    }
  }
}
