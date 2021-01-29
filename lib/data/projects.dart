import 'package:portfolio/models/project.dart';

class Projects {
  static final myProjects = [
    new Project(
        title: 'EAB',
        shortDescription:
            'A tool designed to help a rough estimation of medical data.',
        description: 'A tool designed to help a rough estimation of some data',
        imagePath: 'assets/images/projects/medical-app.png',
        percentDone: 100.0,
        hasGitHub: false,
        hasGooglePlay: true,
        googlePlayUrl:
            'https://play.google.com/store/apps/details?id=com.VladRoscaDev.EAB',
        hasIOs: false,
        codingLanguages: ['Dart', 'JSON']),
    new Project(
        title: 'CovidInfo',
        shortDescription:
            'This app was created in order to provider statistics in real-time for the COVID-19 pandemic.',
        description: 'This app was created in order to provider statistics in real-time for the COVID-19 pandemic. As of the current times, the world should have access to information fast at any time. The app intends to spread awareness and also the means of protection against the current threat.',
        imagePath: 'assets/images/projects/covidInfo.png',
        percentDone: 100,
        hasGitHub: true,
        githubUrl: 'https://github.com/VladRoscaDev/CovidInfo',
        hasGooglePlay: false,
        hasIOs: false,
        codingLanguages: ['Dart', 'JSON']),
    new Project(
        title: 'FreeDays',
        shortDescription:
            'An app that help you take advantage of the anually free days and have an overview of all of you vacations.',
        description: 'An app that help you take advantage of the anually free days and have an overview of all of you vacations. Also the app helps by storing information locally on your device about your estimated spendings to provide an overview of your financial investments in vacations',
        imagePath: 'assets/images/projects/free_days.png',
        percentDone: 30,
        hasGitHub: false,
        hasGooglePlay: false,
        hasIOs: false,
        codingLanguages: ['Dart', 'JSON']),
    new Project(
        title: 'Memocar',
        shortDescription:
            'This app is created for those of us that constantly forget about all the paperwork that needs to be done for our car.',
        description: 'This app is created for those of us that constantly forget about all the paperwork that needs to be done for our car. It also provides notification at a specified time so that you can take care of your car and keep it in perfect conditions.',
        imagePath: 'assets/images/projects/memocar.png',
        percentDone: 100,
        hasGitHub: false,
        hasGooglePlay: true,
        googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.personal.VladRoscaDev',
        hasIOs: false,
        codingLanguages: ['Dart', 'SQL', 'JSON']),
    new Project(
        title: 'Personal portfolio',
        shortDescription: 'My personal portfolio',
        description:
            'I wanted to create a website using Flutter and making my own portfolio was a great way to experiment this. The app is compatible with Android and IOs, and is also a Progressive-Web-App',
        imagePath: 'assets/images/projects/portfolio.png',
        percentDone: 100,
        hasGitHub: true,
        githubUrl: 'https://github.com/VladRoscaDev/vladrosca',
        hasIOs: false,
        hasGooglePlay: false,
        codingLanguages: ['Dart', 'JSON', 'JS', 'HTML', 'CSS']),
  ];

  static List<Project> get allProjects {
    return [...myProjects];
  }
}
