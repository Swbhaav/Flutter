import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyAEVhpA-ZgTd6ihtdqpV7tuxAywzaEhmHg",
      authDomain: "form-flutter-9a313.firebaseapp.com",
      projectId: "form-flutter-9a313",
      storageBucket: "form-flutter-9a313.appspot.com",
      messagingSenderId: "1078600322269",
      appId: "1:1078600322269:web:dd90e965e25ed6b91b1f34"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAEVhpA-ZgTd6ihtdqpV7tuxAywzaEhmHg",
      authDomain: "form-flutter-9a313.firebaseapp.com",
      projectId: "form-flutter-9a313",
      storageBucket: "form-flutter-9a313.appspot.com",
      messagingSenderId: "1078600322269",
      appId: "1:1078600322269:web:dd90e965e25ed6b91b1f34"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAEVhpA-ZgTd6ihtdqpV7tuxAywzaEhmHg",
      authDomain: "form-flutter-9a313.firebaseapp.com",
      projectId: "form-flutter-9a313",
      storageBucket: "form-flutter-9a313.appspot.com",
      messagingSenderId: "1078600322269",
      appId: "1:1078600322269:web:dd90e965e25ed6b91b1f34"
  );

}