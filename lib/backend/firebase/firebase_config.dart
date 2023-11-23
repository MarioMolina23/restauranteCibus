import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAn3pM3iKmpRd-RU50TVxeliNHQmAq_V1o",
            authDomain: "restaurantecibus-73467.firebaseapp.com",
            projectId: "restaurantecibus-73467",
            storageBucket: "restaurantecibus-73467.appspot.com",
            messagingSenderId: "764230122638",
            appId: "1:764230122638:web:2b7ec5a8ece79878a05ddf",
            measurementId: "G-SK3DZZEHFF"));
  } else {
    await Firebase.initializeApp();
  }
}
