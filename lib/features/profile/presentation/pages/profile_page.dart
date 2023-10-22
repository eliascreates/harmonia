import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/auth/auth.dart'
    show SignInBloc, SignOutButton;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((SignInBloc bloc) => bloc.state.user);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Hello Harmonia, You wanna share'),
          const SizedBox(height: 10),
          Text(user.email),
          const SizedBox(height: 30),
          const SignOutButton()
        ],
      ),
    );
  }
}
