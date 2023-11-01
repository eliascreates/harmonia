import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = theme.textTheme.titleMedium?.copyWith(
      color: theme.unselectedWidgetColor,
      fontWeight: FontWeight.w500,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20),
      child: Text(text, style: headerStyle),
    );
  }
}