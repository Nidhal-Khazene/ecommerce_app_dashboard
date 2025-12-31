abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>> getData({
    required String documentsId,
    required String path,
  });
  Future<bool> checkIfDataExists({
    required String documentId,
    required String path,
  });
}
