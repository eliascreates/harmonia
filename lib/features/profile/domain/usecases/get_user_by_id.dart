import 'package:harmonia/core/usecase/usecase.dart';

import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class GetUserById extends UsecaseStream<User, UserByIdParams> {
  final ProfileRepository repository;

  GetUserById(this.repository);

  @override
  Stream<User> call(UserByIdParams params) {
    return repository.getUserById(uid: params.uid);
  }
}

class UserByIdParams {
  String uid;

  UserByIdParams({required this.uid});
}
