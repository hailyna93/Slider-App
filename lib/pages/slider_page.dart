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
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                buildPageContent(
                    image: "assets/images/onboarding1.png",
                    color: Color(0xFFFF7252),
                    body:
                        "Browse the menu and order directly from the application",
                    isShowImgTop: false),
                buildPageContent(
                    image: "assets/images/onboarding2.png",
                    color: Colors.orange,
                    body:
                        "Browse the menu and order directly from the application",
                    isShowImgTop: true),
                buildPageContent(
                    image: "assets/images/onboarding3.png",
                    color: Colors.blue,
                    body:
                        "Browse the menu and order directly from the application",
                    isShowImgTop: false)
              ],
            ),
            Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < _totalPages; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                        Spacer(),
                        if (_currentPage != 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        if (_currentPage == 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Text(
                              "Start",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            )
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

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isCurrentPage ? 18 : 10,
      width: isCurrentPage ? 18 : 10,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
