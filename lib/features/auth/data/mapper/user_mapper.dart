import '../../domain/domain.dart';
import '../models/user_model.dart';

UserModel fromEntity(User entity) {
  return UserModel(
    uid: entity.uid,
    displayName: entity.displayName,
    email: entity.email,
    imageUrl: entity.imageUrl,
    username: entity.username,
    biography: entity.biography,
    followerCount: entity.followerCount,
    followingCount: entity.followingCount,
    postCount: entity.postCount,
  );
}

User toEntity(UserModel model) {
  return User(
    uid: model.uid,
    displayName: model.displayName,
    email: model.email,
    imageUrl: model.imageUrl,
    username: model.username,
    biography: model.biography,
    followerCount: model.followerCount,
    followingCount: model.followingCount,
    postCount: model.postCount,
  );
}
