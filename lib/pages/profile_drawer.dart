import 'package:flutter/material.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
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
        ),
      ),
    );
  }
}
