import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/govtscheme.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/models/dbresponse.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:onlinefasal/Content/constants.dart';
import 'package:translator/translator.dart';

import '../mandirate.dart';
import 'chatmandi.dart';
import 'chatscheme.dart';

class ChatVegiScreen extends StatefulWidget {
  const ChatVegiScreen({Key? key}) : super(key: key);

  @override
  State<ChatVegiScreen> createState() => _ChatVegiScreenState();
}

class _ChatVegiScreenState extends State<ChatVegiScreen> {
  TextEditingController veginame = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  final translator = GoogleTranslator();

  TextEditingController category = TextEditingController();
  Future<DBResponse>? futureresponse;
  int _selectedvegi = 2;
  int _selectedQueryType = 1;

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {}
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

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
                              (language == 'Hindi') ? buildFutureBuildertr(
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
                              (language == 'Hindi') ? buildFutureBuildertr(
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
                              (language == 'Hindi') ? buildFutureBuildertr(
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
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: (language == 'Hindi') ? Text(
                    "सब्जियों के नाम",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ):Text(
                    "Vegetable Names",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 1 for Ash Gourd",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 1,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: (language == 'Hindi') ? buildFutureBuildertr(
            //       "Ash Gourd", 'hi') : Text('Ash Gourd'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 2 for Turnip",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 2,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Tomato", 'hi') : Text('Tomato'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 3 for Tomato",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 3,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Sweet Potato", 'hi') : Text('Sweet Potato'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 4 for Sweet Potato",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 4,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Sponge Gourd", 'hi') : Text('Sponge Gourd'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 5 for Squash Melon",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 5,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Radish", 'hi') : Text('Radish'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 6 for Sponge Gourd",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 6,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Rabi Onion", 'hi') : Text('Rabi Onion'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 7 for Spinach (Palak)",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 7,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Pumpkin", 'hi') : Text('Pumpkin'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 8 for Radish",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 8,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Potato", 'hi') : Text('Potato'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 9 for Rabi Onion(Pyaz)",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 9,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Peas", 'hi') : Text('Peas'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 10 for Pumpkin",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 10,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Okra", 'hi') : Text('Okra'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 11 for Potato",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 11,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Kharif Onion", 'hi') : Text('Kharif Onion'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 12 for Peas",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 12,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Garlic", 'hi') : Text('Garlic'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 13 for Okra",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 13,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Cucumber", 'hi') : Text('Cucumber'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 14 for Long Melon",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 14,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Chilli", 'hi') : Text('Chilli'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 15 for Lettuce",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 15,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Cauliflower", 'hi') : Text('Cauliflower'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 16 for Kharif Onion(Pyaz)",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 16,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Carrot", 'hi') : Text('Carrot'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 17 for Garlic",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 17,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Bitter Gourd", 'hi') : Text('Bitter Gourd'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 18 for Cucumber",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 18,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Capsicum", 'hi') : Text('Capsicum'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 19 for Chilli",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 19,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Cabbage", 'hi') : Text('Cabbage'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 20 for Cauliflower",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 20,
                groupValue: _selectedvegi,
                onChanged: (value) {
                  setState(() {
                    _selectedvegi = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Brinjal", 'hi') : Text('Brinjal'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 21 for Carrot",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 21,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Carrot'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 22 for Beetroot",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 22,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Beetroot'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 23 for Bitter Gourd",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 23,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Bitter Gourd'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 24 for Capsicum",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 24,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Capsicum'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 25 for Cabbage",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 25,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Capsicum'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 26 for Broccoli",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 26,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Broccoli'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 27 for Brinjal",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 27,
            //     groupValue: _selectedvegi,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedvegi = value!;
            //       });
            //     },
            //   ),
            //   title: const Text('Brinjal'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: (language == 'Hindi') ? buildFutureBuildergr(
                      "Question Types", 'hi') :Text("Query Types",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 128, 128, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            ListTile(
              leading: Radio<int>(
                value: 1,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Cultural Practices", 'hi') :  Text('Cultural Practices'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 3,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Nutrient Management", 'hi') :  Text('Nutrient Management'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 4,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Fertilizer Uses", 'hi') :  Text('Fertilizer Uses'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 5,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Varieties", 'hi') :  Text('Varieties'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 6,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Weed Management", 'hi') :  Text('Weed Management'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 7,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Seeds", 'hi') :  Text('Seeds'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 10,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Water Management", 'hi') :  Text('Water Management'),
            ),

            ListTile(
              leading: Radio<int>(
                value: 11,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Plant Protection", 'hi') :  Text('Plant Protection'),
            ),
            //
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 1 for Cultural Practices",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 3 for Nutrient Management",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 4 for Fertilizer Uses",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 5 for Varieties",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 6 for Weed Management",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 7 for Seeds",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 10 for Water Management",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 11 for Plant Protection",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Form(
            //         key: _formKey,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             TextFormField(
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Scheme Name:',
            //                 labelText: 'Scheme Name',
            //               ),
            //             ),
            //
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Form(
            //         key: _formKey,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             TextFormField(
            //               controller: veginame,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Vegetable Name:',
            //                 labelText: 'Vegetable Name',
            //               ),
            //             ),
            //             TextFormField(
            //               controller: querytype,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter query type:',
            //                 labelText: 'Query Type',
            //               ),
            //             ),
            //             TextFormField(
            //               controller: query,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter your query:',
            //                 labelText: 'Query',
            //               ),
            //             ),
            //             Container(
            //                 padding: const EdgeInsets.only(
            //                     left: 150.0, top: 40.0, bottom: 20.0),
            //                 child: ElevatedButton(
            //                   child: const Text('Get Answer'),
            //                   //color: Color.fromRGBO(0, 128, 128, 1.0),
            //                   onPressed: () {
            //                     log(veginame.text);
            //                     log(querytype.text);
            //                     log(query.text);
            //                   },
            //                 )),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ]),
          Container(
              alignment: Alignment.topLeft,
              child: (futureresponse == null)
                  ? buildColumn(_selectedvegi, _selectedQueryType)
                  : buildFutureBuilder())
        ],
      )),
    );
  }

  Column buildColumn(int selectedvegi, int selectedQueryType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
                width: 300,
                // TextField(
                //     controller: veginame,
                //     decoration: const InputDecoration(
                //       //icon: const Icon(Icons.person),
                //       hintText: 'Enter the vegetable',
                //       labelText: 'Vegetable number',
                //     )),
                // TextField(
                //     controller: querytype,
                //     decoration: const InputDecoration(
                //       //icon: const Icon(Icons.person),
                //       hintText: 'Enter the querytype',
                //       labelText: 'querytype number',
                //     )),
                child: TextField(
                    controller: query,
                    decoration:  InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: (language == 'Hindi') ? 'प्रश्न दर्ज करें ': 'Enter the query',
                      labelText: (language == 'Hindi') ? 'प्रश्न': 'query',
                    ))),
            AvatarGlow(
              animate: _isListening,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 20.0,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                onPressed: _listen,
                child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          reverse: true,
          child: Text(_text,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 194, 146, 1), fontSize: 25.0)),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureresponse = getAnswer(
                  selectedvegi.toString(),
                  _text != '' ? _text : query.text,
                  selectedQueryType.toString(),
                  '3');
            });
          },
          child: (language == 'Hindi') ? buildFutureBuildertr(
              "get the answer", 'hi'): Text('get answer'),
        ),
      ],
    );
  }

  FutureBuilder<DBResponse> buildFutureBuilder() {
    return FutureBuilder<DBResponse>(
      future: futureresponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          log("frontend");
          var string = snapshot.data?.Similar_score.toString();
          log(string!);
          DBResponse? dbResponse = snapshot.data;
          return Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      defaultColumnWidth: const FixedColumnWidth(320.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        // TableRow( children: [
                        //   Column(children:[Text('Vegetable Number',
                        //       style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                        //           fontWeight: FontWeight.bold))]),
                        //   Column(children:[Text('${_selectedvegi}',
                        //       style: const TextStyle(fontSize: 15.0))]),
                        // ]),
                        TableRow(children: [
                          Column(children:  [(language=='Hindi')?
                          buildFutureBuilderans(
                              "Message", 'hi'):
                          Text('Message',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            (language=='Hindi')?
                            buildFutureBuilderans(
                                '${dbResponse?.Message}', 'hi'):Text('${dbResponse?.Message}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [(language=='Hindi')?
                          buildFutureBuilderans(
                              'Your Question', 'hi'):
                          Text('Your Question',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            (language=='Hindi')?
                            buildFutureBuilderans(
                                '${dbResponse?.Question}', 'hi'):Text('${dbResponse?.Question}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language=='Hindi')?
                            buildFutureBuilderans(
                                'Similar question that we find', 'hi'):Text('Similar question that we find',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            (language=='Hindi')?
                            buildFutureBuilderans(
                                '${dbResponse?.Question_Database}', 'hi'):Text('${dbResponse?.Question_Database}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [(language=='Hindi')?
                          buildFutureBuilderans(
                              "Answer", 'hi'):Text('Answer',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            (language=='Hindi')?
                            buildFutureBuilderans(
                                '${dbResponse?.Answer}', 'hi'):Text('${dbResponse?.Answer}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                      ],
                    ),
                  )),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Vegetable : ${veginame.text}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Similar Score : ${dbResponse?.Similar_score}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Message : ${dbResponse?.Message}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Your Question : ${dbResponse?.Question}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Similar question that we find : ${dbResponse?.Question_Database}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Answer: ',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 128, 128, 1.0), fontSize: 15.0,fontWeight: FontWeight.bold),
              //
              //       ),
              //
              //     ),
              //     Expanded(
              //       child: Text('${dbResponse?.Answer}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //     Expanded(
              //       child: Text('Reference : ${dbResponse?.Reference}',
              //           style: TextStyle(
              //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 10.0)),
              //     ),
              //   ],
              // ),
              //
              // Text('Vegetable : ${veginame.text}',
              //     style: const TextStyle(fontSize: 15.0)),
              // Text('Similar Score : ${dbResponse?.Similar_score}',
              //     style: const TextStyle(fontSize: 15.0)),
              // Text('Message : ${dbResponse?.Message}',
              //     style: const TextStyle(fontSize: 15.0)),
              // Text('Your Question : ${dbResponse?.Question}',
              //     style: const TextStyle(fontSize: 15.0)),
              // Text(
              //     'Similar question that we find : ${dbResponse?.Question_Database}',
              //     style: const TextStyle(fontSize: 15.0)),
              // Text('Answer : ${dbResponse?.Answer}',
              //     style: const TextStyle(fontSize: 15.0)),
              Text('Reference : ${dbResponse?.Reference}',
                  style: const TextStyle(fontSize: 10.0)),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  Future<String> translate(String text, String toLanguage) async {
    var translation = await translator.translate(text, to: toLanguage);
    return translation.text;
  }
  FutureBuilder<String> buildFutureBuildertr(textToTranslate, toLanguage){
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
  FutureBuilder<String> buildFutureBuildergr(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(
              color: Color.fromRGBO(0, 128, 128, 1.0),
              fontSize: 20.0,
              fontWeight: FontWeight.bold));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  FutureBuilder<String> buildFutureBuilderans(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(0, 128, 128, 1.0),
              fontWeight: FontWeight.bold));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
