import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCYLtSdvarFvnPdQsq58RNjyi8_wBn_uIw",
            authDomain: "job-alert-t7r2au.firebaseapp.com",
            projectId: "job-alert-t7r2au",
            storageBucket: "job-alert-t7r2au.appspot.com",
            messagingSenderId: "447330700217",
            appId: "1:447330700217:web:7723ed76ee44f8ba2e8468"));
  } else {
    await Firebase.initializeApp();
  }
}
