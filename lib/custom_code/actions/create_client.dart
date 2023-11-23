// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<String> createClient(
    // Parametros
    String emailAddress, //Email from Widget State
    String displayName,
    String imagen,
    String front,
    String password, //Password from Widget State
    String randomDocGen, //Random String (min 10 max 25 - upper/lowe/digits)
    String phoneNumber,
    String role,
    double salary,
    String status) async {
  //Crear el usuario
  String returnmsg = 'Usuario creado';
  //momento justo de la creacion porque es parte de la colección de users este campo
  DateTime createdTime = DateTime.now();
  //App virtual para logear este nuevo user sin tener que salirme de mi usuario admin
  FirebaseApp app = await Firebase.initializeApp(
      name: randomDocGen, options: Firebase.app().options);

  try {
    //crear user con sus credenciales
    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(
            email: emailAddress, password: password);
    // user ID
    String? uid = userCredential.user?.uid;
    // verificar que no esté null
    if (uid != null) {
      //crear documento basado en su referencia
      final CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection('users');

      usersRef.doc(uid).set({
        'uid': uid,
        'display_name': displayName,
        'photo_url': imagen,
        'email': emailAddress,
        'created_time': createdTime,
        'phone_number': phoneNumber,
        'role': role,
        'salary': salary,
        'status': status,
      });
      return returnmsg;
    } else {
      return "Error creando usuario, intente de nuevo";
    }
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
