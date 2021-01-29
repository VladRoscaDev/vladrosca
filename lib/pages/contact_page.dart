import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/services/mail_service.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/landing_page.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return _buildBody(context, constraints);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: constraints.maxHeight, minWidth: constraints.maxWidth),
      child: ResponsiveWidget(
        largeScreen: _buildForLargeScreen(context),
        mediumScreen: _buildForMediumScreen(context),
        smallScreen: _buildForSmallScreen(context),
      ),
    );
  }

  Widget _buildForSmallScreen(context) {
    return Center(
      child: Card(
        elevation: 5.0,
        color: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 1.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text('Vlad Rosca'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.7),
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Feel free to contact me if you want me to help you, or you want some guidance.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SelectableText(
                      'vladrosca93@gmail.com',
                      cursorColor: Colors.white,
                      showCursor: true,
                      toolbarOptions: ToolbarOptions(
                          copy: true,
                          selectAll: true,
                          cut: false,
                          paste: false),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForMediumScreen(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        color: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.7),
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 2,
                      color: Colors.transparent,
                      child: CircleAvatar(
                        child: Text('Vlad Rosca'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    'Feel free to contact me if you want me to help you, or you want some guidance.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              SelectableText(
                                'vladrosca93@gmail.com',
                                cursorColor: Colors.white,
                                showCursor: true,
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForLargeScreen(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        color: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contact',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.7),
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 2,
                      color: Colors.transparent,
                      child: CircleAvatar(
                        child: Text('Vlad Rosca'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Feel free to contact me if you want me to help you, or you want some guidance.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              SelectableText(
                                'vladrosca93@gmail.com',
                                cursorColor: Colors.white,
                                showCursor: true,
                                toolbarOptions: ToolbarOptions(
                                    copy: true,
                                    selectAll: true,
                                    cut: false,
                                    paste: false),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
