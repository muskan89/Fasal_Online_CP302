import 'package:flutter/foundation.dart';

class Crop {
  final int id;
  final String name;
  final String description;
  final String species;
  final String category;
  final String season;
  final String botanical_name;
  final String genus;
  final String family;
  final String origin;
  final String synonym;
  final String rotations;
  final String cropimage;
  final String average_yield;
  final double yield_min;
  final double yield_max;
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

  Crop({required this.id,required this.name, required this.species, required this.description,required this.category,
    required this.season,
    required this.botanical_name,
    required this.genus,
    required this.family,
    required this.origin,
    required this.synonym,
    required this.rotations,
    required this.cropimage,
    required this.average_yield,
    required this.yield_min,
    required this.yield_max});

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
        id: (json['id']!=null)?json['id']:0,
        name: (json['name']!=null)?json['name']:"Not available",
        description: (json['description']!=null)?json['description']:"Not available",
        species: (json['species']!=null)?json['species']:"Not available",
      category: (json['category']!=null)?json['category']:"Not available",
      season: (json['season']!=null)?json['season']:"Not available",
      botanical_name: (json['botanical_name']!=null)?json['botanical_name']:"Not available",
      genus: (json['genus']!=null)?json['genus']:"Not available",
      family: (json['family']!=null)?json['family']:"Not available",
      origin: (json['origin']!=null)?json['origin']:"Not available",
      synonym: (json['synonym']!=null)?json['synonym']:"Not available",
      rotations: (json['rotations']!=null)?json['rotations']:"Not available",
      cropimage: (json['cropimage']!=null)?json['cropimage']:"Not available",
      average_yield: (json['average_yield']!=null)?json['average_yield']:"Not available",
      yield_min: (json['yield_min']!=null)?json['yield_min']:0.0,
      yield_max: (json['yield_max']!=null)?json['yield_max']:0.0,


    );
  }
}
