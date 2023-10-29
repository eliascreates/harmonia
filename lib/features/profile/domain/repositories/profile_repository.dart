import '../entities/user.dart';

abstract class ProfileRepository {
  Stream<User> getUserById({required String uid});
}
