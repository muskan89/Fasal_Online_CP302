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

class ChatFruitsScreen extends StatefulWidget {
  const ChatFruitsScreen({Key? key}) : super(key: key);

  @override
  State<ChatFruitsScreen> createState() => _ChatFruitsScreenState();
}

class _ChatFruitsScreenState extends State<ChatFruitsScreen> {
  TextEditingController fruitname = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  final translator = GoogleTranslator();

  Future<DBResponse>? futureresponse;
  int _selectedFruit = 32;
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
                    "फलों के नाम",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ):Text(
                    "Fruit Names",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Radio<int>(
                value: 32,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Lemon", 'hi') :  Text('Lemon'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 41 for Lemon",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 42 for Lime",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // ListTile(
            //   leading: Radio<int>(
            //     value: 33,
            //     groupValue: _selectedFruit,
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedFruit = value!;
            //       });
            //     },
            //   ),
            //   title: (language == 'Hindi') ? buildFutureBuildertr(
            //       "Lime", 'hi') :  Text('Lime'),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 43 for Banana",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 34,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Banana", 'hi') :  Text('Banana'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 44 for Ber",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 35,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Ber fruit", 'hi') :  Text('Ber'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 45 for Grapes",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 36,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Grapes", 'hi') :  Text('Grapes'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 46 for Guava",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 37,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Guava", 'hi') :  Text('Guava'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 47 for Jamun",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 38,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "fruit of jamun", 'hi') :  Text('Jamun'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 48 for Litchi",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 39,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Litchi", 'hi') :  Text('Litchi'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 49 for Mango",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 40,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Mango", 'hi') :  Text('Mango'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 50 for Orange/Santra",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 41,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Orange", 'hi') :  Text('Orange'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 51 for WaterMelon",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 42,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "WaterMelon", 'hi') :  Text('WaterMelon'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 52 for Malta",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 43,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Malta", 'hi') :  Text('Malta'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 53 for Papaya",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 44,
                groupValue: _selectedFruit,
                onChanged: (value) {
                  setState(() {
                    _selectedFruit = value!;
                  });
                },
              ),
              title: (language == 'Hindi') ? buildFutureBuildertr(
                  "Papaya", 'hi') :  Text('Papaya'),
            ),
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
            //               controller: fruitname,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Fruit Name:',
            //                 labelText: 'Fruit Name',
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
            //                 padding:
            //                     const EdgeInsets.only(left: 150.0, top: 40.0),
            //                 child: ElevatedButton(
            //                   child: const Text('Get Answer'),
            //                   //color: Color.fromRGBO(0, 128, 128, 1.0),
            //                   onPressed: () {
            //                     log(fruitname.text);
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
            Container(
                alignment: Alignment.center,
                child: (futureresponse == null)
                    ? buildColumn(_selectedQueryType, _selectedFruit)
                    : buildFutureBuilder())
          ]),
        ],
      )),
    );
  }

  Column buildColumn(int selectedQueryType, int selectedFruit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TextField(
        //     controller: fruitname,
        //     decoration: const InputDecoration(
        //       //icon: const Icon(Icons.person),
        //       hintText: 'Enter the fruit',
        //       labelText: 'Fruit number',
        //     )),
        // TextField(
        //     controller: querytype,
        //     decoration: const InputDecoration(
        //       //icon: const Icon(Icons.person),
        //       hintText: 'Enter the querytype',
        //       labelText: 'querytype number',
        //     )),
        Row(
          children: [
            SizedBox(
                width: 300,
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
                  selectedFruit.toString(),
                  _text != '' ? _text : query.text,
                  selectedQueryType.toString(),
                  '7');
              //getAnswer(fruitname.text, query.text, querytype.text, '7');
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
                        //   Column(children:[Text('Fruit',
                        //       style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                        //           fontWeight: FontWeight.bold))]),
                        //   Column(children:[Text('${_selectedFruit}',
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
              // Text('fruit : ${fruitname.text}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Similar Score : ${dbResponse?.Similar_score}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Message : ${dbResponse?.Message}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Your Question : ${dbResponse?.Question}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text(
              //     'Similar question that we find : ${dbResponse?.Question_Database}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Answer : ${dbResponse?.Answer}',
              //     style: const TextStyle(fontSize: 25.0)),
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
