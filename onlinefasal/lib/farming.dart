//import 'dart:developer';

import 'package:flutter/material.dart';

class FarmingScreen extends StatefulWidget {
  const FarmingScreen({Key? key}) : super(key: key);

  @override
  State<FarmingScreen> createState() => _FarmingScreenState();
}

class _FarmingScreenState extends State<FarmingScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: const LoginScreen(),

      body: Container(
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
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Image.asset('assets/images/bell.png'),
                        Image.asset('assets/images/user_logo.png'),
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
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/home.png',
                          ),
                          const Text('Home')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/weather.png'),
                          const Text('Weather')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/Farming.png'),
                          const Text('Farming')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/govt_schemes.png'),
                          const Text('Govt. Schemes')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/rupee-sign.png'),
                          const Text('Mandi Rates')
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
          Column(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(238, 255, 234, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/crop_logo.png',
                          ),
                          const Text('Crops')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/pesticide_logo.png'),
                          const Text('Pesticides')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/disease_logo.png'),
                          const Text('Diseases')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/fertilizer_logo.png'),
                          const Text('Fertilizer')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/soil_logo.png'),
                          const Text('Soil')
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        ],
      )),
    );
  }
}
