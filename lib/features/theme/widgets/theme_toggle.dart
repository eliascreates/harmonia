import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/features/theme/cubit/theme_cubit.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ThemeCubit>().state;
    final isLight = state == ThemeState.light;
    final label = isLight ? 'Light Theme' : 'Dark Theme';

    return SwitchListTile(
      onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
      value: isLight,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(label),
      secondary: AnimatedRotation(
        turns: isLight ? 1 : 0,
        duration: const Duration(milliseconds: 1200),
        child: AnimatedCrossFade(
          firstChild: const Icon(Icons.light_mode),
          secondChild: const Icon(Icons.dark_mode),
          firstCurve: Curves.easeInOutSine,
          secondCurve: Curves.easeInOutSine,
          crossFadeState:
              isLight ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 1100),
        ),
      ),
    );
  }
}
