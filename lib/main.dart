import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/config/theme/theme.dart';

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
        BlocProvider(
          create: (context) => SignInBloc(
              signInWithEmailAndPassword: di.sl<SignInWithEmailAndPassword>(),
              signOut: di.sl<SignOut>(),
              authRepository: di.sl<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
            signUpWithEmailAndPassword: di.sl<SignUpWithEmailAndPassword>(),
            signInWithEmailAndPassword: di.sl<SignInWithEmailAndPassword>(),
          ),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harmonia App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.light,
      home: const SignInPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Placeholder());
  }
}
