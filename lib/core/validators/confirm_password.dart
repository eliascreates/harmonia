import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError { invalid }

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure([super.value = '', this.password = ''])
      : super.pure();

  const ConfirmPassword.dirty([super.value = '', this.password = ''])
      : super.dirty();

  final String password;

  @override
  ConfirmPasswordValidationError? validator([String value = '']) {
    if (value.isEmpty) return null;

    if (value != password) {
      return ConfirmPasswordValidationError.invalid;
    }

    return null;
  }
}

extension ConfirmPasswordValidationErrorX on ConfirmPasswordValidationError {
  String? get message {
    switch (this) {
      case ConfirmPasswordValidationError.invalid:
        return 'Passwords do not match';
    }
  }
}
