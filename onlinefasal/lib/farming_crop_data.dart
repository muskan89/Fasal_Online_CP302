import 'dart:developer';
import 'package:onlinefasal/govtscheme.dart';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:provider/provider.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/farming_disease.dart';
import 'package:onlinefasal/farming_pest.dart';
import 'package:onlinefasal/farming_soil.dart';
import 'package:onlinefasal/farming_fertilizer.dart';

import 'askbhaisaab/chathome.dart';
import 'askbhaisaab/chatmandi.dart';
import 'askbhaisaab/chatscheme.dart';
import 'mandirate.dart';

class FarmingCropScreendata extends StatelessWidget {
  //const FarmingScreendata({Key? key}) : super(key: key);
  final int data;

  FarmingCropScreendata({
    Key? key,
    //required Key key,
    required this.data,
  }) : super(key: key);
//   @override
//   State<FarmingScreendata> createState() => _FarmingScreendataState();
// }

//class _FarmingScreendataState extends State<FarmingScreendata> {
  TextEditingController textController = TextEditingController();
  final translator = GoogleTranslator();
  @override
  Widget build(BuildContext context)  {
    final cropP = Provider.of<CropProvider>(context);
    //var p=null;
    var cropnamehindi= translator.translate(cropP.crops[data].name, to: 'hi');


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
                        const Text('Pests')
                      ],
                    ),
                    onTap: () {
                      log('pests button pressed');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FarmingPestScreen(
                                  data: cropP.crops[data].id)));
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
                            builder: (context) => FarmingDiseaseScreen(
                                data: cropP.crops[data].id)));
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
                              builder: (context) => FarmingFertilizerScreen(
                                  data: cropP.crops[data].id)));
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
                              builder: (context) => FarmingSoilScreen(
                                  data: cropP.crops[data].id)));
                    },
                  ),
                ),
              ],
            ))
      ]),
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
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //(p==null)?translat(cropP.crops[data].name):
              // translat(cropP.crops[data].name).then((value) => {
              //   Text(value);
              // }),
              buildFutureBuilder(cropP.crops[data].name, 'hi'),
              Text(
                cropP.crops[data].name,
                //translat(cropP.crops[data].name) as Future<String>,
                style: const TextStyle(fontSize: 50),
              ),
              Image.asset('assets/uploads/${cropP.crops[data].cropimage}',
                  height: 100, width: 100),
              Text(
                cropP.crops[data].description,
                style: const TextStyle(fontSize: 20),
              ),
              buildFutureBuilder(cropP.crops[data].description,'hi'),
              const Text(
                "Species",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].species,
                style: const TextStyle(fontSize: 20),
              ),
              buildFutureBuilder(cropP.crops[data].species,'hi'),
              const Text(
                "Category",
                style: TextStyle(fontSize: 30),
              ),
              buildFutureBuilder(cropP.crops[data].category,'hi'),
              Text(
                cropP.crops[data].category,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Season",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].season,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Botanical name",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].botanical_name,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Genus",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].genus,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Family",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].family,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Origin",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].origin,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Synonym",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].synonym,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Rotations",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].rotations,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Average yield",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].average_yield,
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Minimum yield",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].yield_min.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                "Maximum yield",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                cropP.crops[data].yield_max.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      )
    ]));
  }
  // Future<String> translat(String eng) async{
  //   var hind= await translator.translate(eng, to: 'hi');
  //   var ty=hind.text;
  //   //return ty;
  //   // return Text(
  //   //   ty,
  //   //   style: const TextStyle(fontSize: 20),
  //   // );
  // }
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
