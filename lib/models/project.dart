import 'package:flutter/material.dart';

class Project {
  String title;
  String description;
  String shortDescription;
  bool hasGitHub;
  String githubUrl;
  bool hasGooglePlay;
  String googlePlayUrl;
  bool hasIOs;
  String iosUrl;
  String imagePath;
  double percentDone;
  List<String> codingLanguages;

  Project(
      {@required this.title,
      @required this.description,
      @required this.shortDescription,
      this.hasGitHub = false,
      this.githubUrl,
      this.hasGooglePlay = false,
      this.googlePlayUrl,
      this.hasIOs = false,
      this.iosUrl,
      @required this.imagePath,
      @required this.percentDone,
      @required this.codingLanguages});
}
