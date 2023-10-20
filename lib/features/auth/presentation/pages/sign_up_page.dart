import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInView(),
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
          const SignUpForm(),
        ],
      ),
    );
  }
}
