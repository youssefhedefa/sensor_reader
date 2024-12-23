// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBgDS3DvPhZUX8mk2OMTo8BJFEREDDbfLo',
    appId: '1:407480833153:android:7b30bfc960eaa08121a980',
    messagingSenderId: '407480833153',
    projectId: 'mobile-tarek-2aa50',
    databaseURL: 'https://mobile-tarek-2aa50-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'mobile-tarek-2aa50.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9hyfj6sC4XiyoGj5tFjYu1xGEAH8eAkY',
    appId: '1:407480833153:ios:73cdbc0654f397a421a980',
    messagingSenderId: '407480833153',
    projectId: 'mobile-tarek-2aa50',
    databaseURL: 'https://mobile-tarek-2aa50-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'mobile-tarek-2aa50.firebasestorage.app',
    iosBundleId: 'com.example.sens',
  );
}
