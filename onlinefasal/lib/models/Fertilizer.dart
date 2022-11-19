import 'package:flutter/foundation.dart';

class Fertilizer {
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
  final int crop_id;
  final String state;
  final String trade_name;
  final String cycle;
  final String amount;
  final String amount_min;
  final String amount_max;

  Fertilizer({required this.crop_id, required this.state, required this.trade_name,required this.cycle,required this.amount,required this.amount_min, required this.amount_max});

  factory Fertilizer.fromJson(Map<String, dynamic> json) {
    return Fertilizer(
        crop_id: (json['crop_id']!=null)?json['crop_id']:-1,
        state: (json['state']!=null)?json['state']:"Not available",
        trade_name: (json['trade_name']!=null)?json['trade_name']:"Not available",
        cycle: (json['cycle']!=null)?json['cycle']:"Not available",
        amount: (json['amount']!=null)?json['amount']:"Not available",
        amount_min: (json['amount_min']!=null)?json['amount_min']:"Not available",
        amount_max: (json['amount_max']!=null)?json['amount_max']:"Not available")
    ;
  }
}
