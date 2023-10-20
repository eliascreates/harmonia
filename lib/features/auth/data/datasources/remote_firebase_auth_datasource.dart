import 'package:harmonia/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteFirebaseAuthDataSource {
  Stream<UserModel> get authStateChanges;

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class RemoteFirebaseAuthDataSourceImpl implements RemoteFirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;

  RemoteFirebaseAuthDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<UserModel> get authStateChanges {
    return firebaseAuth.authStateChanges().map((user) {
      if (user == null) return UserModel.empty;
      return UserModel.fromFirebase(user);
    });
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
