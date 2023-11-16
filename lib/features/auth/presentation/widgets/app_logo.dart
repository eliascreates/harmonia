import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/welcome.png',
        width: 200,
        height: 200,
      ),
    );
  }
}
