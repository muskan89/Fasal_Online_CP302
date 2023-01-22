import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/weather_screen.dart';
import 'package:onlinefasal/speech_text.dart';
import 'package:onlinefasal/DioPackage.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';




class ChatMandiScreen extends StatefulWidget {
  const ChatMandiScreen({Key? key}) : super(key: key);

  @override
  State<ChatMandiScreen> createState() => _ChatMandiScreenState();
}

class _ChatMandiScreenState extends State<ChatMandiScreen> {
  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      // Container(
      //     child:
      ListView(
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
                  child: Container(
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
                                          builder: (context) => LoginScreen()));
                                }),
                          ])),
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
                                  builder: (context) => HomeScreen()));
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
                        )
                    ),
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
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            //icon: const Icon(Icons.person),
                            hintText: 'Enter the crop name:',
                            labelText: 'Crop Name',
                          ),
                        ),

                        new Container(
                            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                            child: new RaisedButton(
                              child: const Text('Get Answer'),
                              color: Color.fromRGBO(0, 128, 128, 1.0),
                              onPressed: null,
                            )),

                      ],
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
}
