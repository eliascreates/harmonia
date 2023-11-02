import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/core/constants/constants.dart';
import 'package:harmonia/features/auth/auth.dart';
import '../../domain/domain.dart';
import '../cubit/profile_cubit.dart';
import 'package:harmonia/features/settings/presentation/pages/settings_page.dart';
import 'package:harmonia/service_locator.dart' as di;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.select(
      (SignInBloc bloc) => bloc.state.user.uid,
    );
    final bool isCurrentUser = currentUserId == profileId;

    return BlocProvider(
      create: (context) => ProfileCubit(
        getUserById: di.sl<GetUserById>(),
      )..init(userId: profileId),
      child: ProfileView(isCurrentUser: isCurrentUser),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.isCurrentUser});
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileCubit cubit) => cubit.state.user);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary, size: 27),
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
      body: Column(
        children: [
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
            child: Text(
              user.displayName.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ProfileBiography(bioText: user.biography),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ProfileActions(isCurrentUser: isCurrentUser),
          )
        ],
      ),
    );
  }
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key, required this.isCurrentUser});
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    if (isCurrentUser) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Edit Profile'),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const FollowUnfollowButton(isFollowed: true),
        OutlinedButton(onPressed: () {}, child: const Text('Message')),
      ],
    );
  }
}

class FollowUnfollowButton extends StatelessWidget {
  const FollowUnfollowButton({super.key, required this.isFollowed});

  final bool isFollowed;

  @override
  Widget build(BuildContext context) {
    if (!isFollowed) {
      return ElevatedButton(onPressed: () {}, child: const Text('+ Follow'));
    }

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary),
      child: const Text('Unfollow'),
    );
  }
}

class ProfileBiography extends StatelessWidget {
  const ProfileBiography({super.key, required this.bioText});

  final String bioText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                ),
              ),
            ),
            child: Text(
              bioText,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.followingCount,
    required this.followerCount,
    required this.imageUrl,
  });
  final String followingCount;
  final String followerCount;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final networkImage = imageUrl.isEmpty ? null : NetworkImage(imageUrl);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(followerCount, style: theme.textTheme.bodyLarge),
              const Text('Followers'),
            ],
          ),
          SizedBox.square(
            dimension: 115,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage(defaultProfileImageSrc),
                  foregroundImage: networkImage,
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
              FittedBox(
                child: Text(followingCount, style: theme.textTheme.bodyLarge),
              ),
              const Text('Following'),
            ],
          ),
        ],
      ),
    );
  }
}
