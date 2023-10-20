import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        elevation: 6,
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          textColor: Theme.of(context).colorScheme.secondary,
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
}
