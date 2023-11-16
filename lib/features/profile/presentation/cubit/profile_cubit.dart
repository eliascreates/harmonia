import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserById getUserById;
  late StreamSubscription<User> _userSubscription;
  ProfileCubit({required this.getUserById}) : super(const ProfileState());

  void init({required String userId}) {
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));

    _userSubscription = getUserById(UserByIdParams(uid: userId)).listen(
      (user) {
        emit(state.copyWith(
          user: user,
          status: ProfileStatus.success,
          errorMessage: null,
        ));
      },
      onError: (error) {
        emit(
          state.copyWith(
            status: ProfileStatus.failure,
            user: User.empty,
            errorMessage: 'No User Information Right now',
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
