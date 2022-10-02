import 'dart:developer';

import 'package:flutter/material.dart';
//import 'sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fasal online',
      theme: ThemeData(
        primarySwatch : Colors.teal,
      ),
      home: Scaffold(
        body: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 80, 10, 20),
                child: Image.asset(
                  'assets/images/favicon.png',
                  width: 34,
                  height: 44,
                  fit: BoxFit.cover,
                )
              )
              ,Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 80, 10, 20),
              child: const Text(
                'Fasal Online',
                style: TextStyle(
                    color: Color(0xFF00c292),
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            )],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username/e-mail id',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(

                child: const Text('Login'),
                onPressed: () {
                  log(nameController.text);
                  log(passwordController.text);
                  log('Logged in Successful!!');
                },
              ),
            ),
            TextButton(
              onPressed: () {
                //  forget password screen have to make
                log('forgot password button pressed ');
              },
              child: const Text('Forgot Password'),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have an account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen have to make
                    // onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (_) => const SignUp());
                    // },
                    log('sign up button pressed');
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
    );
  }
}