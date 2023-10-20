import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:harmonia/core/validators/validators.dart';

import '../sign_up_bloc/sign_up_bloc.dart';
import 'auth_button.dart';
import 'auth_toggle_button.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SignUpBloc, SignUpState>(
            buildWhen: (previous, current) => current.email != previous.email,
            builder: (context, state) {
              return EmailTextField(
                _emailController,
                onChanged: (email) => context.read<SignUpBloc>().add(
                      SignUpEmailChanged(email: email),
                    ),
                fieldFocusNode: (
                  currentNode: _emailFocus,
                  nextNode: _passwordFocus
                ),
                errorText: state.email.displayError?.message,
              );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return PasswordTextField(
                _passwordController,
                hintText: 'Password',
                onChanged: (password) => context.read<SignUpBloc>().add(
                      SignUpPasswordChanged(password: password),
                    ),
                suffixOnPressed: () => context.read<SignUpBloc>().add(
                      const SignUpPasswordObscureToggled(),
                    ),
                fieldFocusNode: (
                  currentNode: _passwordFocus,
                  nextNode: _confirmPasswordFocus
                ),
                isObscure: state.isPasswordObscure,
                errorText: state.password.displayError?.message,
              );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return PasswordTextField(
                _confirmPasswordController,
                hintText: 'Confirm Password',
                suffixOnPressed: () => context.read<SignUpBloc>().add(
                      const SignUpConfirmPasswordObscureToggled(),
                    ),
                onChanged: (confirmPassword) => context.read<SignUpBloc>().add(
                      SignUpConfirmPasswordChanged(
                        confirmPassword: confirmPassword,
                      ),
                    ),
                fieldFocusNode: (
                  currentNode: _confirmPasswordFocus,
                  nextNode: null
                ),
                isObscure: state.isConfirmPasswordObscure,
                errorText: state.confirmPassword.displayError?.message,
              );
            },
          ),
          const SizedBox(height: 25),
          AuthButton(
              onPressed: () {
                _emailFocus.unfocus();
                _passwordFocus.unfocus();
                _confirmPasswordFocus.unfocus();

                context.read<SignUpBloc>().add(
                      SignUpFormSubmitted(
                        email: _emailController.text,
                        password: _confirmPasswordController.text,
                      ),
                    );
              },
              text: 'Sign Up'),
          AuthToggleButton(
            onPressed: () => Navigator.of(context).pop(),
            question: "Have an account?",
            buttonText: 'Sign In',
          ),
        ],
      ),
    );
  }
}
