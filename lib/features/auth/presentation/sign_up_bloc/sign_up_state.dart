part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, success, loading, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = SignUpStatus.initial,
    this.submissionStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.isPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final SignUpStatus status;
  final FormzSubmissionStatus submissionStatus;
  final bool isValid;
  final String? errorMessage;
  final bool isPasswordObscure;
  final bool isConfirmPasswordObscure;

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    SignUpStatus? status,
    FormzSubmissionStatus? submissionStatus,
    bool? isValid,
    String? errorMessage,
    bool? isPasswordObscure,
    bool? isConfirmPasswordObscure,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
      isConfirmPasswordObscure:
          isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        status,
        submissionStatus,
        isPasswordObscure,
        isConfirmPasswordObscure,
        isValid,
        errorMessage,
      ];

  @override
  String toString() =>
      'SignUpState(email: $email, password: $password, confirmPassword: $confirmPassword, status: $status, submissionStatus: $submissionStatus, isPasswordObscure: $isPasswordObscure, isConfirmPasswordObscure: $isConfirmPasswordObscure, isValid: $isValid, errorMessage: $errorMessage)';
}
