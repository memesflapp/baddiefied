import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB5fv-xbtkmjrq_FwlXBXSI2xCXLDN7AoA",
            authDomain: "flapp-meme.firebaseapp.com",
            databaseURL: "https://flapp-meme-default-rtdb.firebaseio.com",
            projectId: "flapp-meme",
            storageBucket: "flapp-meme.firebasestorage.app",
            messagingSenderId: "964930490684",
            appId: "1:964930490684:web:b39b7aa9d48d72aad98e39",
            measurementId: "G-FG7VWMXD28"));
  } else {
    await Firebase.initializeApp();
  }
}

