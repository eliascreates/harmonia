
import 'package:flutter/material.dart';
import 'package:harmonia/core/constants/constants.dart';

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
