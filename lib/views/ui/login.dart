import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Username"),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("yay");
                        },
                        child: Text('Login')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text('Sign Up')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}