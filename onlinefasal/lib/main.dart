//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CropProvider()),
        ChangeNotifierProvider(create: (context) => DiseaseProvider()),
        ChangeNotifierProvider(create: (context) => FertilizerProvider()),
        ChangeNotifierProvider(create: (context) => PestProvider()),
        ChangeNotifierProvider(create: (context) => SoilProvider())
      ],
      child: MaterialApp(
        title: 'Fasal online',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
