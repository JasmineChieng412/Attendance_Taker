import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dashboard_options.dart';
import 'onboarding_screens/introduction_screen1.dart';
import 'onboarding_screens/introduction_screen2.dart';
import 'onboarding_screens/introduction_screen3.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _controller = PageController();

  bool lastScreen = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged:(index){
              setState(() {
                lastScreen = (index ==2);
              });
            },
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),

          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text('skip'),
                  ),

                  SmoothPageIndicator(controller: _controller, count: 3),

                  lastScreen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context){
                              return DashboardOptions();
                            }
                        ),
                      );
                    },
                    child: Text('done'),
                  )
                  : GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,);
                    },
                    child: Text('next'),
                  ),
                ]


              ),
          ),
        ],
      ),

    );
  }
}
