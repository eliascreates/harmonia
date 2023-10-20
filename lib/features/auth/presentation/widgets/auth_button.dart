import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 56.0)),
      ),
      child: Text(text, style: textStyle?.copyWith(color: Colors.white)),
    );
  }
}
