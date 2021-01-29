import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil instance = new ScreenUtil();
  double width;
  double height;
  bool allowFontScalling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;

  ScreenUtil(
      {this.width = 1080, this.height = 1920, this.allowFontScalling = false});

  static ScreenUtil getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get pixelRatio => _pixelRatio;

  static double get screenWidgthDp => _screenWidth;

  static double get screenHeightDp => _screenHeight;

  static double get screenWidth => _screenWidth * _pixelRatio;

  static double get screenHeight => _screenHeight * _pixelRatio;

  static double get bottomBarHeight => _bottomBarHeight;

  static double get statusBarHeight => _statusBarHeight;

  get scaleWidth => _screenWidth / instance.width;

  get scaleHeight => _screenHeight / instance.height;

  setHeight(double height) => height * scaleHeight;

  setWidth(double width) => width * scaleWidth;
}
