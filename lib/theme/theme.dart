import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryTextTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        // color: Colors.white
        color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        // color: Colors.white
        color: Colors.grey.shade700),
    headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        // color: Colors.white
        color: Colors.grey.shade500),
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade400,
  ),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    primaryTextTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          // color: Colors.white
          color: Colors.white),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey.shade300),
      headlineSmall: TextStyle(),
    ),
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.black,
      secondary: Colors.grey.shade500,
    ));
