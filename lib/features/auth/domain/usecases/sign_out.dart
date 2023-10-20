import 'package:dartz/dartz.dart';

import 'package:harmonia/core/errors/errors.dart';
import 'package:harmonia/core/usecase/usecase.dart';

import '../repositories/auth_repository.dart';

class SignOut extends Usecase<void, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
