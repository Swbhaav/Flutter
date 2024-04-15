import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:form/service/firebase_storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class ImageController extends GetxController {
  final fileImage = File('').obs;
  final memoryImage = Uint8List.fromList([]).obs;
  final _picker = ImagePicker();
  final firebaseStorageService = FirebaseStorageService();

  void pickImage({required bool isFromGallery}) async {
    if (kIsWeb) {
      var localImage = await _picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera,
      );
      if (localImage != null) {
        memoryImage.value = await localImage.readAsBytes();
        memoryImage.refresh();
      }
    } else {
      final permResult = await Permission.storage.request();
      if (permResult.isGranted) {
        var localImage = await _picker.pickImage(
          source: isFromGallery ? ImageSource.gallery : ImageSource.camera,
        );

        if (localImage != null) {
          fileImage.value = File(localImage.path);
          fileImage.refresh();
        }
      } else {
        print('Please allow storage permission');
      }
    }
  }

  ///Upload image to firebase storage and get download url
  uploadImage() {
    if (kIsWeb) {
      firebaseStorageService.uploadProfileImageInWebToFirebase(
          profileImage: memoryImage.value);
    } else {
      firebaseStorageService.uploadProfileImageToFirebase(
          profileImage: fileImage.value);
    }
  }
}