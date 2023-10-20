import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonia/config/theme/theme.dart';
import 'package:harmonia/core/extensions/extensions.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harmonia App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.light,
      home: authStatus.page,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((SignInBloc bloc) => bloc.state.user);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Hey Harmonia Social'),
            Text(user.email),
            const SizedBox(height: 40),
            const SignOutButton()
          ],
        ),
      ),
    );
  }
}
