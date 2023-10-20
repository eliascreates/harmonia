import 'package:dartz/dartz.dart';
import 'package:harmonia/core/errors/errors.dart';

import '../entities/user.dart';

/// The AuthRepository provides an abstract interface for handling user authentication.
/// Implementations of this interface are responsible for managing user sign-in,
/// sign-up, and sign-out operations.
abstract class AuthRepository {
  /// A stream that emits the current authenticated user. It's a continuous stream
  /// that updates whenever the user's authentication status changes.
  Stream<User> get currentUser;

  /// Sign in a user with the provided email and password.
  /// 
  /// Returns a [User] if the sign-in is successful, or a [Failure] if there's an error.
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up a new user with the provided email and password.
  /// 
  /// Returns a [User] if the sign-up is successful, or a [Failure] if there's an error.
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign out the currently authenticated user.
  /// 
  /// Returns a [Unit] if the sign-out is successful. In Dartz, [Unit] is used
  /// as a representation of a valueless result, similar to `void`.
  Future<Either<Failure, Unit>> signOut();
}
