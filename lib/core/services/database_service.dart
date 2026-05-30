abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    String? documentsId,
    required String path,
    Map<String, dynamic>? query,
  });

  Stream<dynamic> streamData({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  });

  Future<void> deleteData({required String path, required String documentId});
}
