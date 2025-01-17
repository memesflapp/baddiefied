import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD1iLYnquV3qt00EZvXwIXC0We2AbDFXHs",
            authDomain: "inhousecrm-spc.firebaseapp.com",
            projectId: "inhousecrm-spc",
            storageBucket: "inhousecrm-spc.appspot.com",
            messagingSenderId: "836116643878",
            appId: "1:836116643878:web:2d4ebd98af05cdfea6a6e7",
            measurementId: "G-XFGWQQGLKM"));
  } else {
    await Firebase.initializeApp();
  }
}
