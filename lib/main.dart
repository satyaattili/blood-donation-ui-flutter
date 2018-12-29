import 'package:blooddonation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'montserrat'),
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: DashboardScreen(
          title: "iBlood",
        ),
        image: new Image.asset(
            'assets/image/iblood-logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print(""),
        loaderColor: Colors.red.shade800,
      ),
    );
  }
}
