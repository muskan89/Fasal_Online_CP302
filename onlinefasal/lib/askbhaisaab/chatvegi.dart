import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:onlinefasal/api/api.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/login.dart';
import 'package:onlinefasal/models/dbresponse.dart';
import 'package:onlinefasal/dio_package.dart';
import 'package:onlinefasal/home.dart';
import 'package:onlinefasal/askbhaisaab/chathome.dart';

class ChatVegiScreen extends StatefulWidget {
  const ChatVegiScreen({Key? key}) : super(key: key);

  @override
  State<ChatVegiScreen> createState() => _ChatVegiScreenState();
}

class _ChatVegiScreenState extends State<ChatVegiScreen> {
  TextEditingController veginame = TextEditingController();
  TextEditingController querytype = TextEditingController();
  TextEditingController query = TextEditingController();
  TextEditingController category = TextEditingController();
  Future<DBResponse>? futureresponse;

  final _formKey = GlobalKey<FormState>();
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
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "Vegetable Names",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 1 for Ash Gourd",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 2 for Turnip",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 3 for Tomato",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 4 for Sweet Potato",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 5 for Squash Melon",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 6 for Sponge Gourd",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 7 for Spinach (Palak)",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 8 for Radish",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 9 for Rabi Onion(Pyaz)",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 10 for Pumpkin",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 11 for Potato",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 12 for Peas",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 13 for Okra",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 14 for Long Melon",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 15 for Lettuce",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 16 for Kharif Onion(Pyaz)",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 17 for Garlic",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 18 for Cucumber",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 19 for Chilli",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 20 for Cauliflower",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 21 for Carrot",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 22 for Beetroot",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 23 for Bitter Gourd",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 24 for Capsicum",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 25 for Cabbage",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 26 for Broccoli",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 27 for Brinjal",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Query Types",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 128, 128, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 1 for Cultural Practices",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 3 for Nutrient Management",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 4 for Fertilizer Uses",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 5 for Varieties",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 6 for Weed Management",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 7 for Seeds",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 10 for Water Management",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("Enter 11 for Plant Protection",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text("",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1.0), fontSize: 15.0)),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Form(
            //         key: _formKey,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             TextFormField(
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Scheme Name:',
            //                 labelText: 'Scheme Name',
            //               ),
            //             ),
            //
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Form(
            //         key: _formKey,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             TextFormField(
            //               controller: veginame,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter Vegetable Name:',
            //                 labelText: 'Vegetable Name',
            //               ),
            //             ),
            //             TextFormField(
            //               controller: querytype,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter query type:',
            //                 labelText: 'Query Type',
            //               ),
            //             ),
            //             TextFormField(
            //               controller: query,
            //               decoration: const InputDecoration(
            //                 //icon: const Icon(Icons.person),
            //                 hintText: 'Enter your query:',
            //                 labelText: 'Query',
            //               ),
            //             ),
            //             Container(
            //                 padding: const EdgeInsets.only(
            //                     left: 150.0, top: 40.0, bottom: 20.0),
            //                 child: ElevatedButton(
            //                   child: const Text('Get Answer'),
            //                   //color: Color.fromRGBO(0, 128, 128, 1.0),
            //                   onPressed: () {
            //                     log(veginame.text);
            //                     log(querytype.text);
            //                     log(query.text);
            //                   },
            //                 )),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ]),
          Container(
              alignment: Alignment.center,
              child: (futureresponse == null)
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
        TextField(
            controller: veginame,
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter the vegitable:',
              labelText: 'vegitable name',
            )),
        TextField(
            controller: querytype,
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter the querytype:',
              labelText: 'querytype',
            )),
        TextField(
            controller: query,
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter the query:',
              labelText: 'query',
            )),
        ElevatedButton(
          onPressed: () {
            setState(() {
              futureresponse =
                  getAnswer(veginame.text, query.text, querytype.text, '3');
            });
          },
          child: const Text('get answer'),
        ),
      ],
    );
  }

  FutureBuilder<DBResponse> buildFutureBuilder() {
    return FutureBuilder<DBResponse>(
      future: futureresponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          log("frontend");
          var string = snapshot.data?.Similar_score.toString();
          log(string!);
          DBResponse? dbResponse = snapshot.data;
          return Column(
            children: [
              Text('Vegitable : ${veginame.text}',
                  style: const TextStyle(fontSize: 25.0)),
              Text('Similar Score : ${dbResponse?.Similar_score}',
                  style: const TextStyle(fontSize: 25.0)),
              Text('Message : ${dbResponse?.Message}',
                  style: const TextStyle(fontSize: 25.0)),
              Text('Your Question : ${dbResponse?.Question}',
                  style: const TextStyle(fontSize: 25.0)),
              Text(
                  'Similar question that we find : ${dbResponse?.Question_Database}',
                  style: const TextStyle(fontSize: 25.0)),
              Text('Answer : ${dbResponse?.Answer}',
                  style: const TextStyle(fontSize: 25.0)),
              Text('Reference : ${dbResponse?.Reference}',
                  style: const TextStyle(fontSize: 25.0)),
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
