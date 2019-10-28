import 'package:flutter/material.dart';
import 'package:insta_redesign/services/auth_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(),
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
}
