part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  final String email;
  const SignInEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class SignInPasswordChanged extends SignInEvent {
  final String password;
  const SignInPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignInObscureToggled extends SignInEvent {
  const SignInObscureToggled();
}

class SignInCurrentUserUpdated extends SignInEvent {
  final User currentUser;
  const SignInCurrentUserUpdated({required this.currentUser});
}

class SignOutRequested extends SignInEvent {
  const SignOutRequested();
}

class SignInFormSubmitted extends SignInEvent {
  final String email;
  final String password;

  const SignInFormSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
