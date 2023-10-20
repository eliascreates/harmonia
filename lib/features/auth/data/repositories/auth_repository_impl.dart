import 'package:dartz/dartz.dart';

import 'package:harmonia/core/errors/errors.dart';

import '../../domain/domain.dart';
import '../datasources/remote_firebase_auth_datasource.dart';
import '../mapper/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteFirebaseAuthDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<User> get currentUser {
    return remoteDataSource.authStateChanges.map(
      (userModel) => toEntity(userModel),
    );
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = toEntity(userModel);

      return Right(user);
    } catch (e) {
      if (e is AuthException) {
        return Left(ServerFailure(message: e.message));
      }
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = toEntity(userModel);
      return Right(user);
    } catch (e) {
      if (e is AuthException) return Left(ServerFailure(message: e.message));
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(unit);
    } catch (e) {
      if (e is AuthException) return Left(ServerFailure(message: e.message));
    }
    return const Left(ServerFailure());
  }
}
