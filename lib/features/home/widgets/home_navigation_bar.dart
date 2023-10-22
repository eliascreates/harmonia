import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';

part 'home_navigation_item.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((HomeCubit cubit) => cubit.state).index;

    return SizedBox(
      height: 80,
      child: Card(
        elevation: 3,
        shape: const StadiumBorder(),
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            HomeNavigationItem(
              tab: HomeState.home,
              icon: Icons.home_rounded,
              currentIndex: currentIndex,
            ),
            HomeNavigationItem(
              tab: HomeState.search,
              icon: Icons.search_rounded,
              currentIndex: currentIndex,
            ),
            const SizedBox(width: 20),
            HomeNavigationItem(
              tab: HomeState.notifications,
              icon: Icons.notifications_rounded,
              currentIndex: currentIndex,
            ),
            HomeNavigationItem(
              tab: HomeState.profile,
              icon: Icons.person_rounded,
              currentIndex: currentIndex,
            ),
          ]),
        ),
      ),
    );
  }
}
