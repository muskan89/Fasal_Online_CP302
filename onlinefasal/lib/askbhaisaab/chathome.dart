import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/govtscheme.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chatscheme.dart';
import 'package:onlinefasal/askbhaisaab/chatcereals.dart';
import 'package:onlinefasal/askbhaisaab/chatcommunication.dart';
import 'package:onlinefasal/askbhaisaab/chatfruits.dart';
import 'package:onlinefasal/askbhaisaab/chatmandi.dart';
import 'package:onlinefasal/askbhaisaab/chatoilseed.dart';
import 'package:onlinefasal/askbhaisaab/chatpulses.dart';
import 'package:onlinefasal/askbhaisaab/chatspices.dart';
import 'package:onlinefasal/askbhaisaab/chatvegi.dart';
import 'package:onlinefasal/askbhaisaab/chatweather.dart';
import 'package:onlinefasal/Content/constants.dart';
import 'package:translator/translator.dart';


import '../mandirate.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  TextEditingController textController = TextEditingController();
  final translator = GoogleTranslator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/logo.png'),
                    ],
                  ),
                ),
                Expanded(
                  child: (language=='Hindi') ?Text("फसल औनलाईन",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 194, 146, 1),
                          fontSize: 25.0)):Text("Fasal Online",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 194, 146, 1),
                          fontSize: 25.0)),
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                            child: Image.asset('assets/images/bell.png'),
                            onTap: () {
                              log('bell icon pressed');
                            }),
                        InkWell(
                            child: Image.asset('assets/images/user_logo.png'),
                            onTap: () {
                              log('user login button pressed');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginScreen()));
                            }),
                      ]),
                )
              ],
            )
          ]),

          Column(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(0, 194, 146, 0.28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/home.png',
                                height: 20,
                                width: 20,
                              ),
                              (language == 'Hindi') ? Text('होम') : Text('Home')
                            ],
                          ),
                        ),
                        onTap: () {
                          log('Home button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/weather.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuilder(
                                  "Weather", 'hi') : Text('Weather')
                            ],
                          ),
                          onTap: () {
                            log('weather button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Weatherr()));
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/Farming.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuilder(
                                  "Farming", 'hi') : Text('Farming')

                            ],
                          ),
                          onTap: () {
                            log('farming button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const FarmingScreen()));
                          },
                        )),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.teal.withOpacity(0.5),
                                Colors.teal.withOpacity(0.2),
                              ],
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/bhaisaab.jpg',
                                width: 34,
                                height: 44,
                                fit: BoxFit.cover,
                              ),

                              (language == 'Hindi') ?Text('आस्क भाईसाब') : Text('AskBhaisaab')
                            ],
                          ),
                        ),
                        onTap: () {
                          log('chat bot button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChatHomeScreen()),
                          );
                        },
                      ),
                    )
                    ,

                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/govt_schemes.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? Text('सरकारी योजना')  : Text('Govt.Scheme')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const govtSchemeScreen()));
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/rupee-sign.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuilder(
                                  "Mandi Rates", 'hi') : Text('Mandi Rates')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const MandiScreen()));
                          },
                        )),
                  ],
                ))
          ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: (language == 'Hindi') ? Text(" नमस्ते! फसल औनलाईन पर भाईसाब आपका स्वागत करते है|",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 20.0)) :
                    Text("  Hello! BhaiSaab welcomes you on FasalOnline",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: (language == 'Hindi') ? buildFutureBuilder(
                      "  How can I help you? Please select category from the given options.", 'hi') :
                  Text(
                      "  How can I help you? Please select category from the given options",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatWeatherScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.orange),
                    child:
                    (language == 'Hindi') ? buildFutureBuilderwhite('Weather', 'hi'):
                    Text(
                      'Weather',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 400,
            //       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            //       child: TextButton(
            //         onPressed: () {
            //           Navigator.of(context).push(
            //             // With MaterialPageRoute, you can pass data between pages,
            //             // but if you have a more complex app, you will quickly get lost.
            //             MaterialPageRoute(
            //               builder: (context) => const ChatMandiScreen(),
            //             ),
            //           );
            //         },
            //         style: TextButton.styleFrom(
            //             elevation: 2, backgroundColor: Colors.brown),
            //         child: (language == 'Hindi') ? buildFutureBuilderwhite('Mandi Rate', 'hi'): Text(
            //           'Mandi Rate',
            //           style: TextStyle(fontSize: 20.0, color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatVegiScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.teal),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Vegetables', 'hi'): Text(
                      'Vegetables',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatSpicesScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.red),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Spices', 'hi'): Text(
                      'Spices',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatSchemeScreen(),
                        ),
                      );
                      //
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.blue),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Government Schemes', 'hi'): Text(
                      'Government Schemes',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatCommunicationScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.black),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Communication', 'hi'): Text(
                      'Communication',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatFruitsScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.orange),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Fruits', 'hi'): Text(
                      'Fruits',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatCerealsScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.green),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Cereals', 'hi'): Text(
                      'Cereals',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatOilseedScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.grey),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Oilseeds', 'hi'): Text(
                      'Oilseeds',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatPulsesScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.teal),
                    child: (language == 'Hindi') ? buildFutureBuilderwhite('Pulses', 'hi'): Text(
                      'Pulses',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ],
      )),
    );
  }
  Future<String> translate(String text, String toLanguage) async {
    var translation = await translator.translate(text, to: toLanguage);
    return translation.text;
  }
  FutureBuilder<String> buildFutureBuilder(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(fontSize: 20));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  FutureBuilder<String> buildFutureBuilderwhite(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(fontSize: 20.0, color: Colors.white));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
