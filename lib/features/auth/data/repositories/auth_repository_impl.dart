import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/auth_exceptions.dart';
import 'package:harmonia/core/errors/failures.dart';
import 'package:harmonia/features/auth/data/datasources/remote_firebase_auth_datasource.dart';
import 'package:harmonia/features/auth/data/mapper/user_mapper.dart';
import 'package:harmonia/features/auth/domain/domain.dart';

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
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userModel = await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = toEntity(userModel);

      return Right(user);
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
