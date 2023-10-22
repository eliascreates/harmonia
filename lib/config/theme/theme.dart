//Dark Mode canvas color = ff201919

import 'package:flutter/material.dart';

const darkBackgroundColor = Color(0xff201919);
const primaryColor = Color(0xffbf564c);
const accentColor = Color(0xffa13e38);
const overlayColor = Color(0xffe5675b);
const lightAppBarBackgroundColor = Color(0xfff8ecf0);
const darkAppBarBackgroundColor = Color(0xff312525);
const tertiaryColor = Color(0xff715a2e);

const poppinsFont = 'Poppins';

final tooltipTheme = TooltipThemeData(
  decoration: BoxDecoration(
    color: tertiaryColor,
    borderRadius: BorderRadius.circular(8.0),
  ),
);
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    foregroundColor: const MaterialStatePropertyAll(Colors.white),
    backgroundColor: const MaterialStatePropertyAll(primaryColor),
    overlayColor: const MaterialStatePropertyAll(overlayColor),
  ),
);

final appLightTheme = ThemeData(
  fontFamily: poppinsFont,
  appBarTheme: const AppBarTheme(backgroundColor: lightAppBarBackgroundColor),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: primaryColor,
    seedColor: primaryColor,
  ),
  tooltipTheme: tooltipTheme,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(color: Color(0xffa13e38)),
    titleLarge: TextStyle(color: Color(0xff775651)),
  ),
  elevatedButtonTheme: elevatedButtonTheme,
  useMaterial3: true,
);

final appDarkTheme = ThemeData(
  fontFamily: poppinsFont,
  appBarTheme: const AppBarTheme(backgroundColor: darkAppBarBackgroundColor),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    primary: primaryColor,
    seedColor: primaryColor,
  ),
  tooltipTheme: tooltipTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  useMaterial3: true,
);
