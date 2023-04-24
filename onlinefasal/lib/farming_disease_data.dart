import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/govtscheme.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:provider/provider.dart';
import 'package:onlinefasal/farming.dart';

import 'askbhaisaab/chathome.dart';
import 'askbhaisaab/chatmandi.dart';
import 'askbhaisaab/chatscheme.dart';
import 'mandirate.dart';

class FarmingDiseaseScreendata extends StatelessWidget {
  //const FarmingScreendata({Key? key}) : super(key: key);
  final int data;

  FarmingDiseaseScreendata({
    Key? key,
    //required Key key,
    required this.data,
  }) : super(key: key);
//   @override
//   State<FarmingScreendata> createState() => _FarmingScreendataState();
// }

//class _FarmingScreendataState extends State<FarmingScreendata> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final diseaseP = Provider.of<DiseaseProvider>(context);
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
                            const Text('Farming')
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
                                  builder: (context) => const govtSchemeScreen()));
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
                                  builder: (context) => const MandiScreen()));
                        },
                      )),
                ],
              ))
        ]),
        // Column(children: <Widget>[
        //   Container(
        //       decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(15)),
        //         color: Color.fromRGBO(238, 255, 234, 1),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Expanded(
        //             child: InkWell(
        //               child: Column(
        //                 children: <Widget>[
        //                   Image.asset(
        //                     'assets/images/crop_logo.png',
        //                   ),
        //                   const Text('Crops')
        //                 ],
        //               ),
        //               onTap: () {
        //                 log('crops button pressed');
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => const FarmingCropScreen()));
        //               },
        //             ),
        //           ),
        //           Expanded(
        //             child: InkWell(
        //               child: Column(
        //                 children: <Widget>[
        //                   Image.asset('assets/images/pesticide_logo.png'),
        //                   const Text('Pests')
        //                 ],
        //               ),
        //               onTap: () {
        //                 log('pests button pressed');
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => const FarmingPestScreen()));
        //               },
        //             ),
        //           ),
        //           Expanded(
        //               child: InkWell(
        //                 child: Column(
        //                   children: <Widget>[
        //                     Image.asset('assets/images/disease_logo.png'),
        //                     const Text('Diseases')
        //                   ],
        //                 ),
        //                 onTap: () {
        //                   log('diseases button pressed');
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => const FarmingDiseaseScreen()));
        //                 },
        //               )),
        //           Expanded(
        //             child: InkWell(
        //               child: Column(
        //                 children: <Widget>[
        //                   Image.asset('assets/images/fertilizer_logo.png'),
        //                   const Text('Fertilizer')
        //                 ],
        //               ),
        //               onTap: () {
        //                 log('Fertilizers button pressed');
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => const FarmingFertilizerScreen()));
        //               },
        //             ),
        //           ),
        //           Expanded(
        //             child: InkWell(
        //               child: Column(
        //                 children: <Widget>[
        //                   Image.asset('assets/images/soil_logo.png'),
        //                   const Text('Soil')
        //                 ],
        //               ),
        //               onTap: () {
        //                 log('Soil button pressed');
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => const FarmingSoilScreen()));
        //               },
        //             ),
        //           ),
        //         ],
        //       ))
        // ]),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 500, minHeight: 50),
          // child: ListView.builder(
          //     itemCount: cropP.crops.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return
          //         //ListTile(
          //         Expanded(
          //           child: Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.blueAccent,//remove color to make it transpatent
          //                   border: Border.all(
          //                       style: BorderStyle.solid,
          //                       color: Colors.white)),
          //               child: Center(child: Text(cropP.crops[index].name))),
          //         )
          //       //title: Text(cropP.crops[index].name),
          //       //subtitle: Text(cropP.crops[index].description),
          //       //)
          //           ;
          //     })
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  diseaseP.diseases[data].common_name,
                  style: const TextStyle(fontSize: 50),
                ),
                (diseaseP.diseases[data].disease_image.toString().isEmpty ||
                        diseaseP.diseases[data].disease_image.toString() == ",")
                    ? const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0))
                    : (Image.asset(
                        'assets/uploads/${diseaseP.diseases[data].disease_image}',
                        height: 100,
                        width: 100)),
                const Text(
                  "Symptoms: ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  diseaseP.diseases[data].symptoms,
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  "Type: ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  diseaseP.diseases[data].type,
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  "Measures: ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  diseaseP.diseases[data].measures,
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  "Scientific Name: ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  diseaseP.diseases[data].name,
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  "State: ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  diseaseP.diseases[data].state,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
