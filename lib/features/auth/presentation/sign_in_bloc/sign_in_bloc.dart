import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:harmonia/core/usecase/usecase.dart';

import 'package:harmonia/core/validators/validators.dart';

import '../../domain/domain.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final SignOut signOut;
  final AuthRepository authRepository;

  late StreamSubscription<User> _userSubscription;

  SignInBloc(
      {required this.signInWithEmailAndPassword,
      required this.authRepository,
      required this.signOut})
      : super(const SignInState()) {
    on<SignInEmailChanged>(_onAuthEmailChanged);
    on<SignInPasswordChanged>(_onAuthPasswordChanged);
    on<SignInFormSubmitted>(_onAuthFormSubmitted);
    on<SignInObscureToggled>(_onAuthObscureToggled);
    on<SignInCurrentUserUpdated>(_onSignInCurrentUserUpdated);
    on<SignOutRequested>(_onSignOutRequested);

    _userSubscription = authRepository.currentUser.listen((user) {
      add(SignInCurrentUserUpdated(currentUser: user));
    });
  }

  void _onSignInCurrentUserUpdated(
    SignInCurrentUserUpdated event,
    Emitter<SignInState> emit,
  ) async {
    if (event.currentUser == User.empty) {
      return;
    }

    emit(state.copyWith(
      user: event.currentUser,
      status: AuthStatus.authenticated,
      submissionStatus: FormzSubmissionStatus.initial,
    ));
  }

  void _onAuthObscureToggled(
    SignInObscureToggled event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      isObscurePassword: !state.isObscurePassword,
      submissionStatus: FormzSubmissionStatus.initial,
    ));
  }

  void _onAuthEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) async {
    final Email email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        submissionStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onAuthPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    final password = Password.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        submissionStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onAuthFormSubmitted(
    SignInFormSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      submissionStatus: FormzSubmissionStatus.inProgress,
      status: AuthStatus.loading,
    ));

    if (!state.isValid) {
      emit(state.copyWith(
        submissionStatus: FormzSubmissionStatus.canceled,
        status: AuthStatus.unauthenticated,
      ));
      return;
    }

    final result = await signInWithEmailAndPassword(SignInParams(
      email: event.email.trim(),
      password: event.password.trim(),
    ));

    emit(
      await result.fold(
        (failure) async => state.copyWith(
            errorMessage: failure.message,
            status: AuthStatus.unauthenticated,
            submissionStatus: FormzSubmissionStatus.failure),
        (user) async => state.copyWith(
            user: user,
            status: AuthStatus.authenticated,
            submissionStatus: FormzSubmissionStatus.success),
      ),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<SignInState> emit,
  ) async {
    final result = await signOut(const NoParams());

    emit(
      await result.fold(
        (failure) async => state.copyWith(errorMessage: failure.message),
        (success) async => state.copyWith(status: AuthStatus.unauthenticated),
      ),
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
