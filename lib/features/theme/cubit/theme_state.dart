part of 'theme_cubit.dart';

enum ThemeState { light, dark }

extension ThemeStateX on ThemeState {
  ThemeMode toThemeMode() {
    return this == ThemeState.dark ? ThemeMode.dark : ThemeMode.light;
  }
}