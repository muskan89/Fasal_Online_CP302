import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Disease.dart';


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
