//Dark Mode canvas color = ff201919

import 'package:flutter/material.dart';

const darkBackgroundColor = Color(0xff201919);
const primaryColor = Color(0xffbf564c);
const accentColor = Color(0xffa13e38);
const overlayColor = Color(0xffe5675b);

final appLightTheme = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: primaryColor,
    seedColor: primaryColor,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Color(0xffa13e38)),
    titleLarge: TextStyle(color: Color(0xff775651)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(primaryColor),
      overlayColor: const MaterialStatePropertyAll(overlayColor),
    ),
  ),
  useMaterial3: true,
);

final appDarkTheme = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    primary: primaryColor,
    seedColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(primaryColor),
      overlayColor: const MaterialStatePropertyAll(overlayColor),
    ),
  ),
  useMaterial3: true,
);
