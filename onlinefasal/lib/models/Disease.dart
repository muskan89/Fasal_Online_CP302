import 'package:flutter/foundation.dart';

class Disease {
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
  final String type;
  final String symptoms;
  final String measures;
  final String common_name;
  final String disease_image;

  Disease({required this.crop, required this.state, required this.name,required this.type,required this.symptoms,required this.measures, required this.common_name, required this.disease_image});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
        crop: json['crop'],
        state: json['state'],
        name: json['name'],
        type: json['type'],
        symptoms: json['symptoms'],
        measures: json['measures'],
        common_name: json['common_name'],
        disease_image: json['disease_image'])
    ;
  }
}
