import '../../domain/domain.dart';
import '../datasources/remote_profile_firestore_datasource.dart';
import '../mapper/user_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteProfileFirestoreDatasource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<User> getUserById({required String uid}) {
    return remoteDataSource.streamUserDocumentChanges(uid: uid).map(
          (userModel) => toEntity(userModel),
        );
  }
}
