import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Fertilizer.dart';


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
      _fertilizers = data.map<Fertilizer>((json) => Fertilizer.fromJson(json)).toList();
    }
  }
}