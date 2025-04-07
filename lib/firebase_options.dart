import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError('This config only supports web');
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB8bX9cpsixuQVUxIFcugfpdstJsDWwSt4',
    authDomain: 'test-ec1bf.firebaseapp.com',
    projectId: 'test-ec1bf',
    storageBucket: 'test-ec1bf.firebasestorage.app',
    messagingSenderId: '530097269490',
    appId: '1:530097269490:web:e23925c465d70912607e6b',
      measurementId: 'G-6728CP0X95'
  );
}