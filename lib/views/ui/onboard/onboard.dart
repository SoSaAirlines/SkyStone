import 'package:flutter/material.dart';
import 'package:rally_frontend/views/ui/onboard/onboard_page_one.dart';
import 'package:rally_frontend/views/ui/onboard/onboard_page_three.dart';
import 'package:rally_frontend/views/ui/onboard/onboard_page_two.dart';
import 'package:rally_frontend/views/utils/circle_bar.dart';

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
