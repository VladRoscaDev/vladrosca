import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/landing_page.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.dstATop))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(builder: (context, constraints) {
          return _buildBody(context, constraints);
        }));
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
      child: ResponsiveWidget(
        largeScreen: _buildForLargeScreen(),
        mediumScreen: _buildForMediumScreen(),
        smallScreen: _buildForSmallScreen(),
      ),
    );
  }

  Widget _buildForLargeScreen() {
    print('is large screen');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: TypewriterAnimatedTextKit(
              onFinished: () {},
              isRepeatingAnimation: false,
              speed: Duration(milliseconds: 150),
              onTap: () {
                print('tap event');
              },
              text: [
                "Hello, nice to meet you!",
                "My name is Rosca Vlad",
                "I'm a full-stack software engineer",
                "Come and meet me!"
              ],
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 30.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForMediumScreen() {
    print('is medium screen');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: TypewriterAnimatedTextKit(
              onFinished: () {},
              isRepeatingAnimation: false,
              speed: Duration(milliseconds: 150),
              onTap: () {
                print('tap event');
              },
              text: [
                "Hello, nice to meet you!",
                "My name is Rosca Vlad",
                "I'm a full-stack software engineer",
                "Come and meet me!"
              ],
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 20.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForSmallScreen() {
    print('is small screen');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: TypewriterAnimatedTextKit(
              onFinished: () {},
              isRepeatingAnimation: false,
              speed: Duration(milliseconds: 150),
              onTap: () {
                print('tap event');
              },
              text: [
                "Hello, nice to meet you!",
                "My name is Rosca Vlad",
                "I'm a full-stack software engineer",
                "Come and meet me!"
              ],
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 18.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
