import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String imageUrl;
  final String biography;
  final String displayName;
  final int followerCount;
  final int followingCount;
  final int postCount;
  final DateTime? timestamp;

  const User({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.imageUrl,
    required this.username,
    required this.biography,
    required this.followerCount,
    required this.followingCount,
    required this.postCount,
    this.timestamp,
  });

  static const empty = User(
    uid: '',
    displayName: '',
    email: '',
    imageUrl: '',
    username: '',
    biography: '',
    followerCount: 0,
    followingCount: 0,
    postCount: 0,
  );

  @override
  List<Object?> get props => [
        uid,
        displayName,
        email,
        imageUrl,
        username,
        biography,
        followerCount,
        followingCount,
        postCount,
        timestamp,
      ];
}
