import 'package:flutter/foundation.dart';

class Soil {
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
  final String type;
  final String water_content;
  final String ph;
  final String water_content_min;
  final String water_content_max;
  final String ph_min;
  final String ph_max;

  Soil({required this.crop, required this.state, required this.type,required this.water_content,required this.ph,required this.water_content_min, required this.water_content_max, required this.ph_min,required this.ph_max});

  factory Soil.fromJson(Map<String, dynamic> json) {
    return Soil(
        crop: json['crop'],
        state: json['state'],
        type: json['type'],
        water_content: json['water_content'],
        ph: json['ph'],
        water_content_min: json['water_content_min'],
        water_content_max: json['water_content_max'],
        ph_min: json['ph_min'],
        ph_max: json['ph_max'])
    ;
  }
}
