import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:harmonia/core/functions/show_app_snack_bar.dart';

import '../sign_in_bloc/sign_in_bloc.dart';
import '../widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        final errorMessage = state.errorMessage;
        if (state.submissionStatus == FormzSubmissionStatus.failure &&
            errorMessage != null) {
          showAppSnackBar(context, message: errorMessage);
        }
      },
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Sign In', style: textTheme.headlineMedium),
            ),
            const SizedBox(height: 50),
            const SignInForm(),
          ],
        ),
      ),
    );
  }
}
