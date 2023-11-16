import 'package:formz/formz.dart';

enum PasswordValidationError {
  atLeastOneSpecialChar,
  atLeastOneLowercase,
  atLeastOneUppercase,
  atLeastOneDigit,
  minLength,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator([String value = '']) {
    if (value.isEmpty) return null;

    final hasLowercase = RegExp(r'(?=.*[a-z])').hasMatch(value);
    final hasUppercase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
    final hasDigit = RegExp(r'(?=.*\d)').hasMatch(value);
    final hasSpecial = RegExp(r'^(?=.*[!@#$%^&*()_+<><?:"|\\~`])').hasMatch(value);
    final isMinLength = value.length >= 8;

    if (!hasLowercase) return PasswordValidationError.atLeastOneLowercase;

    if (!hasUppercase) return PasswordValidationError.atLeastOneUppercase;

    if (!hasDigit) return PasswordValidationError.atLeastOneDigit;

    if (!isMinLength) return PasswordValidationError.minLength;

    if (!hasSpecial) return PasswordValidationError.atLeastOneSpecialChar;

    return null;
  }
}

extension PasswordValidationErrorX on PasswordValidationError {
  String? get message {
    switch (this) {
      case PasswordValidationError.atLeastOneLowercase:
        return 'Password must have at least one lowercase letter.';
      case PasswordValidationError.atLeastOneUppercase:
        return 'Password must have at least one uppercase letter.';
      case PasswordValidationError.atLeastOneDigit:
        return 'Password must have at least one digit.';
      case PasswordValidationError.minLength:
        return 'Password must be at least 8 characters long.';
      case PasswordValidationError.atLeastOneSpecialChar:
        return 'Password must have at least one special character.';
    }
  }
}
