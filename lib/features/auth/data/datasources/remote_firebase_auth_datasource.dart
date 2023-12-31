import 'package:flutter/foundation.dart';
import 'package:harmonia/core/errors/auth_exceptions.dart';
import 'package:harmonia/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// The `RemoteFirebaseAuthDataSource` abstract class provides a contract for interacting
/// with remote Firebase Authentication services. Implementations of this interface are
/// responsible for managing user authentication, including sign-in, sign-up, and sign-out operations.
abstract class RemoteFirebaseAuthDataSource {
  /// A stream that emits changes in the user's authentication state.
  ///
  /// It provides a continuous stream of [UserModel] objects, reflecting the current
  /// user's state, which updates whenever the user's authentication status changes.
  Stream<UserModel> get authStateChanges;

  /// Sign in a user with the provided email and password.
  ///
  /// Returns a [UserModel] object representing the signed-in user.
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up a new user with the provided email and password.
  ///
  /// Returns a [UserModel] object representing the newly registered user.
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign out the currently authenticated user.
  ///
  /// This method signs out the user currently authenticated in the application.
  /// It does not return a value, as the result of the operation is considered void.
  Future<void> signOut();
}

class RemoteFirebaseAuthDataSourceImpl implements RemoteFirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  RemoteFirebaseAuthDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

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
      final firebaseUser = UserModel.fromFirebase(userCredential.user).copyWith(
        timestamp: DateTime.now(),
      );

      final user = await _createUserInFirebase(firebaseUser);

      return user;
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<UserModel> _createUserInFirebase(UserModel user) async {
    final userRef = firestore.collection('users');
    try {
      await userRef.doc(user.uid).set(user.toJson());

      final doc = await userRef.doc(user.uid).get();

      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  Exception _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      debugPrint('New Error - Error Code: ${e.code} - Message: ${e.message}');
      switch (e.code) {
        case 'email-already-in-use':
          return EmailAlreadyInUseException();
        case 'INVALID_LOGIN_CREDENTIALS':
          return InvalidEmailOrPasswordException();
        case 'network-request-failed':
          return NetworkRequestFailedException();
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


    //* Only when user does not have document for some reason
    // await firestore
    //     .collection('users')
    //     .doc(user.uid)
    //     .set(user.toJson(), SetOptions(mergeFields: ['email']));