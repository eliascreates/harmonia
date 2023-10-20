import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harmonia App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          primary: const Color(0xffbf564c),
          seedColor: const Color(0xffbf564c),
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
            backgroundColor: const MaterialStatePropertyAll(Color(0xffbf564c)),
            overlayColor: const MaterialStatePropertyAll(Color(0xffe5675b)),
          ),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          primary: const Color(0xffbf564c),
          seedColor: const Color(0xffbf564c),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            backgroundColor: const MaterialStatePropertyAll(Color(0xffbf564c)),
            overlayColor: const MaterialStatePropertyAll(Color(0xffe5675b)),
          ),
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: const SignInPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Placeholder());
  }
}
