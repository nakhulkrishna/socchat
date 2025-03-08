import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File image) async {
    try {
      Reference ref =
          _storage.ref("images/${DateTime.now().microsecondsSinceEpoch}");

      final task = await ref.putFile(image);
      String downlaodUrl = await task.ref.getDownloadURL();
      return downlaodUrl;
    } catch (e) {
      rethrow;
    }
  }
}
