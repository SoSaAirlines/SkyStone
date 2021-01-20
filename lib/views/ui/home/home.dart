import 'package:flutter/material.dart';
import 'package:rally_frontend/views/ui/home/feed.dart';
import 'package:rally_frontend/views/ui/home/find.dart';
import 'package:rally_frontend/views/ui/home/profile.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageViewState createState() => _HomePageViewState();
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