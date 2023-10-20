import 'package:flutter/material.dart';

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
          EmailTextField(
            _emailController,
            onChanged: (email) {},
            fieldFocusNode: (
              currentNode: _emailFocus,
              nextNode: _passwordFocus
            ),
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            _passwordController,
            suffixOnPressed: () {},
            onChanged: (password) {},
            hintText: 'Password',
            fieldFocusNode: (currentNode: _passwordFocus, nextNode: null),
          ),
          const SizedBox(height: 20),
          PasswordTextField(
            _confirmPasswordController,
            suffixOnPressed: () {},
            onChanged: (confirmPassword) {},
            hintText: 'Confirm Password',
            fieldFocusNode: (
              currentNode: _confirmPasswordFocus,
              nextNode: null
            ),
          ),
          const SizedBox(height: 25),
          AuthButton(onPressed: () {}, text: 'Sign In'),
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
