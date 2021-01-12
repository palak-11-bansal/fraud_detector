

import 'package:flutter/material.dart';
import 'package:fraud_detector/home_screen.dart';
import 'LoginScreen.dart';
import 'SplashScreen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraud Detector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),

      },
    );
  }
}
