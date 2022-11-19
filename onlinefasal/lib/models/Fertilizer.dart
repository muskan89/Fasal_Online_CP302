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
  final String crop_id;
  final String state;
  final String trade_name;
  final String cycle;
  final String amount;
  final String amount_min;
  final String amount_max;

  Fertilizer({required this.crop_id, required this.state, required this.trade_name,required this.cycle,required this.amount,required this.amount_min, required this.amount_max});

  factory Fertilizer.fromJson(Map<String, dynamic> json) {
    return Fertilizer(
        crop_id: json['crop_id'],
        state: json['state'],
        trade_name: json['trade_name'],
        cycle: json['cycle'],
        amount: json['amount'],
        amount_min: json['amount_min'],
        amount_max: json['amount_max'])
    ;
  }
}
