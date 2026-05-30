import 'dart:io';

abstract class StorageService {
  Future<Map<String, String>> uploadFile(File file, String path);
  Future<void> updateFile(File file, String path);
  Future<void> deleteFile(String path);
}
