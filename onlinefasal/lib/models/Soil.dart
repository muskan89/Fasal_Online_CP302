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
  final int crop;
  final String state;
  final String type;
  final String water_content;
  final String ph;
  final int water_content_min;
  final int water_content_max;
  final double ph_min;
  final double ph_max;

  Soil({required this.crop, required this.state, required this.type,required this.water_content,required this.ph,required this.water_content_min, required this.water_content_max, required this.ph_min,required this.ph_max});

  factory Soil.fromJson(Map<String, dynamic> json) {
    return Soil(
        crop: (json['crop']!=null)?json['crop']: -1,
        state: (json['state']!=null)?json['state']:"Not available",
        type: (json['type']!=null)?json['type']:"Not available",
        water_content: (json['water_content']!=null)?json['water_content']:"Not available",
        ph: (json['ph']!=null)?json['ph']:"Not available",
        water_content_min: (json['water_content_min']!=null)?json['water_content_min']: -1,
        water_content_max: (json['water_content_max']!=null)?json['water_content_max']:-1,
        ph_min: (json['ph_min']!=null)?json['ph_min']:-1.0,
        ph_max: (json['ph_max']!=null)?json['ph_max']:-1.0)
    ;
  }
}
