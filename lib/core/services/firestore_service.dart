import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String? documentId,
  }) async {
    if (documentId != null) {
      await db.collection(path).doc(documentId).set(data);
    } else {
      await db.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String documentsId,
    required String path,
  }) async {
    var data = await db.collection(path).doc(documentsId).get();
    return data.data()!;
  }

  @override
  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  }) {
    var data = db.collection(path).doc(documentId).get();
    return data.then((doc) => doc.exists);
  }
}
