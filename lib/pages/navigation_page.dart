import 'package:flutter/material.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/landing_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = '/about-me';

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _getCurrentPage(currentPage),
        Align(
          alignment: Alignment.bottomCenter,
          child: TitledBottomNavigationBar(
            activeColor: Colors.green,
            indicatorColor: Colors.green,
            inactiveStripColor: Colors.transparent,
            inactiveColor: Colors.green,
            enableShadow: true,
            currentIndex: currentPage,
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            items: [
              TitledNavigationBarItem(
                  title: Text("Home"),
                  icon: Icons.home,
                  backgroundColor: Colors.black.withOpacity(0.2)),
              TitledNavigationBarItem(
                  title: Text("About"),
                  icon: Icons.info,
                  backgroundColor: Colors.black.withOpacity(0.2)),
              TitledNavigationBarItem(
                  title: Text("Projects"),
                  icon: Icons.work,
                  backgroundColor: Colors.black.withOpacity(0.2)),
              TitledNavigationBarItem(
                  title: Text("Contact"),
                  icon: Icons.contact_mail,
                  backgroundColor: Colors.black.withOpacity(0.3)),
            ],
          ),
        ),
      ],
    ));
  }

  _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return LandingPage();
      case 1:
        return AboutPage();
      case 2:
        return ProjectPage();
      case 3:
        return ContactPage();
      default:
        return LandingPage();
    }
  }
}
