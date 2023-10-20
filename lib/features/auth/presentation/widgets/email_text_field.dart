import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
    this.emailController, {
    super.key,
    required this.onChanged,
    required this.fieldFocusNode,
    this.errorText,
  });

  final TextEditingController emailController;
  final void Function(String)? onChanged;
  final ({FocusNode currentNode, FocusNode nextNode}) fieldFocusNode;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('signInForm_emailTextField_textField'),
      controller: emailController,
      onChanged: onChanged,
      onEditingComplete: () => FocusScope.of(context).requestFocus(
        fieldFocusNode.nextNode,
      ),
      focusNode: fieldFocusNode.currentNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: const Icon(Icons.alternate_email_rounded),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
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
