import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPage createState() => _SignUpPage();
}

class HomePageView extends StatefulWidget {
  HomePageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Feed"),
      ),
    );
  }
}

class FindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Find"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}

class _HomePageViewState extends State<HomePageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  int currentPageValue = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeHomePage(int page) {
    currentPageValue = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> homeWidgetsList = <Widget>[
      FeedPage(),
      FindPage(),
      ProfilePage(),
    ];

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          itemCount: homeWidgetsList.length,
          onPageChanged: (int page) {
            changeHomePage(page);
          },
          controller: _controller,
          itemBuilder: (context, index) {
            return homeWidgetsList[index];
          },
        ),
      ],
    );
  }
}

class OnboardPageView extends StatefulWidget {
  OnboardPageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnboardPageViewState createState() => _OnboardPageViewState();
}

class _OnboardPageViewState extends State<OnboardPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  int currentPageValue = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeOnboardPage(int page) {
    currentPageValue = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> onboardWidgetsList = <Widget>[
      OnboardPageOne(),
      OnboardPageTwo(),
      OnboardPageThree(),
    ];
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          itemCount: onboardWidgetsList.length,
          onPageChanged: (int page) {
            changeOnboardPage(page);
          },
          controller: _controller,
          itemBuilder: (context, index) {
            return onboardWidgetsList[index];
          },
        ),
        Visibility(
          visible:
              currentPageValue == onboardWidgetsList.length - 1 ? false : true,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < onboardWidgetsList.length; i++)
                      if (i == currentPageValue) ...[circleBar(true)] else
                        circleBar(false),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible:
              currentPageValue == onboardWidgetsList.length - 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ],
    );
  }
}

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
      color: isActive ? Colors.blue : Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}

class OnboardPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Page 1"),
      ),
    );
  }
}

class OnboardPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Page 2"),
      ),
    );
  }
}

class OnboardPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page 3")),
    );
  }
}

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
