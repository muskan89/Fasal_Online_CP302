import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:onlinefasal/models/mandiRate.dart';
import 'package:onlinefasal/askbhaisaab/chatmandi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(0, 194, 146, 0.28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/home.png',
                                height: 20, width: 20),
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
                          Image.asset('assets/images/weather.png',
                              height: 20, width: 20),
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
                          Image.asset('assets/images/Farming.png',
                              height: 20, width: 20),
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
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/govt_schemes.png',
                              height: 20, width: 20),
                          const Text('Govt.Scheme')
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
                          Image.asset('assets/images/rupee-sign.png',
                              height: 22, width: 22),
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
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(
                'assets/images/fasall.jpg',
                //width: 40,
                height: 200,
                fit: BoxFit.fill,
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 75,
                width: 50,
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ]),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Image.asset(
                            //   'assets/images/bhaisaab.jpg',
                            //   width: 34,
                            //   height: 44,
                            //   fit: BoxFit.cover,
                            // ),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AnimSearchBar(
                                  width: 320,
                                  textController: textController,
                                  onSuffixTap: () {
                                    setState(() {
                                      textController.clear();
                                    });
                                  },
                                  color: Colors.white,
                                  helpText: "Ask Bhaisaab...",
                                  onSubmitted: (text) => {
                                    log("search text submiited"),
                                    // todo: searchbar functionality
                                  },
                                  //autoFocus: false,
                                  //closeSearchOnSuffixTap: true,
                                  //animationDurationInMilli: 2000,
                                  //rtl: true,
                                ))
                          ],
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
