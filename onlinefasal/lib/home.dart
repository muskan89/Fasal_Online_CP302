import 'dart:developer';
import 'package:onlinefasal/govtscheme.dart';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:onlinefasal/askbhaisaab/chatscheme.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:onlinefasal/models/mandiRate.dart';
import 'package:onlinefasal/askbhaisaab/chatmandi.dart';
import 'Content/constants.dart';
import 'package:translator/translator.dart';

import 'mandirate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/bhaisaab.jpg',
                                width: 20,
                                height: 20,
                                //fit: BoxFit.cover,
                              ),
                              (language == 'Hindi') ?Text('आस्क भाईसाब') : Text('AskBhaisaab')
                              //const Text('Farming')
                            ],
                          ),
                          onTap: () {
                            log('chat bot button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const ChatHomeScreen()));
                          },
                        )),
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
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(
                'assets/images/fasall.jpg',
                //width: 40,
                height: 200,
                fit: BoxFit.fill,
              )),
          DropdownButton<String>(
            value: language,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 12,
            elevation: 1,
            style: const TextStyle(color: Colors.teal),
            underline: Container(
              height: 2,
              width: 25,
              color: Colors.tealAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                language = newValue!;
              });
            },
            items: <String>['English', 'Hindi']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Column(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(
                    //   child: InkWell(
                    //     child: Column(
                    //       children: <Widget>[
                    //         Image.asset('assets/images/home.png',
                    //             height: 20, width: 20),
                    //         const Text('Home')
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       log('Home button pressed');
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const HomeScreen()));
                    //     },
                    //   ),
                    // ),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/mausam.jpg',
                                  height: 130, width: 190, fit: BoxFit.fill),
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
                              Image.asset('assets/images/kisani.png',
                                  height: 130, width: 190, fit: BoxFit.fill),
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
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset(
                    //             'assets/images/bhaisaab.jpg',
                    //             width: 20,
                    //             height: 20,
                    //             //fit: BoxFit.cover,
                    //           ),
                    //           const Text('AskBhaisaab')
                    //           //const Text('Farming')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('chat bot button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const ChatHomeScreen()));
                    //       },
                    //     )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/govt_schemes.png',
                    //               height: 20, width: 20),
                    //           const Text('Govt.Scheme')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('Govt. schemes button pressed');
                    //       },
                    //     )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/rupee-sign.png',
                    //               height: 22, width: 22),
                    //           const Text('Mandi Rates')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('mandi rates button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const ChatMandiScreen()));
                    //       },
                    //     )),
                  ],
                ))
          ]),
          Column(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded(
                    //   child: InkWell(
                    //     child: Column(
                    //       children: <Widget>[
                    //         Image.asset('assets/images/home.png',
                    //             height: 20, width: 20),
                    //         const Text('Home')
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       log('Home button pressed');
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const HomeScreen()));
                    //     },
                    //   ),
                    // ),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/weather.png',
                    //               height: 90, width: 90),
                    //           const Text('Weather')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('weather button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => Weatherr()));
                    //       },
                    //     )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/Farming.png',
                    //               height: 90, width: 90),
                    //           const Text('Farming')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('farming button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const FarmingScreen()));
                    //       },
                    //     )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/bhaisaabbbb.png',
                                width: 190,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                              (language == 'Hindi') ? Text('आस्क भाईसाब') : Text('AskBhaisaab')

                              //const Text('Farming')
                            ],
                          ),
                          onTap: () {
                            log('chat bot button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const ChatHomeScreen()));
                          },
                        )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/govt_schemes.png',
                    //               height: 20, width: 20),
                    //           const Text('Govt.Scheme')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('Govt. schemes button pressed');
                    //       },
                    //     )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/rupee-sign.jpg',
                                  height: 130, width: 190, fit: BoxFit.fill),
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
          Column(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Expanded(
                    //   child: InkWell(
                    //     child: Column(
                    //       children: <Widget>[
                    //         Image.asset('assets/images/home.png',
                    //             height: 20, width: 20),
                    //         const Text('Home')
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       log('Home button pressed');
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const HomeScreen()));
                    //     },
                    //   ),
                    // ),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/weather.png',
                    //               height: 90, width: 90),
                    //           const Text('Weather')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('weather button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => Weatherr()));
                    //       },
                    //     )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('assets/images/Farming.png',
                    //               height: 90, width: 90),
                    //           const Text('Farming')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('farming button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const FarmingScreen()));
                    //       },
                    //     )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset(
                    //             'images/bhaisaabbbb.png',
                    //             width: 190,
                    //             height: 140,
                    //             fit: BoxFit.cover,
                    //           ),
                    //           const Text('AskBhaisaab')
                    //           //const Text('Farming')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('chat bot button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const ChatHomeScreen()));
                    //       },
                    //     )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/govt.png',
                                  height: 110, width: 190),
                              (language == 'Hindi') ? Text('सरकारी योजना') : Text('Govt.Scheme')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const ChatSchemeScreen()));
                          },
                        )),
                    // Expanded(
                    //     child: InkWell(
                    //       child: Column(
                    //         children: <Widget>[
                    //           Image.asset('images/rupee-sign.jpg',
                    //               height: 140, width: 190,fit: BoxFit.fill),
                    //           const Text('Mandi Rates')
                    //         ],
                    //       ),
                    //       onTap: () {
                    //         log('mandi rates button pressed');
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => const ChatMandiScreen()));
                    //       },
                    //     )),
                  ],
                ))
          ]),
          // Column(
          //   // crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //   Expanded(
          //   child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //   Expanded(
          //   child: Container(
          //   color: Colors.red,
          //   ),
          //   ),
          //   Expanded(
          //   child: Container(
          //   color: Colors.yellow,
          //   ),
          //   ),
          //   ],
          //   ),
          //   ),
          //   Expanded(
          //   child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //   Expanded(
          //   child: Container(
          //   color: Colors.purple,
          //   ),
          //   ),
          //   Expanded(
          //   child: Container(
          //   color: Colors.black,
          //   ),
          //   ),
          //   ],
          //   ),
          //   ),
          //   ],
          // ),


          // Container(
          //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          //   child: ListView(
          //
          //   )
          // ),

          // Container(
          //     child: Column(
          //     children: <Widget>[
          //       Row(
          //         //crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: <Widget>[
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.stretch,
          //               children: <Widget>[
          //                 Expanded(
          //                   child: Container(
          //                     color: Colors.red,
          //                   ),
          //                 ),
          //                 Expanded(
          //                   child: Container(
          //                     color: Colors.yellow,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Expanded(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.stretch,
          //               children: <Widget>[
          //                 Expanded(
          //                   child: Container(
          //                     color: Colors.purple,
          //                   ),
          //                 ),
          //                 Expanded(
          //                   child: Container(
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //       ]
          //       )
          // )


          // Container(
          //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //     child: SizedBox(
          //       height: 75,
          //       width: 50,
          //       child: Container(
          //           decoration: BoxDecoration(
          //               color: const Color(0xffffffff),
          //               border: Border.all(
          //                 width: 2,
          //               ),
          //               borderRadius: BorderRadius.circular(2),
          //               boxShadow: const [
          //                 BoxShadow(
          //                   color: Colors.black,
          //                   offset: Offset(
          //                     1.0,
          //                     1.0,
          //                   ),
          //                   blurRadius: 5.0,
          //                   spreadRadius: 1.0,
          //                 ), //BoxShadow
          //                 BoxShadow(
          //                   color: Colors.white,
          //                   offset: Offset(0.0, 0.0),
          //                   blurRadius: 0.0,
          //                   spreadRadius: 0.0,
          //                 ), //BoxShadow
          //               ]),
          //           child: ListView(
          //             children: <Widget>[
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 //crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: <Widget>[
          //                   // Image.asset(
          //                   //   'assets/images/bhaisaab.jpg',
          //                   //   width: 34,
          //                   //   height: 44,
          //                   //   fit: BoxFit.cover,
          //                   // ),
          //                   Container(
          //                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //                       child: AnimSearchBar(
          //                         width: 320,
          //                         textController: textController,
          //                         onSuffixTap: () {
          //                           setState(() {
          //                             textController.clear();
          //                           });
          //                         },
          //                         color: Colors.white,
          //                         helpText: "Ask Bhaisaab...",
          //                         // onSubmitted: (text) => {
          //                         //   log("search text submiited"),
          //                         //   // todo: searchbar functionality
          //                         // },
          //                         //autoFocus: false,
          //                         //closeSearchOnSuffixTap: true,
          //                         //animationDurationInMilli: 2000,
          //                         //rtl: true,
          //                       ))
          //                 ],
          //               )
          //             ],
          //           )),
          //     ))
        ],
      ),
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
}