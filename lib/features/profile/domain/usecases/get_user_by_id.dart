import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/failures.dart';
import 'package:harmonia/core/usecase/usecase.dart';
import 'package:harmonia/features/profile/domain/repositories/profile_repository.dart';

import '../entities/user.dart';

class GetUserById extends Usecase<User, UserByIdParams> {
  final ProfileRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> call(UserByIdParams params) async {
    return await repository.getUserById(uid: params.uid);
  }
}

class UserByIdParams {
  String uid;
  
  UserByIdParams({required this.uid});
}
