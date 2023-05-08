import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/models/mandiRate.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

import 'govtscheme.dart';
import 'package:onlinefasal/Content/constants.dart';
import 'package:translator/translator.dart';


class MandiScreen extends StatefulWidget {
  const MandiScreen({Key? key}) : super(key: key);

  @override
  State<MandiScreen> createState() => _MandiScreenState();
}

class _MandiScreenState extends State<MandiScreen> {
  TextEditingController cropname = TextEditingController();
  Future<MandiRate>? futuremandirate;
  final translator = GoogleTranslator();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {}
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

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
                                  Image.asset('assets/images/weather.png'),
                                  (language == 'Hindi') ? buildFutureBuildertrans(
                                      "Weather", 'hi') : Text('Weather')

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
                                  (language == 'Hindi') ? buildFutureBuildertrans(
                                      "Farming", 'hi') : Text('Farming')

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
                                    'assets/images/rupee-sign.png',
                                    height: 20,
                                    width: 20,
                                  ),(language == 'Hindi') ? buildFutureBuildertrans(
                                      "Mandi Rates", 'hi') : Text('Mandi Rates')
                                ],
                              ),
                            ),
                            onTap: () {
                              log('mandi rates button pressed');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MandiScreen()),
                              );
                            },
                          ),
                        ),

                      ],
                    ))
              ]),
              Container(
                  child: (futuremandirate == null)
                      ? buildColumn()
                      : buildFutureBuilder())
            ],
          )),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
                width: 300,
                child: TextField(
                    controller: cropname,
                    decoration:  InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: (language == 'Hindi') ? 'फसल का नाम दर्ज करें ': 'Enter the crop' ,
                      labelText: (language == 'Hindi') ? 'फसल का नाम': 'Crop name',
                    ))),
            AvatarGlow(
              animate: _isListening,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 20.0,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                onPressed: _listen,
                child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          reverse: true,
          child: Text(_text,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 194, 146, 1), fontSize: 25.0)),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futuremandirate =
                  getMandiRate(_text != '' ? _text : cropname.text);
            });
          },
          child:  (language == 'Hindi') ? buildFutureBuildertrans('get mandi rate','hi'): Text('get mandi rate'),
        ),
      ],
    );
  }

  FutureBuilder<MandiRate> buildFutureBuilder() {
    return FutureBuilder<MandiRate>(
      future: futuremandirate,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MandiRate? mandirate = snapshot.data;
          return Column(
            children: <Widget>[
          (language == 'Hindi') ? buildFutureBuildertransg('Mandi rates','hi'): Text('Mandi rates',
                  style: TextStyle(
                      fontSize: 25.0, color: Color.fromRGBO(0, 128, 128, 1.0))),
              // Text('${mandirate?.result}',
              //     style: const TextStyle(fontSize: 15.0)),
              Text('${mandirate?.errorr}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: (language == 'Hindi') ? buildFutureBuildertrans('${mandirate?.result}','hi'):Text('${mandirate?.result}',
                        style: const TextStyle(fontSize: 15.0)),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  Future<String> translate(String text, String toLanguage) async {
    var translation = await translator.translate(text, to: toLanguage);
    return translation.text;
  }
  FutureBuilder<String> buildFutureBuildertrans(textToTranslate, toLanguage){
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
  FutureBuilder<String> buildFutureBuildertransg(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(
              fontSize: 25.0, color: Color.fromRGBO(0, 128, 128, 1.0)));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
