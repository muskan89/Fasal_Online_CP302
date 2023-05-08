import 'dart:async';
import 'dart:developer';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/govtscheme.dart';
import '../mandirate.dart';
import '../models/weather.dart';
import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:onlinefasal/Content/constants.dart';
import 'package:translator/translator.dart';

import 'chatmandi.dart';
import 'chatscheme.dart';

class ChatWeatherScreen extends StatefulWidget {
  const ChatWeatherScreen({Key? key}) : super(key: key);

  @override
  State<ChatWeatherScreen> createState() => _ChatWeatherScreenState();
}

class _ChatWeatherScreenState extends State<ChatWeatherScreen> {
  TextEditingController cityname = TextEditingController();
  final translator = GoogleTranslator();

  Future<Weather>? futureweather;

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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(0, 194, 146, 0.28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
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
                        ),
                        onTap: () {
                          log('Home button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/weather.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuildertr(
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
                              Image.asset('assets/images/Farming.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuildertr(
                                  "Farming", 'hi') : Text('Farming')

                            ],
                          ),
                          onTap: () {
                            log('farming button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const FarmingScreen()));
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
                                'assets/images/bhaisaab.jpg',
                                width: 34,
                                height: 44,
                                fit: BoxFit.cover,
                              ),

                              (language == 'Hindi') ?Text('आस्क भाईसाब') : Text('AskBhaisaab')
                            ],
                          ),
                        ),
                        onTap: () {
                          log('chat bot button pressed');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChatHomeScreen()),
                          );
                        },
                      ),
                    )
                    ,

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
                                    builder: (
                                        context) => const govtSchemeScreen()));
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/rupee-sign.png',
                                  height: 20, width: 20),
                              (language == 'Hindi') ? buildFutureBuildertr(
                                  "Mandi Rates", 'hi') : Text('Mandi Rates')
                            ],
                          ),
                          onTap: () {
                            log('mandi rates button pressed');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const MandiScreen()));
                          },
                        )),
                  ],
                ))
          ]),
          Container(
              alignment: Alignment.center,
              child: (futureweather == null)
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
                child: TextFormField(
                    controller: cityname,
                    decoration:  InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: (language == 'Hindi') ? 'शहर का नाम दर्ज करें ': 'Enter city name',
                      labelText: (language == 'Hindi') ? 'शहर का नाम ': 'City name',
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
              futureweather = getWeather(_text != '' ? _text : cityname.text);
            });
          },
          child: (language == 'Hindi') ? buildFutureBuildertr(
              "Tell about the weather", 'hi'): Text('get weather'),
        ),
      ],
    );
  }

  FutureBuilder<Weather> buildFutureBuilder() {
    return FutureBuilder<Weather>(
      future: futureweather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Weather? weather = snapshot.data;
          return Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      defaultColumnWidth: const FixedColumnWidth(220.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Location", 'hi'):Text('Location',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text(_text != '' ? _text : cityname.text,
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "City ID", 'hi'):Text('City ID',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.City_id}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Temperature", 'hi'):Text('Temperature',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.Temperature}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Feel like", 'hi'):Text('Feel like',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.feel_like}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Humidity", 'hi'):Text('Humidity',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.Humidity}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Atmospheric Pressure", 'hi'):Text('Atmospheric Pressure',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.atm_pressure}',
                                style: const TextStyle(fontSize: 15.0))
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Weather Report", 'hi'):Text('Weather Report',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.weth_Report}',
                                style: const TextStyle(fontSize: 15.0)),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children:  [
                            (language == 'Hindi') ? buildFutureBuilderans(
                                "Wind Speed", 'hi'):Text('Wind Speed',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 128, 128, 1.0),
                                    fontWeight: FontWeight.bold))
                          ]),
                          Column(children: [
                            Text('${weather?.wind_Speed}',
                                style: const TextStyle(fontSize: 15.0)),
                          ]),
                        ]),
                      ],
                    ),
                  )),
              //Text('Error: ${weather?.error}'),
              // Text('Location: ${cityname.text}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('City ID: ${weather?.City_id}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Temperature: ${weather?.Temperature}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Feel like: ${weather?.feel_like}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Humidity: ${weather?.Humidity}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Atmospheric Pressure: ${weather?.atm_pressure}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Weather Report: ${weather?.weth_Report}',
              //     style: const TextStyle(fontSize: 25.0)),
              // Text('Wind Speed: ${weather?.wind_Speed}',
              //     style: const TextStyle(fontSize: 25.0)),
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
  FutureBuilder<String> buildFutureBuildertr(textToTranslate, toLanguage){
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
  FutureBuilder<String> buildFutureBuildergr(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: const TextStyle(
              color: Color.fromRGBO(0, 128, 128, 1.0),
              fontSize: 20.0,
              fontWeight: FontWeight.bold));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
  FutureBuilder<String> buildFutureBuilderans(textToTranslate, toLanguage){
    return FutureBuilder<String>(
      future: translate(textToTranslate, toLanguage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,style: TextStyle(
              fontSize: 15.0,
              color: Color.fromRGBO(0, 128, 128, 1.0),
              fontWeight: FontWeight.bold));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
