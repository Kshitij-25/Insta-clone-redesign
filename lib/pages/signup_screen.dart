import 'package:flutter/material.dart';
import 'package:insta_redesign/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _username, _fullname;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _fullname, _username, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Instagram",
                style: TextStyle(
                    fontFamily: "Billabong",
                    color: Colors.white,
                    fontSize: 50.0),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Email address"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) => !input.contains('@')
                            ? 'Please enter a vaild Email address'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Full Name"),
                        keyboardType: TextInputType.text,
                        validator: (input) => input.trim().isEmpty
                            ? 'Enter a valid name'
                            : null,
                        onSaved: (input) => _fullname = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Username"),
                        keyboardType: TextInputType.text,
                        validator: (input) => input.trim().isEmpty
                            ? 'Enter a valid username'
                            : null,
                        onSaved: (input) => _username = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        validator: (input) => input.length < 6
                            ? 'The password you entered is incorrect. Please try again'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 350.0,
                      child: FlatButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        child: Text('Sign Up'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 30.0, right: 15.0),
                          child: Divider(
                            color: Colors.white,
                            height: 50,
                          )),
                    ),
                    Text("OR"),
                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 30.0),
                        child: Divider(
                          color: Colors.white,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 120.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text("Have an account?"),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/LoginScreen');
                        },
                        child: Text(
                          " Log In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
