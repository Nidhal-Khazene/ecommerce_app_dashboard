import 'dart:io';

import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseCloudStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<Map<String, String>> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);

    final fileRef = storageRef.child("$path/$fileName");

    await fileRef.putFile(
      file,
      SettableMetadata(contentType: getContentType(file)),
    );
    final url = await fileRef.getDownloadURL();
    final imagePath = fileRef.fullPath;

    return {"url": url, "imagePath": imagePath};
  }

  @override
  Future<void> updateFile(File file, String path) async {
    final fileRef = storageRef.child(path);

    String contentType = getContentType(file);

    await fileRef.putFile(file, SettableMetadata(contentType: contentType));
  }

  String getContentType(File file) {
    final ext = p.extension(file.path).toLowerCase();

    String contentType;
    switch (ext) {
      case '.png':
        contentType = 'image/png';
        break;
      case '.jpg':
      case '.jpeg':
        contentType = 'image/jpeg';
        break;
      default:
        contentType = 'application/octet-stream';
    }
    return contentType;
  }

  @override
  Future<void> deleteFile(String path) {
    final fileRef = storageRef.child(path);

    return fileRef.delete();
  }
}
