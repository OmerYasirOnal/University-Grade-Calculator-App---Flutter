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
    apiKey: 'AIzaSyDp75yUa-8qIVMJFMoqtzhSsyesEHf5uFU',
    appId: '1:635007900823:web:88e09b2bdc078e62675dd2',
    messagingSenderId: '635007900823',
    projectId: 'grade-calculator-firebase',
    authDomain: 'grade-calculator-firebase.firebaseapp.com',
    storageBucket: 'grade-calculator-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEMFarAF9OP9O4iQm-jMDnFnkGoYbR7Xc',
    appId: '1:635007900823:android:ac3742de4658be0f675dd2',
    messagingSenderId: '635007900823',
    projectId: 'grade-calculator-firebase',
    storageBucket: 'grade-calculator-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyDjQh7SxQBtSmEA1y1Cud-JRQVLLY2dI',
    appId: '1:635007900823:ios:4ef868184ec04e7c675dd2',
    messagingSenderId: '635007900823',
    projectId: 'grade-calculator-firebase',
    storageBucket: 'grade-calculator-firebase.appspot.com',
    iosClientId:
        '635007900823-a1on7h43t73s678kglab3cqh17e52951.apps.googleusercontent.com',
    iosBundleId: 'com.example.gradeCalculator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyDjQh7SxQBtSmEA1y1Cud-JRQVLLY2dI',
    appId: '1:635007900823:ios:4ef868184ec04e7c675dd2',
    messagingSenderId: '635007900823',
    projectId: 'grade-calculator-firebase',
    storageBucket: 'grade-calculator-firebase.appspot.com',
    iosClientId:
        '635007900823-a1on7h43t73s678kglab3cqh17e52951.apps.googleusercontent.com',
    iosBundleId: 'com.example.gradeCalculator',
  );
}
