part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  const SignUpEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  const SignUpPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;
  const SignUpConfirmPasswordChanged({required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class SignUpPasswordObscureToggled extends SignUpEvent {
  const SignUpPasswordObscureToggled();
}

class SignUpConfirmPasswordObscureToggled extends SignUpEvent {
  const SignUpConfirmPasswordObscureToggled();
}

class SignUpFormSubmitted extends SignUpEvent {
  final String email;
  final String password;

  const SignUpFormSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
