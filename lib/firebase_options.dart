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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCGktMEjIlJmTiBi9NUUzAn8GEipNAJQPs',
    appId: '1:835619346021:web:e145c7555f67a7983d588c',
    messagingSenderId: '835619346021',
    projectId: 'bivid-pharma-mobile',
    authDomain: 'bivid-pharma-mobile.firebaseapp.com',
    storageBucket: 'bivid-pharma-mobile.appspot.com',
    measurementId: 'G-J992SLJD48',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB30L1LAEGLmkHL1xIYT9VjCOswAo0pR2g',
    appId: '1:835619346021:android:2cf4871cd8afa0463d588c',
    messagingSenderId: '835619346021',
    projectId: 'bivid-pharma-mobile',
    storageBucket: 'bivid-pharma-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbPGOzW0FH2h_NlbOyR2yyQPsoC_ZPtVE',
    appId: '1:835619346021:ios:59766e3f96a4c6973d588c',
    messagingSenderId: '835619346021',
    projectId: 'bivid-pharma-mobile',
    storageBucket: 'bivid-pharma-mobile.appspot.com',
    iosClientId:
        '835619346021-b1uh0u9fbtukiagfqe6gv2e5l1uutp0j.apps.googleusercontent.com',
    iosBundleId: 'com.example.bividapp',
  );
}
