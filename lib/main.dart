import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_redesign/pages/feed_screen.dart';
import 'package:insta_redesign/pages/login_screen.dart';
import 'package:insta_redesign/pages/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget _getScreen(){
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return FeedScreen();
          } else {
            return LoginScreen();
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:_getScreen(),
      routes: <String, WidgetBuilder>{
      '/LoginScreen': (BuildContext context) => new LoginScreen(),
      '/SignupScreen':(BuildContext context) => new SignupScreen(),
      '/FeedScreen' : (BuildContext context) => new FeedScreen(),
    },
    );
  }
}

