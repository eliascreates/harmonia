
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/auth.dart';

import 'follow_unfollow_button.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions(this.profileId, {super.key});

  final String profileId;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.select(
      (SignInBloc bloc) => bloc.state.user.uid,
    );

    final bool isCurrentUser = currentUserId == profileId;

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
        const FollowUnfollowButton(),
        OutlinedButton(onPressed: () {}, child: const Text('Message')),
      ],
    );
  }
}