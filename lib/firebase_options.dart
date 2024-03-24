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
    apiKey: 'AIzaSyBUHpeU2yTxNB3VoM04K4p_49cXhjc-d9w',
    appId: '1:420974247583:web:88440d834fcea5a02eacaa',
    messagingSenderId: '420974247583',
    projectId: 'academicproject-3d530',
    authDomain: 'academicproject-3d530.firebaseapp.com',
    storageBucket: 'academicproject-3d530.appspot.com',
    measurementId: 'G-76GGH527V6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAicZ2aPY4eEfhGkRCb43KcN_J7PzXlrXY',
    appId: '1:420974247583:android:c5a05cb32b9ec5912eacaa',
    messagingSenderId: '420974247583',
    projectId: 'academicproject-3d530',
    storageBucket: 'academicproject-3d530.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALzuJOYtBEkZ62we5DnQQeBHgPUIY-6c8',
    appId: '1:420974247583:ios:b2dafa5e670323d52eacaa',
    messagingSenderId: '420974247583',
    projectId: 'academicproject-3d530',
    storageBucket: 'academicproject-3d530.appspot.com',
    iosBundleId: 'com.example.academicProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALzuJOYtBEkZ62we5DnQQeBHgPUIY-6c8',
    appId: '1:420974247583:ios:759c143b5958831e2eacaa',
    messagingSenderId: '420974247583',
    projectId: 'academicproject-3d530',
    storageBucket: 'academicproject-3d530.appspot.com',
    iosBundleId: 'com.example.academicProject.RunnerTests',
  );
}
