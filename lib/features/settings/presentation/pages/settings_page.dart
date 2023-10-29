import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/auth.dart';
// import 'package:harmonia/features/theme/theme.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((SignInBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_image.jpeg'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Elijoy',
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
          ),
          const SettingHeader('Preferences'),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SwitchListTile(
              onChanged: (_) {},
              value: true,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text('Light Theme'),
              secondary: const AnimatedRotation(
                turns: true ? 1 : 0,
                duration: Duration(milliseconds: 1200),
                child: AnimatedCrossFade(
                  firstChild: Icon(Icons.light_mode),
                  secondChild: Icon(Icons.dark_mode),
                  firstCurve: Curves.easeInOutSine,
                  secondCurve: Curves.easeInOutSine,
                  crossFadeState: true
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1100),
                ),
              ),
            ),
          ),
          const SettingHeader('About'),
          SettingLinkTile(
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
          SettingLinkTile(
            title: 'Portfolio',
            subtitle: 'View other apps I built.',
            onTap: () {
              //   => launchUrlString(
              //   'https://eliascreates.github.io/',
              // )
            },
          ),
          SettingLinkTile(
            title: 'Developed by Elias Kekana',
            // subtitle: 'Software Developer',
            onTap: () {
              //   => launchUrlString(
              //   'https://github.com/eliascreates',
              // )
            },
          ),
        ],
      ),
    );
  }
}

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

class SettingLinkTile extends StatelessWidget {
  const SettingLinkTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle = '',
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        onTap: onTap,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(title),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing:
            onTap != null ? const Icon(Icons.arrow_forward_ios_rounded) : null,
      ),
    );
  }
}
