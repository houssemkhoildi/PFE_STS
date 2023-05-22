import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBkExRlrGaw4PaCHWY2QdRR-jTvVB4PzpM",
            authDomain: "pfehou.firebaseapp.com",
            projectId: "pfehou",
            storageBucket: "pfehou.appspot.com",
            messagingSenderId: "501785342534",
            appId: "1:501785342534:web:4f8640d45b01856f7dd047",
            measurementId: "G-P9C0QD35ES"));
  } else {
    await Firebase.initializeApp();
  }
}
