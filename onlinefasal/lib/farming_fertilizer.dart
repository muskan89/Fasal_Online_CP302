import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/govtscheme.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/farming_fertilizer_data.dart';
import 'package:provider/provider.dart';
import 'package:onlinefasal/farming_disease.dart';
import 'package:onlinefasal/farming_pest.dart';
import 'package:onlinefasal/farming_soil.dart';

import 'askbhaisaab/chathome.dart';
import 'askbhaisaab/chatmandi.dart';
import 'askbhaisaab/chatscheme.dart';
import 'mandirate.dart';
import 'package:onlinefasal/Content/constants.dart';
import 'package:translator/translator.dart';

class FarmingFertilizerScreen extends StatelessWidget {
  //const FarmingFertilizerScreen({Key? key}) : super(key: key);
  final int data;

  FarmingFertilizerScreen({
    Key? key,
    //required Key key,
    required this.data,
  }) : super(key: key);
//   @override
//   State<FarmingFertilizerScreen> createState() => _FarmingFertilizerScreenState();
// }
//
// class _FarmingFertilizerScreenState extends State<FarmingFertilizerScreen> {
  TextEditingController textController = TextEditingController();
  final translator = GoogleTranslator();
  @override
  Widget build(BuildContext context) {
    final fertilizerP = Provider.of<FertilizerProvider>(context);
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
                          (language == 'Hindi') ? Text('होम') : Text('Home')

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
                            (language == 'Hindi') ? buildFutureBuilder(
                                "Weather", 'hi') : Text('Weather')

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
                              'assets/images/Farming.png',
                              height: 20,
                              width: 20,
                            ),
                            (language == 'Hindi') ? buildFutureBuilder(
                                "Farming", 'hi') : Text('Farming')
                          ],
                        ),
                      ),
                      onTap: () {
                        log('farming button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FarmingScreen()),
                        );
                      },
                    ),
                  ),

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
                                  builder: (context) => const ChatHomeScreen()));
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
                                  builder: (context) => const govtSchemeScreen()));
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
                                  builder: (context) => const MandiScreen()));
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
                  // Expanded(
                  //   child: InkWell(
                  //     child: Column(
                  //       children: <Widget>[
                  //         Image.asset(
                  //           'assets/images/crop_logo.png',
                  //         ),
                  //         const Text('Crops')
                  //       ],
                  //     ),
                  //     onTap: () {
                  //       log('crops button pressed');
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const FarmingCropScreen()));
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/pesticide_logo.png'),
                          (language=='Hindi')?buildFutureBuilder("Pests",'hi'): Text('Pests')
                        ],
                      ),
                      onTap: () {
                        log('pests button pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FarmingPestScreen(data: data)));
                      },
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/disease_logo.png'),
                        (language=='Hindi')?buildFutureBuilder("Diseases",'hi'): Text('Diseases')
                      ],
                    ),
                    onTap: () {
                      log('diseases button pressed');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FarmingDiseaseScreen(data: data)));
                    },
                  )),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.lightGreen.withOpacity(0.5),
                              Colors.lightGreen.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/fertilizer_logo.png'),
                            (language=='Hindi')?buildFutureBuilder("Fertilizer",'hi'): Text('Fertilizer')
                          ],
                        ),
                      ),
                      onTap: () {
                        log('Fertilizers button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FarmingFertilizerScreen(data: data)),
                        );
                      },
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/soil_logo.png'),
                          (language=='Hindi')?buildFutureBuilder("Soil",'hi'): Text('Soil')
                        ],
                      ),
                      onTap: () {
                        log('Soil button pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FarmingSoilScreen(data: data)));
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
                      //Expanded(
                      (fertilizerP.fertilizers[index].crop_id == data)
                          ? InkWell(
                              child: Container(
                                  height: 80,
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  decoration: BoxDecoration(
                                      color: Colors
                                          .teal, //remove color to make it transpatent

                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.white)),
                                  child: Center(
                                      child: (language=='Hindi')?buildFutureBuilder(fertilizerP.fertilizers[index].trade_name,'hi'):Text(fertilizerP
                                          .fertilizers[index].trade_name))),
                              onTap: () {
                                log('farming button pressed');
                                Navigator.of(context).push(
                                  // With MaterialPageRoute, you can pass data between pages,
                                  // but if you have a more complex app, you will quickly get lost.
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FarmingFertilizerScreendata(
                                            data: index),
                                  ),
                                );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const FarmingScreendata()));
                              },
                            )
                          : Container()
                      //)
                      //title: Text(cropP.crops[index].name),
                      //subtitle: Text(cropP.crops[index].description),
                      //)
                      ;
                }))
      ]),
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
