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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBISnpu0XHKCILAQ0YjWQvZfz4SJnOQDPg',
    appId: '1:403060210002:android:63a59199cc4212d409628b',
    messagingSenderId: '403060210002',
    projectId: 'fitbuddy-c4ede',
    storageBucket: 'fitbuddy-c4ede.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAnsDXHGhcGhWEiYsTJnuVZ5ueBAG6chI',
    appId: '1:403060210002:ios:786af3b24f938f7b09628b',
    messagingSenderId: '403060210002',
    projectId: 'fitbuddy-c4ede',
    storageBucket: 'fitbuddy-c4ede.appspot.com',
    iosClientId: '403060210002-iho830loa2h739tgmjsoaga7htods6va.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitBuddy',
  );
}
