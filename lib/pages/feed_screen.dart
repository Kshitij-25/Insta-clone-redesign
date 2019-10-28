import 'package:flutter/material.dart';
import 'package:insta_redesign/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 10.0,
        actions: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo_camera),
                    iconSize: 30.0,
                    onPressed: () => print('Story'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      "Instagram",
                      style: TextStyle(fontSize: 35.0, fontFamily: "Billabong"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: IconButton(
                      icon: Icon(Icons.live_tv),
                      iconSize: 30.0,
                      onPressed: () => print('IGTV'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 30.0,
                    onPressed: () => print('Direct Messages'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(),
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
}
