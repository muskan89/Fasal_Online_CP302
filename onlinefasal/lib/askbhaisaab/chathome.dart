import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
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

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  TextEditingController textController = TextEditingController();
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
                  child: Text("Hello! BhaiSaab welcomes you on FasalOnline App",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                      "How can I help you? Please select category from the given options",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Weather',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        // With MaterialPageRoute, you can pass data between pages,
                        // but if you have a more complex app, you will quickly get lost.
                        MaterialPageRoute(
                          builder: (context) => const ChatMandiScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        elevation: 2, backgroundColor: Colors.brown),
                    child: const Text(
                      'Mandi Rate',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Vegetables',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Spices',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Schemes',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Communication',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Fruits',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Cereals',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
                      'Oilseeds',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(100, 10, 20, 10),
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
                    child: const Text(
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
}
