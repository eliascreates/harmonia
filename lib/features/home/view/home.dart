import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:harmonia/features/main_feed/main_feed.dart';
import 'package:harmonia/features/notification/notification.dart';
import 'package:harmonia/features/profile/profile.dart';
import 'package:harmonia/features/search/search.dart';

import '../cubit/home_cubit.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((HomeCubit cubit) => cubit.state).index;
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          MainFeedPage(),
          SearchPage(),
          NotificationPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        key: const Key('homeView_addPost_floatingActionButton'),
        onPressed: () {},
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
