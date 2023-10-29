import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:harmonia/config/debug/app_observer.dart';
import 'package:harmonia/config/firebase_options.dart';
import 'package:harmonia/features/profile/profile.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

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

  //Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  //Data sources
  sl.registerLazySingleton<RemoteFirebaseAuthDataSource>(
    () => RemoteFirebaseAuthDataSourceImpl(firebaseAuth: sl(), firestore: sl()),
  );

  //! Profile

  //Usecases
  sl.registerLazySingleton<GetUserById>(() => GetUserById(sl()));

  // Repositories
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<RemoteProfileFirestoreDatasource>(
    () => RemoteProfileFirestoreDatasourceImpl(firestore: sl()),
  );

  //? EXTERNALS

  Bloc.observer = AppBlocObserver();

  //*Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firestore);

  //* Hydrated Bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}
