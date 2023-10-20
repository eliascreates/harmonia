import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
    this.passwordController, {
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.suffixOnPressed,
    required this.fieldFocusNode,
    this.errorText,
    this.isObscure = true,
  });

  final void Function(String)? onChanged;
  final VoidCallback suffixOnPressed;
  final TextEditingController passwordController;
  final ({FocusNode currentNode, FocusNode? nextNode}) fieldFocusNode;
  final bool isObscure;
  final String? errorText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('authForm_passwordTextField_textField'),
      controller: passwordController,
      onChanged: onChanged,
      onEditingComplete: () => fieldFocusNode.currentNode.unfocus(),
      focusNode: fieldFocusNode.currentNode,
      keyboardType: TextInputType.text,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          isSelected: isObscure,
          selectedIcon: const Icon(Icons.remove_red_eye_outlined),
          icon: const Icon(Icons.visibility_off_outlined),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorText: errorText,
      ),
    );
  }
}
