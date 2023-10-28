import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String uid;
  final String displayName;
  final String biography;
  final String email;
  final String imageUrl;
  final String username;
  final int followerCount;
  final int followingCount;
  final int postCount;
  final DateTime? timestamp;

  const UserModel({
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

  static const empty = UserModel(
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
      biography: json['biography'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String,
      username: json['username'] as String,
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      postCount: json['postCount'] as int,
      timestamp: json['timestamp'] as DateTime?,
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
      'followerCount': followerCount,
      'followingCount': followingCount,
      'postCount': postCount,
      'timestamp': timestamp,
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
        followerCount,
        followingCount,
        postCount,
        timestamp,
      ];

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? biography,
    String? email,
    String? imageUrl,
    String? username,
    int? followerCount,
    int? followingCount,
    int? postCount,
    DateTime? timestamp,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      biography: biography ?? this.biography,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      username: username ?? this.username,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      postCount: postCount ?? this.postCount,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
