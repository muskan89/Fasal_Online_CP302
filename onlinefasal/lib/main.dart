//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

void main() async{
  final translator = GoogleTranslator();

  final input = "Welcome to fasal online";

  //print(await translator.translate(input, from: 'en', to: 'hi').toString());
  // prints Hello. Are you okay?
  print(await translator.translate("Weather", to: 'hi').toString());

  var translation = await translator.translate("home", to: 'hi');
  var p=translation.toString();
  print(p);
  // prints Dart jest bardzo fajny!

  print(await "example".translate(to: 'pt'));
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
