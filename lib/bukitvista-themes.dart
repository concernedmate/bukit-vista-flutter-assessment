import 'package:flutter/material.dart';

class BukitVistaTheme {
  BukitVistaTheme._();

  static const Color kPrimaryColor = Color(0xff3c5c94);
  static const Color kSecondaryColor = Color(0xff2E2A61);
  static const Color background = Color(0xFFFFFFFF);

  static const Color white = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF27ae60);
  static const Color pending = Colors.yellow;
  static const Color inprogress = Colors.orange;
  static const Color error = Color(0xFFE21717);

  static const String fontName = 'Nunito';
  static const String secondFontName = 'Poppins';

  static const TextTheme textTheme = TextTheme(
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle button = TextStyle(
    fontFamily: secondFontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: white,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    //color: primaryColor
  );

  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 1.2,
    //color: darkText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18, //16
    letterSpacing: 0.18,
    //color: darkText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14, //14
    letterSpacing: -0.04,
    //color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16, //14
    letterSpacing: 0.2,
    //color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16, //16
    letterSpacing: -0.05,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12, //12
    letterSpacing: 0.2,
  );

}
