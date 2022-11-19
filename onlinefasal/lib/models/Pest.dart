import 'package:flutter/foundation.dart';

class Pest {
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
  final String crop;
  final String state;
  final String name;
  final String symptoms;
  final String measures;
  final String pest_image;

  Pest({required this.crop, required this.state, required this.name,required this.symptoms,required this.measures,required this.pest_image});

  factory Pest.fromJson(Map<String, dynamic> json) {
    return Pest(
        crop: json['crop'],
        state: json['state'],
        name: json['name'],
        symptoms: json['symptoms'],
        measures: json['measures'],
        pest_image: json['pest_image'])
        ;
        }
}
