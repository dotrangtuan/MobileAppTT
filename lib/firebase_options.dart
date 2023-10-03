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
    apiKey: 'AIzaSyCYovIzl0ev1HDU22RLsjrJ2mMo54eU0ik',
    appId: '1:594854890250:web:603e8f59b87d3b5d45c8f3',
    messagingSenderId: '594854890250',
    projectId: 'app-auth-13371',
    authDomain: 'app-auth-13371.firebaseapp.com',
    storageBucket: 'app-auth-13371.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsco0sDLzOOv1pGIbcftWDrmUweYHizYk',
    appId: '1:594854890250:android:fd302caccd020fb145c8f3',
    messagingSenderId: '594854890250',
    projectId: 'app-auth-13371',
    storageBucket: 'app-auth-13371.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrGEoLAZQc7UCwQ41MufeJVthxwViXkRw',
    appId: '1:594854890250:ios:a1e945d54c5dc10d45c8f3',
    messagingSenderId: '594854890250',
    projectId: 'app-auth-13371',
    storageBucket: 'app-auth-13371.appspot.com',
    iosBundleId: 'com.example.appAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrGEoLAZQc7UCwQ41MufeJVthxwViXkRw',
    appId: '1:594854890250:ios:e4ccd30a62c4119745c8f3',
    messagingSenderId: '594854890250',
    projectId: 'app-auth-13371',
    storageBucket: 'app-auth-13371.appspot.com',
    iosBundleId: 'com.example.appAuth.RunnerTests',
  );
}