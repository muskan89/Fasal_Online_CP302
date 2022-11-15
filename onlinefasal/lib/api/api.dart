import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Crop.dart';

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
