import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/errors.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Stream<User> get currentUser;

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signOut();
}
