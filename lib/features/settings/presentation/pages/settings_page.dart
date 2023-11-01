import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/auth.dart'
    show SignInBloc, SignOutRequested;
import 'package:harmonia/features/profile/profile.dart';
import 'package:harmonia/features/theme/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SettingsView(user);
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView(this.user, {super.key});

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          SignOutTile(
            userDisplayName: user.displayName,
            userEmail: user.email,
            userImageUrl: user.imageUrl,
          ),
          const SettingHeader('Preferences'),
          const Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ThemeToggle(),
          ),
          const SettingHeader('About'),
          SettingTile(
            title: 'Licenses',
            subtitle: 'Licenses of libraries used',
            onTap: () => showLicensePage(
              context: context,
              applicationIcon: Image.asset(
                'assets/images/waiting.png',
                width: 150,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              applicationName: 'Harmonia',
            ),
          ),
          SettingTile(
            title: 'Portfolio',
            subtitle: 'View other apps I built.',
            onTap: () => launchUrlString(
              'https://eliascreates.github.io/',
            ),
          ),
          SettingTile(
            title: 'Developed by Elias Kekana',
            // subtitle: 'Software Developer',
            onTap: () => launchUrlString(
              'https://github.com/eliascreates',
            ),
          ),
        ],
      ),
    );
  }
}

class SignOutTile extends StatelessWidget {
  const SignOutTile({
    super.key,
    required this.userDisplayName,
    required this.userEmail,
    required this.userImageUrl,
  });

  final String userDisplayName;
  final String userEmail;
  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_image.jpeg'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                userDisplayName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequested());
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
