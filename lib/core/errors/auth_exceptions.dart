abstract class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() => 'AppException: $message';
}

//This Exception looks into 'user-not-found' and 'wrong-password' firebase exceptions
class InvalidEmailOrPasswordException extends AuthException {
  InvalidEmailOrPasswordException({
    super.message = "Incorrect email or password.",
  });
}

class WeakPasswordException extends AuthException {
  WeakPasswordException({super.message = ''});
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException({
    super.message = 'Email already in use. Please select a different one.',
  });
}
