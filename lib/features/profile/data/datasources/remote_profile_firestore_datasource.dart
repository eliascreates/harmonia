import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
      debugPrint('DATA SOURCE: The uid of beetroot is: $uid');

      if (doc.exists) {
        debugPrint('DATA SOURCE: ACCOUNT EXISTS');
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        debugPrint('DATA SOURCE: ACCOUNT DOES NOT EXIST');
        return UserModel.empty;
      }
    });
  }
}
