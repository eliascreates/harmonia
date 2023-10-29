import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/auth.dart';
import '../../domain/domain.dart';
import '../cubit/profile_cubit.dart';
import 'package:harmonia/features/settings/presentation/pages/settings_page.dart';
import 'package:harmonia/service_locator.dart' as di;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((SignInBloc bloc) => bloc.state.user);
    debugPrint('XXXXXXXXXXXXXXXXXXXXX${user.email} - id: ${user.uid}');
    return BlocProvider(
      create: (context) => ProfileCubit(
        getUserById: di.sl<GetUserById>(),
      )..init(userId: user.uid),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileCubit cubit) => cubit.state.user);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary, size: 27),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
            icon: const Icon(Icons.settings_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ProfileSection(),
          ),
          Text(
            user.displayName.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('4658', style: theme.textTheme.bodyLarge),
              const Text('Followers'),
            ],
          ),
          SizedBox.square(
            dimension: 115,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_image.jpeg'),
                ),
                Positioned.fill(
                  child: Transform.flip(
                    flipX: true,
                    child: CircularProgressIndicator(
                      value: 0.8,
                      color: theme.colorScheme.primaryContainer,
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(child: Text('3138', style: theme.textTheme.bodyLarge)),
              const Text('Following'),
            ],
          ),
        ],
      ),
    );
  }
}
