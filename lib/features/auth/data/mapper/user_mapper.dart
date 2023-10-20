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
    followers: entity.followers,
    following: entity.following,
    posts: entity.posts,
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
    followers: model.followers,
    following: model.following,
    posts: model.posts,
  );
}
