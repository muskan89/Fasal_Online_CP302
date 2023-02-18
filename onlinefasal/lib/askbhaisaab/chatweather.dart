import 'dart:async';
import 'dart:developer';
import 'package:onlinefasal/api/api.dart';
import '../models/weather.dart';
import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';

class ChatWeatherScreen extends StatefulWidget {
  const ChatWeatherScreen({Key? key}) : super(key: key);

  @override
  State<ChatWeatherScreen> createState() => _ChatWeatherScreenState();
}

class _ChatWeatherScreenState extends State<ChatWeatherScreen> {
  TextEditingController cityname = TextEditingController();
  Future<Weather>? futureweather;
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
                          Image.asset(
                            'assets/images/bhaisaab.jpg',
                            width: 34,
                            height: 44,
                            fit: BoxFit.cover,
                          ),
                          const Text('Ask Bhaisaab')
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
        TextFormField(
            controller: cityname,
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter the city',
              labelText: 'City name',
            )),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureweather = getWeather(cityname.text);
            });
          },
          child: const Text('get weather'),
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
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Table(
                      defaultColumnWidth: FixedColumnWidth(220.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow( children: [
                          Column(children:[Text('Location',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${cityname.text}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('City ID',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.City_id}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Temperature',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.Temperature}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Feel like',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.feel_like}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text(
                              'Humidity',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.Humidity}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Atmospheric Pressure',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.atm_pressure}',
                              style: const TextStyle(fontSize: 15.0))]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Weather Report',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.weth_Report}',
                              style: const TextStyle(fontSize: 15.0)),]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Wind Speed',
                              style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 128, 128, 1.0),
                                  fontWeight: FontWeight.bold))]),
                          Column(children:[Text('${weather?.wind_Speed}',
                              style: const TextStyle(fontSize: 15.0)),]),
                        ]),
                      ],
                    ),
                  )
              ),
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
}
