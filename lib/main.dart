import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/config/theme/theme.dart';
import 'package:harmonia/core/extensions/extensions.dart';
import 'package:harmonia/features/theme/theme.dart';

import 'features/auth/auth.dart';
import 'service_locator.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create: (context) => SignInBloc(
              signInWithEmailAndPassword: di.sl<SignInWithEmailAndPassword>(),
              signOut: di.sl<SignOut>(),
              authRepository: di.sl<AuthRepository>()),
        ),
      ],
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.select((SignInBloc bloc) => bloc.state.status);
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.toThemeMode(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harmonia App',
      themeMode: themeMode,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      home: authStatus.page,
    );
  }
}
