import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/errors.dart';

import '../entities/user.dart';

abstract class ProfileRepository {
  Stream<User> get currentUser;

  Future<Either<Failure, User>> getUserById({String uid});
}
