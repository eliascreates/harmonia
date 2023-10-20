part of 'sign_in_bloc.dart';


enum AuthStatus { authenticated, unauthenticated, loading }

class SignInState extends Equatable {
  const SignInState({
    this.user = User.empty,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = AuthStatus.unauthenticated,
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.isObscurePassword = true,
    this.errorMessage,
  });

  final User user;
  final Email email;
  final Password password;
  final AuthStatus status;
  final FormzSubmissionStatus submissionStatus;
  final bool isValid;
  final String? errorMessage;
  final bool isObscurePassword;

  SignInState copyWith({
    User? user,
    Email? email,
    Password? password,
    AuthStatus? status,
    FormzSubmissionStatus? submissionStatus,
    bool? isValid,
    String? errorMessage,
    bool? isObscurePassword,
  }) {
    return SignInState(
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
    );
  }

  @override
  List<Object?> get props => [
        user,
        email,
        password,
        status,
        submissionStatus,
        isObscurePassword,
        isValid,
        errorMessage,
      ];

  @override
  String toString() =>
      'SignInState(user: $user, email: $email, password: $password, status: $status, submissionStatus: $submissionStatus, isObscurePassword: $isObscurePassword, isValid: $isValid, errorMessage: $errorMessage)';
}
