import 'dart:io';

import 'package:ecommerce_app_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseCloudStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);

    final fileRef = storageRef.child("$path/$fileName");

    await fileRef.putFile(file, SettableMetadata(contentType: 'image/jpeg'));

    return await fileRef.getDownloadURL();
  }
}
