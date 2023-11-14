
import 'package:flutter/material.dart';

class FollowUnfollowButton extends StatelessWidget {
  const FollowUnfollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isFollowed = true;

    if (isFollowed) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary),
        child: const Text('Unfollow'),
      );
    }

    return ElevatedButton(onPressed: () {}, child: const Text('+ Follow'));
  }
}
