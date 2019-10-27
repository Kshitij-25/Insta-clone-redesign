import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  @override

  void initState() {
    super.initState();
    startTime();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/insta.png"),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}