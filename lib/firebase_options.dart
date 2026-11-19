// File generated for FlutterFire.
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
        return windows;
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
    apiKey: 'AIzaSyAKjzCe-AJ2m5fG92J72oMc3_Jj69EB70g',
    appId: '1:1097279356152:android:a218e77049100f03958f0d',
    messagingSenderId: '1097279356152',
    projectId: 'medibook-67f9f',
    storageBucket: 'medibook-67f9f.firebasestorage.app',
  );
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCGFlDvfroSjouGXUmmUCSVGXcXjYbkId8',
    appId: '1:1097279356152:web:6da54fa39a3180e2958f0d',
    messagingSenderId: '1097279356152',
    projectId: 'medibook-67f9f',
    authDomain: 'medibook-67f9f.firebaseapp.com',
    storageBucket: 'medibook-67f9f.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCm0YiqJ0-1mCCa3RI0eP1dwGW9CWa1HCM',
    appId: '1:1097279356152:ios:c32fd98dcdf79dfa958f0d',
    messagingSenderId: '1097279356152',
    projectId: 'medibook-67f9f',
    storageBucket: 'medibook-67f9f.firebasestorage.app',
    iosBundleId: 'com.example.medibook',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm0YiqJ0-1mCCa3RI0eP1dwGW9CWa1HCM',
    appId: '1:1097279356152:ios:c32fd98dcdf79dfa958f0d',
    messagingSenderId: '1097279356152',
    projectId: 'medibook-67f9f',
    storageBucket: 'medibook-67f9f.firebasestorage.app',
    iosBundleId: 'com.example.medibook',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGFlDvfroSjouGXUmmUCSVGXcXjYbkId8',
    appId: '1:1097279356152:web:e5fb6e4bddeda856958f0d',
    messagingSenderId: '1097279356152',
    projectId: 'medibook-67f9f',
    authDomain: 'medibook-67f9f.firebaseapp.com',
    storageBucket: 'medibook-67f9f.firebasestorage.app',
  );
}
