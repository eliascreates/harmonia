import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.android, size: 200, color: theme.colorScheme.secondary),
            Positioned(
              top: 20,
              child: Text(
                '- Harmonia -',
                style: textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
