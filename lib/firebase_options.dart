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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHeyGWRfrdVeXu2NK5lH15SjSetNTDpaQ',
    appId: '1:469741584116:android:5184637adb82775075a8a1',
    messagingSenderId: '469741584116',
    projectId: 'twenv-4dcbc',
    databaseURL: 'https://twenv-4dcbc-default-rtdb.firebaseio.com',
    storageBucket: 'twenv-4dcbc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjwSHahF6YSgGXuJJRF_nOpTExFoFK-zc',
    appId: '1:469741584116:ios:785fc1f1b69dcf6e75a8a1',
    messagingSenderId: '469741584116',
    projectId: 'twenv-4dcbc',
    databaseURL: 'https://twenv-4dcbc-default-rtdb.firebaseio.com',
    storageBucket: 'twenv-4dcbc.appspot.com',
    iosClientId: '469741584116-dubekh61u0jtg782do47mqq1pfnncofr.apps.googleusercontent.com',
    iosBundleId: 'com.example.twenv',
  );
}
