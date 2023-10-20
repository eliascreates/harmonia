import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String imageUrl;
  final String biography;
  final String displayName;
  final List<String> followers;
  final List<String> following;
  final List<String> posts;

  const User({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.imageUrl,
    required this.username,
    required this.biography,
    required this.followers,
    required this.following,
    required this.posts,
  });

  static const empty = User(
    uid: '',
    displayName: '',
    email: '',
    imageUrl: '',
    username: '',
    biography: '',
    followers: [],
    following: [],
    posts: [],
  );

  @override
  List<Object?> get props => [
        uid,
        displayName,
        email,
        imageUrl,
        username,
        biography,
        followers,
        following,
        posts,
      ];
}
