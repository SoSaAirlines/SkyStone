import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your first name';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "First Name"),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your last name';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Last Name"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/issues');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
