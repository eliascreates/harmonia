import 'package:dartz/dartz.dart';

import 'package:harmonia/core/errors/errors.dart';
import 'package:harmonia/core/usecase/usecase.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignInWithEmailAndPassword extends Usecase<User, SignInParams> {
  final AuthRepository repository;

  SignInWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
