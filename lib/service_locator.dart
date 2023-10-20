import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:harmonia/config/debug/app_observer.dart';
import 'package:harmonia/config/firebase_options.dart';

import 'features/auth/auth.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  //? FEATURES

  //! Auth

  //Use cases
  sl.registerLazySingleton(() => SignUpWithEmailAndPassword(sl()));
  sl.registerLazySingleton(() => SignInWithEmailAndPassword(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));

  //Data sources
  sl.registerLazySingleton<RemoteFirebaseAuthDataSource>(
    () => RemoteFirebaseAuthDataSourceImpl(firebaseAuth: sl()),
  );

  //Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  //? EXTERNALS

  Bloc.observer = AppBlocObserver();

  //*Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
