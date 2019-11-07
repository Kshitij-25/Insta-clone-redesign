import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_redesign/Models/user_model.dart';
import 'package:insta_redesign/pages/edit_profile_screen.dart';

import 'package:insta_redesign/util/constant.dart';
import 'package:page_transition/page_transition.dart';

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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDoc(snapshot.data);
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                      size: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Text(
                        user.username,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                          ),
                          builder: (context) => Column(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: Container(
                                    color: Colors.grey,
                                    height: 5.0,
                                    width: 50.0,
                                  ),
                                ),
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.settings),
                                label: Text("Settings"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.settings_backup_restore),
                                label: Text("Archive"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.slow_motion_video),
                                label: Text("Your Activity"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.center_focus_weak),
                                label: Text("Nametag"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.bookmark_border),
                                label: Text("Saved"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.format_list_bulleted),
                                label: Text("Close Friends"),
                                onPressed: () {},
                              ),
                              Divider(
                                color: Colors.white30,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.person_add),
                                label: Text("Discover People"),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey,
                      backgroundImage: user.profileImageUrl.isEmpty
                          ? AssetImage('assets/images/placeholder.jpg')
                          : CachedNetworkImageProvider(user.profileImageUrl),
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
                      user.name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      user.bio,
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                child: Container(
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.downToUp,
                              child: EditProfileScreen()));
                    },
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
