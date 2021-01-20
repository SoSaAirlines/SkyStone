import 'package:flutter/material.dart';

class IssuesPage extends StatelessWidget {
  IssuesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboard');
                },
                child: Text('Issues')),
          ],
        ),
      ),
    );
  }
}
