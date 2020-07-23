import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            _currentPage = page;
            setState(() {});
          },
          children: <Widget>[
            buildPageContent(
                image: "assets/images/onboarding1.png",
                color: Color(0xFFFF7252),
                body: "Browse the menu and order directly from the application",
                isShowImgTop: false),
            buildPageContent(
                image: "assets/images/onboarding2.png",
                color: Colors.orange,
                body: "Browse the menu and order directly from the application",
                isShowImgTop: false),
            buildPageContent(
                image: "assets/images/onboarding3.png",
                color: Colors.blue,
                body: "Browse the menu and order directly from the application",
                isShowImgTop: false)
          ],
        ),
      ),
    );
  }

  Widget buildPageContent(
      {String image, String body, bool isShowImgTop, Color color}) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(image),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                height: 1.6,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
