import 'package:flutter/material.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class AboutPage extends StatelessWidget {
  final String aboutMe =
      "I am a full-stack software developer and I enjoy solving problems with the help of a bit of code." +
          "\nAnother passion of mine is greek philosophy." +
          " I consider that understanding the human nature cotributes to a better interaction with people and also keeps me wanting to become a better version of myself." +
          "\nMy purpose is to create software that will help other people, and by helping I mean bringing them closer and also making their lives easier." +
          "\nI want to be able to share all the things I learned in my time as a developer and to empower younger people with the tools they need to create incredible software.";
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
          minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
      child: ResponsiveWidget(
        largeScreen: _buildForLargeScreen(context),
        mediumScreen: _buildForMediumScreen(context),
        smallScreen: _buildForSmallScreen(context),
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
                      'About me',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          aboutMe,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          overflow: TextOverflow.clip,
                        ),
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

  Widget _buildForMediumScreen(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        color: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'About me',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            aboutMe,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForSmallScreen(BuildContext context) {
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
                        'About me',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            aboutMe,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
