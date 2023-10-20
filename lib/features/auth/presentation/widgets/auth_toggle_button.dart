import 'package:flutter/material.dart';

class AuthToggleButton extends StatelessWidget {
  const AuthToggleButton({
    super.key,
    required this.onPressed,
    required this.question,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String question;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: textTheme.bodyMedium?.copyWith(
            color: theme.unselectedWidgetColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            buttonText,
            style: textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
