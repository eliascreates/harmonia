import 'package:flutter/material.dart';
import 'package:harmonia/features/auth/auth.dart';
import 'package:harmonia/main.dart';

extension AuthStatusX on AuthStatus {
  Widget get page {
    if (this case AuthStatus.authenticated) {
      return const HomePage();
    } else {
      return const SignInPage();
    }
  }
}