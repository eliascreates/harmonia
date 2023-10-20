import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:harmonia/core/validators/validators.dart';

import '../../domain/domain.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpWithEmailAndPassword signUpWithEmailAndPassword;
  final SignInWithEmailAndPassword signInWithEmailAndPassword;

  SignUpBloc({
    required this.signUpWithEmailAndPassword,
    required this.signInWithEmailAndPassword,
  }) : super(const SignUpState()) {
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onSignUpConfirmPasswordChanged);
    on<SignUpFormSubmitted>(_onSignUpFormSubmitted);
    on<SignUpPasswordObscureToggled>(_onSignUpPasswordObscureToggled);
    on<SignUpConfirmPasswordObscureToggled>(
        _onSignUpConfirmPasswordObscureToggled);
  }

  void _onSignUpPasswordObscureToggled(
    SignUpPasswordObscureToggled event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      isPasswordObscure: !state.isPasswordObscure,
      status: SignUpStatus.initial,
    ));
  }

  void _onSignUpConfirmPasswordObscureToggled(
    SignUpConfirmPasswordObscureToggled event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      status: SignUpStatus.initial,
      isConfirmPasswordObscure: !state.isConfirmPasswordObscure,
    ));
  }

  void _onSignUpEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) async {
    final Email email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.confirmPassword]),
        status: SignUpStatus.initial,
      ),
    );
  }

  void _onSignUpPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email, state.confirmPassword]),
        status: SignUpStatus.initial,
      ),
    );
  }

  void _onSignUpConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    final confirmPassword =
        ConfirmPassword.dirty(event.confirmPassword, state.password.value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([confirmPassword, state.email, state.password]),
        status: SignUpStatus.initial,
      ),
    );
  }

  void _onSignUpFormSubmitted(
    SignUpFormSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      status: SignUpStatus.loading,
      submissionStatus: FormzSubmissionStatus.inProgress,
    ));

    if (!state.isValid) {
      emit(state.copyWith(
        submissionStatus: FormzSubmissionStatus.canceled,
        status: SignUpStatus.initial,
      ));
      return;
    }

    final result = await signUpWithEmailAndPassword(SignUpParams(
      email: event.email.trim(),
      password: event.password.trim(),
    ));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
            errorMessage: failure.message,
            status: SignUpStatus.failure,
            submissionStatus: FormzSubmissionStatus.failure),
        (user) async {
          return state.copyWith(
              status: SignUpStatus.success,
              submissionStatus: FormzSubmissionStatus.success);
        },
      ),
    );
  }
}
