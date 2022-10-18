//import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/sign_up.dart';
import 'package:onlinefasal/splashscreen.dart';
import 'package:onlinefasal/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasal online',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Scaffold(
        body: HomeScreen(),
        //body: const HomeScreen(),
      ),
    );
  }
}
