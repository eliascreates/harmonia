import 'package:cached_network_image/cached_network_image.dart';
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
    const imageUrl =
        'https://i.pinimg.com/564x/f3/43/83/f3438301e27ccacc2b3939d44cee031a.jpg';

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
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  errorWidget: (context, url, error) => const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(defaultProfileImageSrc),
                  ),
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage(defaultProfileImageSrc),
                    foregroundImage: imageProvider,
                  ),
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
