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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBh_KKzZnck7CnN8d_d9zXUdwh_CZwxf2c',
    appId: '1:999721620627:web:8a7eaf5bad2351b00b2966',
    messagingSenderId: '999721620627',
    projectId: 'snipers-ab879',
    authDomain: 'snipers-ab879.firebaseapp.com',
    storageBucket: 'snipers-ab879.appspot.com',
    measurementId: 'G-CGE41KSLE1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcuyW7Ok-IBcEg7sLxHJRTsN16Cscwphg',
    appId: '1:999721620627:android:94a291a940d86c4c0b2966',
    messagingSenderId: '999721620627',
    projectId: 'snipers-ab879',
    storageBucket: 'snipers-ab879.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCraHAsZTCNSy5LtA_2-hs1S4SriyGZAXU',
    appId: '1:999721620627:ios:997addb35c82aab70b2966',
    messagingSenderId: '999721620627',
    projectId: 'snipers-ab879',
    storageBucket: 'snipers-ab879.appspot.com',
    iosBundleId: 'com.example.snipers',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCraHAsZTCNSy5LtA_2-hs1S4SriyGZAXU',
    appId: '1:999721620627:ios:997addb35c82aab70b2966',
    messagingSenderId: '999721620627',
    projectId: 'snipers-ab879',
    storageBucket: 'snipers-ab879.appspot.com',
    iosBundleId: 'com.example.snipers',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBh_KKzZnck7CnN8d_d9zXUdwh_CZwxf2c',
    appId: '1:999721620627:web:e4329633e189b9290b2966',
    messagingSenderId: '999721620627',
    projectId: 'snipers-ab879',
    authDomain: 'snipers-ab879.firebaseapp.com',
    storageBucket: 'snipers-ab879.appspot.com',
    measurementId: 'G-CB74C9CVQT',
  );
}
