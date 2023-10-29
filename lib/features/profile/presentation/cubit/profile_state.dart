part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({
    this.user = User.empty,
    this.status = ProfileStatus.initial,
    this.errorMessage,
  });

  final User user;
  final ProfileStatus status;
  final String? errorMessage;

  ProfileState copyWith({
    User? user,
    ProfileStatus? status,
    String? errorMessage,
  }) {
    return ProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'ProfileState(user: ${user.uid}, status: $status, errorMessage: $errorMessage)';
  }

  @override
  List<Object?> get props => [user, status, errorMessage];
}
