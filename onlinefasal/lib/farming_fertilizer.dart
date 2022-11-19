import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/DioPackage.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/farming_fertilizer_data.dart';
import 'package:provider/provider.dart';
import 'package:onlinefasal/farming_disease.dart';
import 'package:onlinefasal/farming_crop.dart';
import 'package:onlinefasal/farming_pest.dart';
import 'package:onlinefasal/farming_soil.dart';
import 'package:onlinefasal/farming_fertilizer.dart';


class FarmingFertilizerScreen extends StatefulWidget {
  const FarmingFertilizerScreen({Key? key}) : super(key: key);

  @override
  State<FarmingFertilizerScreen> createState() => _FarmingFertilizerScreenState();
}

class _FarmingFertilizerScreenState extends State<FarmingFertilizerScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final fertilizerP = Provider.of<FertilizerProvider>(context);
    return Scaffold(
      //body: const LoginScreen(),

      body: Container(
          child: ListView(children: <Widget>[
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
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(238, 255, 234, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/crop_logo.png',
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
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/pesticide_logo.png'),
                              const Text('Pests')
                            ],
                          ),
                          onTap: () {
                            log('pests button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FarmingPestScreen()));
                          },
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/images/disease_logo.png'),
                                const Text('Diseases')
                              ],
                            ),
                            onTap: () {
                              log('diseases button pressed');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FarmingDiseaseScreen()));
                            },
                          )),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/fertilizer_logo.png'),
                              const Text('Fertilizer')
                            ],
                          ),
                          onTap: () {
                            log('Fertilizers button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FarmingFertilizerScreen()));
                          },
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/soil_logo.png'),
                              const Text('Soil')
                            ],
                          ),
                          onTap: () {
                            log('Soil button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FarmingSoilScreen()));
                          },
                        ),
                      ),
                    ],
                  ))
            ]),
            ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 500, minHeight: 50),
                child: ListView.builder(
                    itemCount: fertilizerP.fertilizers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        //ListTile(
                        Expanded(
                            child: InkWell(
                              child: Container(
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
                                  decoration: BoxDecoration(
                                      color: Colors.teal,//remove color to make it transpatent

                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.white)),
                                  child: Center(child: Text(fertilizerP.fertilizers[index].trade_name))),

                              onTap: () {
                                log('farming button pressed');
                                Navigator.of(context).push(
                                  // With MaterialPageRoute, you can pass data between pages,
                                  // but if you have a more complex app, you will quickly get lost.
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FarmingFertilizerScreendata(data: index),
                                  ),
                                );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const FarmingScreendata()));
                              },
                            )
                        )
                      //title: Text(cropP.crops[index].name),
                      //subtitle: Text(cropP.crops[index].description),
                      //)
                          ;
                    }))
          ])),
    );
  }
}
