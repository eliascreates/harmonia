import 'package:flutter/material.dart';

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
            hintText: 'Password',
            onChanged: (password) {},
            suffixOnPressed: () {},
            fieldFocusNode: (currentNode: _passwordFocus, nextNode: null),
          ),
          const SizedBox(height: 40),
          AuthButton(onPressed: () {}, text: 'Sign In'),
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
