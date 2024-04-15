
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
class FirebaseStorageService {
  final firebaseStorage = FirebaseStorage.instance;

  void uploadProfileImageToFirebase({required File profileImage}) async {
    print('Date Time Now ${DateTime.now()}');
    try {
      final ref = firebaseStorage
          .ref('images/profile-${DateFormat.yMMMd().format(DateTime.now())}')
          .child('image${DateTime.now()}.png/');
      await ref.putFile(profileImage);
      var downloadUrl = await ref.getDownloadURL();
    } catch (e) {
      print('Firebase Storage Error $e');
    }
  }

  void uploadProfileImageInWebToFirebase(
      {required Uint8List profileImage}) async {
    try {
      final ref = firebaseStorage
          .ref('images/profile-${DateFormat.yMMMd().format(DateTime.now())}')
          .child('image${DateTime.now()}.png/');
      await ref.putData(profileImage);
      var downloadUrl = await ref.getDownloadURL();
      print('Download Image Url $downloadUrl');
    } catch (e) {
      print('Firebase Storage Error $e');
    }
  }
}