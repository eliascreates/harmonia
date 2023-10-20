import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/presentation/sign_in_bloc/sign_in_bloc.dart';
import 'package:harmonia/core/validators/validators.dart';
import '../pages/sign_up_page.dart';
import 'auth_button.dart';
import 'auth_toggle_button.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

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
          BlocBuilder<SignInBloc, SignInState>(
            buildWhen: (previous, current) => current.email != previous.email,
            builder: (context, state) {
              return EmailTextField(
                _emailController,
                onChanged: (email) => context.read<SignInBloc>().add(
                      SignInEmailChanged(email: email),
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
          BlocBuilder<SignInBloc, SignInState>(
            buildWhen: (previous, current) =>
                current.isObscurePassword != previous.isObscurePassword,
            builder: (context, state) {
              return PasswordTextField(
                _passwordController,
                hintText: 'Password',
                isObscure: state.isObscurePassword,
                onChanged: (password) => context.read<SignInBloc>().add(
                      SignInPasswordChanged(password: password),
                    ),
                suffixOnPressed: () => context.read<SignInBloc>().add(
                      const SignInObscureToggled(),
                    ),
                fieldFocusNode: (currentNode: _passwordFocus, nextNode: null),
              );
            },
          ),
          const SizedBox(height: 40),
          AuthButton(
              onPressed: () {
                _emailFocus.unfocus();
                _passwordFocus.unfocus();

                context.read<SignInBloc>().add(
                      SignInFormSubmitted(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
              },
              text: 'Sign In'),
          AuthToggleButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            ),
            question: "Don't have an account?",
            buttonText: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
