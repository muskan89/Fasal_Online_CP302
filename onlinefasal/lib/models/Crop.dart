import 'package:flutter/foundation.dart';

class Crop {
  final String name;
  final String description;
  final String species;
  // final String category;
  // final String season;
  // final String botanicalName;
  // final String genus;
  // final String family;
  // final String origin;
  // final String synonym;
  // final String rotations;
  // final String cropimage;
  // final String averageYield;
  // final Float32List yieldMin;
  // final Float32List yieldMax;

  Crop({required this.name, required this.species, required this.description});

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
        name: json['name'],
        description: json['description'],
        species: json['species']);
  }
}
