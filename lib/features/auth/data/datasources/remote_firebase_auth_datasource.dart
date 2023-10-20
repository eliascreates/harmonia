import 'package:harmonia/core/errors/auth_exceptions.dart';
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
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return UserModel.empty;
      return UserModel.fromFirebase(firebaseUser);
    });
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebase(userCredential.user);
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebase(userCredential.user);
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Exception _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          return EmailAlreadyInUseException();
        case 'invalid-email':
        case 'user-not-found':
        case 'wrong-password':
          return InvalidEmailOrPasswordException();
        case 'weak-password':
          return WeakPasswordException();
        case 'too-many-requests':
        default:
          return UnexpectedAuthException();
      }
    }
    return UnexpectedAuthException();
  }
}
