import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/core/functions/show_app_snack_bar.dart';

import 'package:harmonia/service_locator.dart' as di;

import '../../domain/domain.dart';
import '../sign_in_bloc/sign_in_bloc.dart';
import '../sign_up_bloc/sign_up_bloc.dart';
import '../widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        signUpWithEmailAndPassword: di.sl<SignUpWithEmailAndPassword>(),
        signInWithEmailAndPassword: di.sl<SignInWithEmailAndPassword>(),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              // After registration, pop to immediately show home page
              if (state.status == AuthStatus.authenticated) {
                Navigator.of(context).pop();
              }
            },
          ),
          BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              final errorMessage = state.errorMessage;
              if (state.status == SignUpStatus.failure &&
                  errorMessage != null) {
                showAppSnackBar(context, message: errorMessage);
              }
            },
          ),
        ],
        child: const SignUpView(),
      ),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state.status == SignUpStatus.loading) {
            return const Center(
              child: SizedBox.square(
                dimension: 50.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogo(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Sign Up', style: textTheme.headlineMedium),
                ),
                const SizedBox(height: 50),
                const SignUpForm(),
              ],
            ),
          );
        },
      ),
    );
  }
}
