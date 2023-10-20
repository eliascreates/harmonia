import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
          const SizedBox(
            height: 50,
          ),
          const SignInForm(),
        ],
      ),
    );
  }
}
