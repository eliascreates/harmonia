import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();

  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  EmailValidationError? validator([String value = '']) {
    if (value.isEmpty) {
      return null;
    } else if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

extension EmailValidationErrorX on EmailValidationError {
  String get message {
    switch (this) {
      case EmailValidationError.invalid:
        return 'Please enter a valid email';
    }
  }
}
