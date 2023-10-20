import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/errors.dart';
import 'package:harmonia/core/usecase/usecase.dart';
import 'package:harmonia/features/auth/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

class SignUpWithEmailAndPassword extends Usecase<User, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}
