import 'package:flutter/material.dart';
import 'views/views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rally',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => LoginPage(title: 'Login'),
          '/signup': (BuildContext context) => SignUpPage(title: 'Sign Up'),
          '/issues': (BuildContext context) => IssuesPage(title: 'Issues'),
          '/onboard': (BuildContext context) =>
              OnboardPageView(title: 'Onboarding'),
          '/home': (BuildContext context) => HomePageView(title: 'Home'),
        });
  }
}









