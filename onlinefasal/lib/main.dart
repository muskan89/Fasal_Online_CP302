//import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:onlinefasal/Farming.dart';
import 'package:onlinefasal/Home.dart';
import 'package:onlinefasal/Login.dart';

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
