abstract class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() => 'AppException: $message';
}

/// This is now represented by the error code `INVALID_LOGIN_CREDENTIALS` in firebase exceptions
class InvalidEmailOrPasswordException extends AuthException {
  InvalidEmailOrPasswordException({
    super.message =
        "Invalid email or password.\nPlease review your credentials",
  });
}

class WeakPasswordException extends AuthException {
  WeakPasswordException({
    super.message = 'Password is too weak.\nPlease use a stronger password.',
  });
}

//network-request-failed
class NetworkRequestFailedException extends AuthException {
  NetworkRequestFailedException({
    super.message = 'Please check your internet connection.',
  });
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException({
    super.message = 'Email already in use.\nPlease select a different one.',
  });
}

class UnexpectedAuthException extends AuthException {
  UnexpectedAuthException({
    super.message = 'An unexpected authentication error occurred',
  });
}
