import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCbkzo6qaRynC0mJOZvYF8yN_kmLcpK-mw",
            authDomain: "derindalis-d60df.firebaseapp.com",
            projectId: "derindalis-d60df",
            storageBucket: "derindalis-d60df.appspot.com",
            messagingSenderId: "946937447757",
            appId: "1:946937447757:web:be2833ba935b1b8f036304",
            measurementId: "G-XTPEWFVLF7"));
  } else {
    await Firebase.initializeApp();
  }
}
