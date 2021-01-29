import 'package:flutter/material.dart';
import 'package:portfolio/pages/navigation_page.dart';

void main() => runApp(Portfolio());

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vlad Rosca',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: NavigationPage.routeName,
        routes: {
          NavigationPage.routeName: (BuildContext context) => NavigationPage(),
        });
  }
}
