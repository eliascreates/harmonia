// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String uid;
  final String displayName;
  final String biography;
  final String email;
  final String imageUrl;
  final String username;
  final List<String> followers;
  final List<String> following;
  final List<String> posts;

  const UserModel({
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

  static const empty = UserModel(
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

  factory UserModel.fromFirebase(User? firebaseUser) {
    if (firebaseUser == null) return UserModel.empty;
    return UserModel.empty.copyWith(
      uid: firebaseUser.uid,
      displayName: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      imageUrl: firebaseUser.photoURL ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
      username: json['username'] as String,
      biography: json['biography'] as String,
      followers: List<String>.from(json['followers'] as List<dynamic>),
      following: List<String>.from(json['following'] as List<dynamic>),
      posts: List<String>.from(json['posts'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'imageUrl': imageUrl,
      'username': username,
      'biography': biography,
      'followers': followers,
      'following': following,
      'posts': posts,
    };
  }

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

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? biography,
    String? email,
    String? imageUrl,
    String? username,
    List<String>? followers,
    List<String>? following,
    List<String>? posts,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      biography: biography ?? this.biography,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      posts: posts ?? this.posts,
    );
  }
}
