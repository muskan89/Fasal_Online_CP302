import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/home.dart';
import 'dart:developer';

import 'package:onlinefasal/login.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
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
                      color: Color.fromRGBO(0, 194, 146, 1), fontSize: 25.0)),
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
                                  builder: (context) => const LoginScreen()));
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
                            builder: (context) => const WeatherScreen()));
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
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Please Grant Permission for location Access',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Image.asset('assets/images/location_logo.png'),
                ]),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: const Text(
                    'Share Your Location',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    log('button for granting location access pressed');
                  },
                ))
          ])
    ]));
  }
}
