// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC12mIVs4sB1ldY-7WuqBowxtA6uDune30',
    appId: '1:303197404968:web:ff267dd7268a36ed001a1d',
    messagingSenderId: '303197404968',
    projectId: 'royal-riders-application',
    authDomain: 'royal-riders-application.firebaseapp.com',
    storageBucket: 'royal-riders-application.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgLG4J9MYPueGTynT4AmhPCIohFuG8cS8',
    appId: '1:303197404968:android:37c37b9bcbf18986001a1d',
    messagingSenderId: '303197404968',
    projectId: 'royal-riders-application',
    storageBucket: 'royal-riders-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0MgXzyI1KlKTovNmYDR6sh6_iR9xY6Eo',
    appId: '1:303197404968:ios:2d846612b8402880001a1d',
    messagingSenderId: '303197404968',
    projectId: 'royal-riders-application',
    storageBucket: 'royal-riders-application.appspot.com',
    iosBundleId: 'com.example.royalRidersApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0MgXzyI1KlKTovNmYDR6sh6_iR9xY6Eo',
    appId: '1:303197404968:ios:f53e36f9d0a769cc001a1d',
    messagingSenderId: '303197404968',
    projectId: 'royal-riders-application',
    storageBucket: 'royal-riders-application.appspot.com',
    iosBundleId: 'com.example.royalRidersApplication.RunnerTests',
  );
}
