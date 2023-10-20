abstract class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() => 'AppException: $message';
}

//This Exception looks into 'user-not-found' and 'wrong-password' firebase exceptions
class InvalidEmailOrPasswordException extends AuthException {
  InvalidEmailOrPasswordException({
    super.message = "Invalid email or password. Please review your credentials",
  });
}

class WeakPasswordException extends AuthException {
  WeakPasswordException({
    super.message = 'Password is too weak. Please use a stronger password.',
  });
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException({
    super.message = 'Email already in use. Please select a different one.',
  });
}

class UnexpectedAuthException extends AuthException {
  UnexpectedAuthException({
    super.message = 'An unexpected authentication error occurred',
  });
}
