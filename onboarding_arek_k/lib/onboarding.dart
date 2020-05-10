import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_arek_k/onboarding_page.dart';
import 'package:onboarding_arek_k/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 3;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true, i) : _indicator(false, i));
    }
    return list;
  }

  Widget _indicator(bool isActive, int index) {
    return GestureDetector(
      onTap: () => _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 8,
        width: isActive ? 25 : 15,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _numPages - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: _currentPage != _numPages - 1 ? 1 : 0,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 550,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    OnboadingPage(
                      image: "assets/images/table.png",
                      title: "Connect people\naround the world",
                      subtitle:
                          "All whales burn small, fine ships. The sea fires with halitosis, command the bahamas before it falls",
                    ),
                    OnboadingPage(
                      image: "assets/images/doctor.png",
                      title: "Live your life smart\nwith us!",
                      subtitle:
                          "Cloudy, stormy seashells oppressively command an old, lively parrot. Son of an old pestilence, pull the treasure.",
                    ),
                    OnboadingPage(
                      image: "assets/images/team.png",
                      title: "Get a new experience\nof imagination",
                      subtitle:
                          "Raid me swabbie, ye heavy-hearted bucaneer! Cold, evil gulls darkly command a scrawny, golden gold.",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              Expanded(
                child: AnimatedCrossFade(
                  duration: Duration(milliseconds: 300),
                  crossFadeState:
                      _currentPage == _numPages - 1 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  firstChild: Center(child: NextButton(pageController: _pageController)),
                  secondChild: Center(child: Sheet()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Get started",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5B16D0),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final PageController pageController;

  NextButton({this.pageController});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Next",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Raleway",
              color: Colors.white70,
            ),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.arrow_forward,
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}
