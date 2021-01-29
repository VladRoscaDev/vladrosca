import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/data/projects.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/widgets/app_row.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class ProjectPage extends StatelessWidget {
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
      child: LayoutBuilder(builder: (context, constraints) {
        return _buildBody(context, constraints);
      }),
    );
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    List<Project> allProjects = Projects.allProjects;
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
      child: ResponsiveWidget(
        largeScreen: _buildForLargeScreen(context, allProjects),
        mediumScreen: _buildForMediumScreen(context, allProjects),
        smallScreen: _buildForSmallScreen(context, allProjects),
      ),
    );
  }

  _buildForLargeScreen(BuildContext context, List<Project> allProjects) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 6 / 3),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          elevation: 5.0,
          color: Colors.black.withOpacity(0.7),
          child: GridTile(
            footer:
                _buildGridTileFooterLargeScreen(allProjects, index, context),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 200,
                        child: Image(
                          image: AssetImage(allProjects[index].imagePath),
                          width: 40,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          allProjects[index].shortDescription,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
      itemCount: allProjects.length,
    );
  }

  Widget _buildGridTileFooterLargeScreen(
      List<Project> allProjects, int index, BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                new Text(
                  allProjects[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  width: 20,
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: allProjects[index].percentDone / 100,
                  animationDuration: 2500,
                  animation: true,
                  center: Text(
                    '${allProjects[index].percentDone}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  progressColor: Colors.green,
                ),
              ],
            ),
            RaisedButton(
              color: Colors.black.withOpacity(0.7),
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white, width: 2)),
              child: Row(
                children: [
                  Text(
                    'View more',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () {
                _showProjectDialog(context, allProjects[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  _showProjectDialog(BuildContext context, Project project) {
    print('IsLargeScreen:${ResponsiveWidget.isLargeScreen(context)}');
    print('Is medium screen:${ResponsiveWidget.isMediumScreen(context)}');
    print('Is small screen:${ResponsiveWidget.isSmallScreen(context)}');
    if (ResponsiveWidget.isLargeScreen(context)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildLargeScreenDialog(project, context);
          });
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildMediumScreenDialog(project, context);
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildSmallScreenDialog(project, context);
          });
    }
  }

  AlertDialog _buildLargeScreenDialog(Project project, BuildContext context) {
    print('Large screen dialog');
    return AlertDialog(
      backgroundColor: Colors.grey[900].withOpacity(0.9),
      title: Text(
        project.title,
        style: TextStyle(color: Colors.white),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Colors.white.withOpacity(0.7),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(project.imagePath),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 10.0,
                          percent: project.percentDone / 100,
                          animationDuration: 2500,
                          animation: true,
                          center: Text(
                            '${project.percentDone}%',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          progressColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: SingleChildScrollView(
                          child: Text(
                            project.description,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Coding languages used',
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: _getAllCodingLanguages(project, context),
                      )
                    ],
                  )
                ],
              ),
            ),
            AppRow(
              isLarge: ResponsiveWidget.isSmallScreen(context),
              isMedium: ResponsiveWidget.isMediumScreen(context),
              isSmall: ResponsiveWidget.isSmallScreen(context),
              hasIOs: project.hasIOs,
              hasGithub: project.hasGitHub,
              hasGoogle: project.hasGooglePlay,
              iosUrl: project.iosUrl,
              googleUrl: project.googlePlayUrl,
              githubUrl: project.githubUrl,
            )
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  GridView _getAllCodingLanguages(Project project, BuildContext context) {
    int crossAxisCount = 0;
    if (ResponsiveWidget.isLargeScreen(context)) {
      crossAxisCount = 4;
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 1;
    }
    return GridView.builder(
        itemCount: project.codingLanguages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0.1,
            crossAxisSpacing: 0.1,
            crossAxisCount: crossAxisCount,
            childAspectRatio: 4.4),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Icon(
                Icons.code,
                color: Colors.greenAccent,
              ),
              Text(
                project.codingLanguages[index],
                style: TextStyle(color: Colors.greenAccent, fontSize: 18),
              ),
            ],
          );
        });
  }

  AlertDialog _buildSmallScreenDialog(Project project, BuildContext context) {
    print('Small screen dialog');
    return AlertDialog(
      backgroundColor: Colors.grey[900].withOpacity(0.9),
      title: Text(
        project.title,
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(project.imagePath),
                    width: 50,
                    height: 100,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircularPercentIndicator(
                    radius: 60,
                    lineWidth: 5.0,
                    percent: project.percentDone / 100,
                    animationDuration: 2500,
                    animation: true,
                    center: Text(
                      '${project.percentDone}%',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    progressColor: Colors.green,
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              Column(
                children: [
                  Text(
                    project.description,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Coding languages used',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 7,
                    child: _getAllCodingLanguages(project, context),
                  ),
                  AppRow(
                    isLarge: ResponsiveWidget.isLargeScreen(context),
                    isMedium: ResponsiveWidget.isMediumScreen(context),
                    isSmall: ResponsiveWidget.isSmallScreen(context),
                    hasIOs: project.hasIOs,
                    hasGithub: project.hasGitHub,
                    hasGoogle: project.hasGooglePlay,
                    iosUrl: project.iosUrl,
                    googleUrl: project.googlePlayUrl,
                    githubUrl: project.githubUrl,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  AlertDialog _buildMediumScreenDialog(Project project, BuildContext context) {
    print('Medium screen dialog');
    return AlertDialog(
      backgroundColor: Colors.grey[900].withOpacity(0.9),
      title: Text(
        project.title,
        style: TextStyle(color: Colors.white),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Colors.white.withOpacity(0.7),
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
                    width: MediaQuery.of(context).size.width / 10,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(project.imagePath),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 10.0,
                          percent: project.percentDone / 100,
                          animationDuration: 2500,
                          animation: true,
                          center: Text(
                            '${project.percentDone}%',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: SingleChildScrollView(
                          child: Text(
                            project.description,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Coding languages used',
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: _getAllCodingLanguages(project, context),
                      )
                    ],
                  )
                ],
              ),
            ),
            AppRow(
              isLarge: ResponsiveWidget.isLargeScreen(context),
              isMedium: ResponsiveWidget.isMediumScreen(context),
              isSmall: ResponsiveWidget.isSmallScreen(context),
              hasIOs: project.hasIOs,
              hasGithub: project.hasGitHub,
              hasGoogle: project.hasGooglePlay,
              iosUrl: project.iosUrl,
              googleUrl: project.googlePlayUrl,
              githubUrl: project.githubUrl,
            )
          ],
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  _buildForMediumScreen(BuildContext context, List<Project> allProjects) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 6 / 3),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          elevation: 5.0,
          color: Colors.black.withOpacity(0.7),
          child: GridTile(
            footer:
                _buildGridTileFooterMediumScreen(allProjects, index, context),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 100,
                        child: Image(
                          image: AssetImage(allProjects[index].imagePath),
                          width: 40,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          allProjects[index].shortDescription,
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: allProjects.length,
    );
  }

  Widget _buildGridTileFooterMediumScreen(
      List<Project> allProjects, int index, BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  allProjects[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                CircularPercentIndicator(
                  radius: 40,
                  lineWidth: 5.0,
                  percent: allProjects[index].percentDone / 100,
                  animationDuration: 2500,
                  animation: true,
                  center: Text(
                    '${allProjects[index].percentDone}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  progressColor: Colors.green,
                )
              ],
            ),
            RaisedButton(
              color: Colors.black,
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white, width: 2)),
              child: Row(
                children: [
                  Text('View more', style: TextStyle(color: Colors.white)),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
              onPressed: () {
                _showProjectDialog(context, allProjects[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  _buildForSmallScreen(BuildContext context, List<Project> allProjects) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.1,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 6 / 3,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  elevation: 5.0,
                  color: Colors.black.withOpacity(0.7),
                  child: GridTile(
                    footer: _buildGridTileFooterSmallScreen(
                        allProjects, index, context),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 100,
                                child: Image(
                                  image:
                                      AssetImage(allProjects[index].imagePath),
                                  width: 40,
                                  height: 100,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Text(
                                  allProjects[index].shortDescription,
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.clip,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: allProjects.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridTileFooterSmallScreen(
      List<Project> allProjects, int index, BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  allProjects[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 5,
                  percent: allProjects[index].percentDone / 100,
                  animationDuration: 2500,
                  animation: true,
                  center: Text(
                    '${allProjects[index].percentDone}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  progressColor: Colors.green,
                ),
              ],
            ),
            RaisedButton(
              color: Colors.black.withOpacity(0.7),
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white, width: 2)),
              child: Row(
                children: [
                  Text(
                    'View more',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: () {
                _showProjectDialog(context, allProjects[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
