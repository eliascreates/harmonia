import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harmonia/features/auth/auth.dart' show UserModel;

abstract class RemoteProfileFirestoreDatasource {
  Stream<UserModel> streamUserDocumentChanges({required String uid});
}

class RemoteProfileFirestoreDatasourceImpl
    implements RemoteProfileFirestoreDatasource {
  RemoteProfileFirestoreDatasourceImpl({required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Stream<UserModel> streamUserDocumentChanges({required String uid}) {
    return firestore.collection('users').doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return UserModel.empty;
      }
    });
  }
}
