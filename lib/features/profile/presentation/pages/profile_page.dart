import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../cubit/profile_cubit.dart';
import 'package:harmonia/features/settings/settings.dart';
import 'package:harmonia/service_locator.dart' as di;

import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        getUserById: di.sl<GetUserById>(),
      )..init(userId: profileId),
      child: ProfileView(profileId),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView(this.profileId, {super.key});
  final String profileId;

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileCubit cubit) => cubit.state.user);
    List<String> tabs = ['Photos', 'Videos'];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
          size: 27,
        ),
        title: Text(
          '@veggieroot',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsPage(user: user),
              ),
            ),
            icon: const Icon(Icons.settings_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProfileSection(
                      imageUrl: user.imageUrl,
                      followerCount: user.followerCount.toString(),
                      followingCount: user.followingCount.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.displayName.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProfileBiography(bioText: user.biography),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProfileActions(profileId),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ];
        },
        body: DefaultTabController(
          length: tabs.length,
          child: Column(
            children: [
              TabBar(
                enableFeedback: true,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                tabs: List.generate(
                  tabs.length,
                  (index) => Tab(
                    text: tabs[index],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ProfileWindowGallery(),
                    Center(child: Text('Videos'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
