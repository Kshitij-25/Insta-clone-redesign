import 'package:flutter/material.dart';
import 'package:insta_redesign/Models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _username = '';
  String _bio = '';
  String _email = '';
  String _phone = '';

  @override
  void initState() {
    super.initState();
    print(_name + "Kshitij");
    _name = widget.user.name;
    _username = widget.user.username;
    _bio = widget.user.bio;
    _email = widget.user.email;

  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String _profileImageUrl = '';
      User user = User(
          id: widget.user.id,
          name: _name,
          username: _username,
          bio: _bio,
          email: _email,
          profileImageUrl: _profileImageUrl);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text("Edit Profile"),
        ),
        elevation: 10.0,
        actions: <Widget>[
          FlatButton(
            onPressed: _submit,
            child: Text(
              "Done",
              style: TextStyle(color: Colors.blue, fontSize: 18.0),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/pk.jpg"),
                    ),
                    FlatButton(
                      onPressed: () {
                        print('changed');
                      },
                      child: Text(
                        "Change profile photo",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Divider(
                      color: Colors.white30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      initialValue: _name,
                      style: TextStyle(fontSize: 18.0),
                      validator: (input) => input.trim().length < 1
                          ? "Please enter a valid name"
                          : null,
                      onSaved: (input) => _name = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Username"),
                      initialValue: _username,
                      style: TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.text,
                      validator: (input) => input.trim().length < 1
                          ? "Please enter a valid username"
                          : null,
                      onSaved: (input) => _username = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Bio"),
                      initialValue: _bio,
                      style: TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.text,
                      validator: (input) => input.trim().length > 150
                          ? "Please enter a bio less than 150 characters"
                          : null,
                      onSaved: (input) => _bio = input,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Private Information",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      initialValue: _email,
                      style: TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => !input.contains('@')
                          ? "Please enter a valid email"
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Phone"),
                      initialValue: _phone,
                      style: TextStyle(fontSize: 18.0),
                      keyboardType: TextInputType.phone,
                      validator: (input) => input.trim().length != 10
                          ? "Please enter a valid phone number"
                          : null,
                      onSaved: (input) => _phone = input,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
