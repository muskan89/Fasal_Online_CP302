import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/farming_crop.dart';

import 'askbhaisaab/chathome.dart';
import 'askbhaisaab/chatmandi.dart';
import 'askbhaisaab/chatscheme.dart';

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
                            height: 20,
                            width: 20,
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
                        Image.asset(
                          'assets/images/weather.png',
                          height: 20,
                          width: 20,
                        ),
                        const Text('Weather')
                      ],
                    ),
                    onTap: () {
                      log('weather button pressed');

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Weatherr()));
                    },
                  )),
                  Expanded(
                      child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/Farming.png',
                          height: 20,
                          width: 20,
                        ),
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
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(0, 0, 0, 0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/crop.png',
                        ),
                        const Text('Crops')
                      ],
                    ),
                    onTap: () {
                      log('crops button pressed');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FarmingCropScreen()));
                    },
                  ),
                  // ),
                  // Expanded(
                  //   child: InkWell(
                  //     child: Column(
                  //       children: <Widget>[
                  //         Image.asset('assets/images/pesticide_logo.png'),
                  //         const Text('Pests')
                  //       ],
                  //     ),
                  //     onTap: () {
                  //       log('pests button pressed');
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const FarmingPestScreen()));
                  //     },
                  //   ),
                  // ),
                  // Expanded(
                  //     child: InkWell(
                  //   child: Column(
                  //     children: <Widget>[
                  //       Image.asset('assets/images/disease_logo.png'),
                  //       const Text('Diseases')
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     log('diseases button pressed');
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const FarmingDiseaseScreen()));
                  //   },
                  // )),
                  // Expanded(
                  //   child: InkWell(
                  //     child: Column(
                  //       children: <Widget>[
                  //         Image.asset('assets/images/fertilizer_logo.png'),
                  //         const Text('Fertilizer')
                  //       ],
                  //     ),
                  //     onTap: () {
                  //       log('Fertilizers button pressed');
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const FarmingFertilizerScreen()));
                  //     },
                  //   ),
                  // ),
                  // Expanded(
                  //   child: InkWell(
                  //     child: Column(
                  //       children: <Widget>[
                  //         Image.asset('assets/images/soil_logo.png'),
                  //         const Text('Soil')
                  //       ],
                  //     ),
                  //     onTap: () {
                  //       log('Soil button pressed');
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const FarmingSoilScreen()));
                  //     },
                  //   ),
                  // ),
                ],
              ))
        ]),
      ]),
    );
  }
}
