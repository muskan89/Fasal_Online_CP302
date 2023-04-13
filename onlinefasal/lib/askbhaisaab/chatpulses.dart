import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:onlinefasal/models/dbresponse.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

import 'chatmandi.dart';
import 'chatscheme.dart';

class ChatPulsesScreen extends StatefulWidget {
  const ChatPulsesScreen({Key? key}) : super(key: key);

  @override
  State<ChatPulsesScreen> createState() => _ChatPulsesScreenState();
}

class _ChatPulsesScreenState extends State<ChatPulsesScreen> {
  TextEditingController pulsename = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  Future<DBResponse>? futureresponse;
  int _selectedpulses = 64;
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
                const Expanded(
                  child: Text("Fasal Online",
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
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(0, 194, 146, 0.28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/home.png',
                            ),
                            const Text('Home')
                          ],
                        ),
                        onTap: () {
                          log('Home button pressed');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/weather.png'),
                          const Text('Weather')
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
                          Image.asset('assets/images/Farming.png'),
                          const Text('Farming')
                        ],
                      ),
                      onTap: () {
                        log('farming button pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FarmingScreen()));
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/bhaisaab.jpg',
                            width: 34,
                            height: 44,
                            fit: BoxFit.cover,
                          ),
                          const Text('Ask Bhaisaab')
                          //const Text('Farming')
                        ],
                      ),
                      onTap: () {
                        log('chat bot button pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatHomeScreen()));
                      },
                    )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/govt_schemes.png',
                                  height: 20, width: 20),
                              const Text('Govt.Scheme')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatSchemeScreen()));
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/rupee-sign.png',
                                  height: 20, width: 20),
                              const Text('Mandi Rates')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatMandiScreen()));
                          },
                        )),
                  ],
                ))
          ]),
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "Pulse Names",
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
                value: 64,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Lentil'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 64 for Lentil",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 65 for Bengal Gram",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 65,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Bengal Gram'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 66 for Green Gram",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 66,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Green Gram'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 67 for Kidney Bean",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 67,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Kidney Bean'),
            ),
            ListTile(
              leading: Radio<int>(
                value: 68,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Mash'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 68 for Mash",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 69,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('Pigeon Pea'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 69 for Pigeon Pea",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 70,
                groupValue: _selectedpulses,
                onChanged: (value) {
                  setState(() {
                    _selectedpulses = value!;
                  });
                },
              ),
              title: const Text('RiceBean'),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: const [
            //     Expanded(
            //       child: Text("Enter 70 for RiceBean",
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Query Types",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 128, 128, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
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
              title: const Text('Cultural Practices'),
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
              title: const Text('Nutrient Management'),
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
              title: const Text('Fertilizer Uses'),
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
              title: const Text('Varieties'),
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
              title: const Text('Weed Management'),
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
              title: const Text('Seeds'),
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
              title: const Text('Water Management'),
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
              title: const Text('Plant Protection'),
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
            //               controller: pulsename,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Pulse Name:',
            //                 labelText: 'Pulse Name',
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
            //                     log(pulsename.text);
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
                    ? buildColumn(_selectedpulses, _selectedQueryType)
                    : buildFutureBuilder())
          ]),
        ],
      )),
    );
  }

  Column buildColumn(int selectedpulses, int selectedQueryType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TextField(
        //     controller: pulsename,
        //     decoration: const InputDecoration(
        //       //icon: const Icon(Icons.person),
        //       hintText: 'Enter the pulse',
        //       labelText: 'Pulse number',
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
                    decoration: const InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: 'Enter the query',
                      labelText: 'query',
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
                  selectedpulses.toString(),
                  _text != '' ? _text : query.text,
                  selectedQueryType.toString(),
                  '10');
            });
          },
          child: const Text('get answer'),
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
                        //   Column(children:[Text('Pulse',
                        //       style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                        //           fontWeight: FontWeight.bold))]),
                        //   Column(children:[Text('${_selectedpulses}',
                        //       style: const TextStyle(fontSize: 15.0))]),
                        // ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Similarity Score with our database',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Similar_score}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Message',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Message}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Your Question',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Question}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Similar question that we find',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Question_Database}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Answer',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Answer}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: const [
                            Text('Reference',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${dbResponse?.Reference}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                      ],
                    ),
                  )),
              // Text('pulse : ${pulsename.text}',
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
              // Text('Reference : ${dbResponse?.Reference}',
              //     style: const TextStyle(fontSize: 25.0)),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
