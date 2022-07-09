import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    primaryColor: const Color(0xff092955),
    scaffoldBackgroundColor: const Color(0xffeff3f4),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
    ),
  );
}
