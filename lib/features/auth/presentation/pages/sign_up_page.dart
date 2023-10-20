import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLogo(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Sign In', style: textTheme.headlineMedium),
          ),
          const SizedBox(height: 50),
          const SignUpForm(),
        ],
      ),
    );
  }
}
