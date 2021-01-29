import 'package:flutter/material.dart';
import 'dart:html' as html;

class AppRow extends StatelessWidget {
  final bool isLarge;
  final bool isMedium;
  final bool isSmall;
  //* Validator for buttons
  final bool hasIOs;
  final bool hasGoogle;
  final bool hasGithub;
  //* Strings for those buttons
  final String iosUrl;
  final String googleUrl;
  final String githubUrl;

  AppRow(
      {@required this.isLarge,
      @required this.isMedium,
      @required this.isSmall,
      this.hasIOs = false,
      this.hasGithub = false,
      this.hasGoogle = false,
      this.iosUrl,
      this.googleUrl,
      this.githubUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIOs
                ? InkWell(
                    onTap: () {
                      html.window.open(iosUrl, 'AppStore');
                    },
                    child: Image.asset(
                      'assets/images/social_media/appStore.png',
                      width: computeCorrectWidth(),
                      height: computeCorrectHeight(),
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            hasGoogle
                ? InkWell(
                    onTap: () {
                      html.window.open(googleUrl, 'GooglePlay');
                    },
                    child: Image.asset(
                      'assets/images/social_media/googlePlay.png',
                      width: computeCorrectWidth(),
                      height: computeCorrectHeight(),
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            isSmall
                ? Container()
                : hasGithub
                    ? InkWell(
                        onTap: () {
                          html.window.open(githubUrl, 'GitHub');
                        },
                        child: Image.asset(
                          'assets/images/social_media/github.png',
                          width: computeCorrectWidth(),
                          height: computeCorrectHeight(),
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    : Container()
          ],
        ),
        isSmall
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hasGithub
                      ? InkWell(
                          onTap: () {
                            print('ceva');
                          },
                          child: Image.asset(
                            'assets/images/social_media/github.png',
                            width: computeCorrectWidth(),
                            height: computeCorrectHeight(),
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : Container()
                ],
              )
            : Container()
      ],
    );
  }

  double computeCorrectWidth() {
    if (isSmall && !isMedium && !isLarge) {
      return 100;
    } else if (!isSmall && isMedium && !isLarge) {
      return 150;
    } else {
      return 200;
    }
  }

  double computeCorrectHeight() {
    if (isSmall && !isMedium && !isLarge) {
      return 40;
    } else if (!isSmall && isMedium && !isLarge) {
      return 50;
    } else {
      return 100;
    }
  }
}
