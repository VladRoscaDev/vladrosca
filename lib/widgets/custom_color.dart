import 'package:flutter/material.dart';

//? For the primary swatch to have a custom color we have to define our personal MaterialColor
//? Pentru culoarea: #750025
class CustomColor {
  static const Map<int, Color> color = {
    50: Color.fromRGBO(117, 0, 37, .1),
    100: Color.fromRGBO(117, 0, 37, .2),
    200: Color.fromRGBO(117, 0, 37, .3),
    300: Color.fromRGBO(117, 0, 37, .4),
    400: Color.fromRGBO(117, 0, 37, .5),
    500: Color.fromRGBO(117, 0, 37, .6),
    600: Color.fromRGBO(117, 0, 37, .7),
    700: Color.fromRGBO(117, 0, 37, .8),
    800: Color.fromRGBO(117, 0, 37, .9),
    900: Color.fromRGBO(117, 0, 37, 1),
  };

  static const MaterialColor customColor = MaterialColor(0xff750025, color);
}
