import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harmonia App Bar'),
      ),
      body: const Center(
        child: Text('Notifications Page'),
      ),
    );
  }
}
