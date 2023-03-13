import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:onlinefasal/models/dbresponse.dart';

class ChatSchemeScreen extends StatefulWidget {
  const ChatSchemeScreen({Key? key}) : super(key: key);

  @override
  State<ChatSchemeScreen> createState() => _ChatSchemeScreenState();
}

class _ChatSchemeScreenState extends State<ChatSchemeScreen> {
  TextEditingController schemename = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  Future<DBResponse>? futureresponse;
  int _selectedscheme = 2;
  int _selectedQueryType=31;

  final _formKey = GlobalKey<FormState>();
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
                          Image.asset('assets/images/govt_schemes.png'),
                          const Text('Govt. Schemes')
                        ],
                      ),
                      onTap: () {
                        log('Govt. schemes button pressed');
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/rupee-sign.png'),
                          const Text('Mandi Rates')
                        ],
                      ),
                      onTap: () {
                        log('mandi rates button pressed');
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
                    "Query Types",
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
            //       child: Text(
            //           "Enter 2 for having info about Government Schemes",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 2,
                groupValue: _selectedscheme,
                onChanged: (value) {
                  setState(() {
                    _selectedscheme = value!;
                  });
                },
              ),
              title: const Text('Government Schemes'),
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
                value: 31,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Pradhan Mantri KISAN Samman Nidhi Yojana'),
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
                value: 32,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Pradhan Mantri Krishi Sinchai Yojana (PMKSY)'),
            ),
            ListTile(
              leading: Radio<int>(
                value: 33,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Saur Sinchai Yojana'),
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
                value: 34,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Rashtriya Krishi Vikas Yojana'),
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
                value: 35,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
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
            //           "Enter 36 for Pradhan Mantri Kisan Maan-Dhan Yojana",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 36,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Pradhan Mantri Kisan Maan-Dhan Yojana'),
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
                value: 37,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Soil Health Card Scheme'),
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
            ListTile(
              leading: Radio<int>(
                value: 38,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
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
            //           "Enter 39 for Pardhan Mantri Kisan SAMPADA Yojana",
            //           style: TextStyle(
            //               color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
            //     ),
            //   ],
            // ),
            ListTile(
              leading: Radio<int>(
                value: 39,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Pardhan Mantri Kisan SAMPADA Yojana'),
            ),
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
            ListTile(
              leading: Radio<int>(
                value: 40,
                groupValue: _selectedQueryType,
                onChanged: (value) {
                  setState(() {
                    _selectedQueryType = value!;
                  });
                },
              ),
              title: const Text('Machinery/Equipment Subsidy'),
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
                    ? buildColumn(_selectedscheme,_selectedQueryType)
                    : buildFutureBuilder())
          ]),
        ],
      )),
    );
  }

  Column buildColumn(int _selectedscheme,int _selectedQueryType) {
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
        TextField(
            controller: query,
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter the query:',
              labelText: 'query',
            )),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureresponse =
                  getAnswer(_selectedscheme.toString(), query.text, _selectedQueryType.toString(), '5');
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
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      defaultColumnWidth: FixedColumnWidth(320.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow( children: [
                          Column(children:[Text('Scheme',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${_selectedscheme}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Similarity Score with our database',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${dbResponse?.Similar_score}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Message',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${dbResponse?.Message}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Your Question',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${dbResponse?.Question}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text(
                              'Similar question that we find',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text(
                              '${dbResponse?.Question_Database}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Answer',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${dbResponse?.Answer}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Reference',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${dbResponse?.Reference}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),

                      ],
                    ),
                  )
              ),

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
