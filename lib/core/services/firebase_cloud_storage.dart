import 'dart:io';

import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseCloudStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);
    final fileExtension = p.extension(file.path);
    var fileRef = storageRef.child("$path/$fileName.$fileExtension");
    await fileRef.putFile(file);
    String fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
