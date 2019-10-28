import 'package:flutter/material.dart';
import 'package:insta_redesign/util/constant.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  ProfileScreen({this.userId});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: usersRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
              return ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/images/pk.jpg"),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "8",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(color: Colors.white60),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "145",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(color: Colors.white60),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "193",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Following",
                                  style: TextStyle(color: Colors.white60),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Bio",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
              child: Container(
                child: OutlineButton(
                  onPressed: () {},
                  child: Text("Edit Profile"),
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
            ),
            Divider(
              color: Colors.white30,
            ),
          ],
        );
        },
      ),
    );
  }
}
