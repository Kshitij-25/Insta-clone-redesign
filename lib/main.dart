import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_redesign/Models/user_data.dart';
import 'package:insta_redesign/pages/feed_screen.dart';
import 'package:insta_redesign/pages/home_screen.dart';
import 'package:insta_redesign/pages/login_screen.dart';
import 'package:insta_redesign/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreen() {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => UserData(),
      child: ChangeNotifierProvider(
        builder: (context) => UserData(),
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: _getScreen(),
          routes: <String, WidgetBuilder>{
            '/LoginScreen': (BuildContext context) => new LoginScreen(),
            '/SignupScreen': (BuildContext context) => new SignupScreen(),
            '/FeedScreen': (BuildContext context) => new FeedScreen(),
          },
        ),
      ),
    );
  }
}
