import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:onlinefasal/mandirate.dart';
import 'package:onlinefasal/models/dbresponse.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';



class govtSchemeScreen extends StatefulWidget {
  const govtSchemeScreen({Key? key}) : super(key: key);

  @override
  State<govtSchemeScreen> createState() => _govtSchemeScreenState();
}

class _govtSchemeScreenState extends State<govtSchemeScreen> {
  TextEditingController schemename = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  Future<DBResponse>? futureresponse;
  int _selectedscheme = 25;
  int _selectedQueryType = 2;

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
                                    width: 20,
                                    height: 20,
                                    //fit: BoxFit.cover,
                                  ),
                                  const Text('AskBhaisaab')
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
                                    'assets/images/govt_schemes.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const Text('Govt.Scheme')
                                ],
                              ),
                            ),
                            onTap: () {
                              log('Govt.Scheme button pressed');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const govtSchemeScreen()),
                              );
                            },
                          ),
                        ),

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
                                        builder: (context) => const MandiScreen()));
                              },
                            )),
                      ],
                    ))
              ]),
              Column(children: <Widget>[
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //         "Query Types",
                //         style: TextStyle(
                //             color: Color.fromRGBO(0, 128, 128, 1.0),
                //             fontSize: 20.0,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //           "Enter 2 for having info about Government Schemes",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                // ListTile(
                //   leading: Radio<int>(
                //     value: 2,
                //     groupValue: _selectedscheme,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedscheme = value!;
                //       });
                //     },
                //   ),
                //   title: const Text('Government Schemes'),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("",hi u
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text("Scheme Names",
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
                //       child: Text(
                //           "Enter 31 for Pradhan Mantri KISAN Samman Nidhi Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 25,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('Pradhan Mantri Fasal Bima Yojana (PMFBY)'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //           "Enter 32 for Pradhan Mantri Krishi Sinchai Yojana (PMKSY)",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 26,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('PM Kisan Credit card Yojna'),
                ),
                ListTile(
                  leading: Radio<int>(
                    value: 27,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('Pradhan Mantri KISAN Samman Nidhi Yojana'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("Enter 33 for Saur Sinchai Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("Enter 34 for Rashtriya Krishi Vikas Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 28,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('Pradhan Mantri Kisan Maan-Dhan Yojana'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //           "Enter 35 for Pradhan Mantri Fasal Bima Yojana (PMFBY)",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 29,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('PM Kusum Yojana'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //           "Enter 36 for Pradhan Mantri Kisan Maan-Dhan Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 30,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('Pardhan Mantri Kisan SAMPADA Yojana'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("Enter 37 for Soil Health Card Scheme",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                ListTile(
                  leading: Radio<int>(
                    value: 31,
                    groupValue: _selectedscheme,
                    onChanged: (value) {
                      setState(() {
                        _selectedscheme = value!;
                      });
                    },
                  ),
                  title: const Text('Machinery/Equipment Subsidy'),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("Enter 38 for PM Kusum Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                // ListTile(
                //   leading: Radio<int>(
                //     value: 38,
                //     groupValue: _selectedQueryType,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedQueryType = value!;
                //       });
                //     },
                //   ),
                //   title: const Text('PM Kusum Yojana'),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text(
                //           "Enter 39 for Pardhan Mantri Kisan SAMPADA Yojana",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                // ListTile(
                //   leading: Radio<int>(
                //     value: 39,
                //     groupValue: _selectedQueryType,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedQueryType = value!;
                //       });
                //     },
                //   ),
                //   title: const Text('Pardhan Mantri Kisan SAMPADA Yojana'),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     Expanded(
                //       child: Text("Enter 40 for Machinery/Equipment Subsidy",
                //           style: TextStyle(
                //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                //     ),
                //   ],
                // ),
                // ListTile(
                //   leading: Radio<int>(
                //     value: 40,
                //     groupValue: _selectedQueryType,
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedQueryType = value!;
                //       });
                //     },
                //   ),
                //   title: const Text('Machinery/Equipment Subsidy'),
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
                //               controller: querytype,
                //               decoration: const InputDecoration(
                //                 //icon: const Icon(Icons.person),
                //                 hintText: 'Enter query type:',
                //                 labelText: 'Query Type',
                //               ),
                //             ),
                //             TextFormField(
                //               controller: schemename,
                //               decoration: const InputDecoration(
                //                 //icon: const Icon(Icons.person),
                //                 hintText: 'Enter Scheme Name:',
                //                 labelText: 'Scheme Name',
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
                //                   onPressed: () {
                //                     log(querytype.text);
                //                     log(schemename.text);
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
                        ? buildColumn(_selectedQueryType,_selectedscheme)
                        : buildFutureBuilder())
              ]),
            ],
          )),
    );
  }

  Column buildColumn(int selectedQueryType,int selectedscheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TextField(
        //     controller: schemename,
        //     decoration: const InputDecoration(
        //       //icon: const Icon(Icons.person),
        //       hintText: 'Enter scheme name:',
        //       labelText: 'scheme name',
        //     )),
        // TextField(
        //     controller: querytype,
        //     decoration: const InputDecoration(
        //       //icon: const Icon(Icons.person),
        //       hintText: 'Enter the querytype:',
        //       labelText: 'querytype',
        //     )),
        Row(
          children: [
            SizedBox(
                width: 300,
                child: TextField(
                    controller: query,
                    decoration: const InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: 'Enter the query:',
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
                  selectedscheme.toString(),
                  _text != '' ? _text : query.text,
                  selectedQueryType.toString(),
                  '5');
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
                        TableRow(children: [
                          Column(children: const [
                            Text('Scheme',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('$_selectedscheme',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
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
