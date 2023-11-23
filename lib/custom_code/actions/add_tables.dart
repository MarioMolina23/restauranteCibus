// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addTables(int numTables) async {
  final collectionRef = FirebaseFirestore.instance.collection('tables');

  // Eliminar todos los documentos de la colección "tables"
  final snapshot = await collectionRef.get();
  for (final doc in snapshot.docs) {
    await doc.reference.delete();
  }

  // Crear nuevos documentos en secuencia
  for (int i = 1; i <= numTables; i++) {
    await collectionRef.add({'numberTable': i, 'isSelected': false});
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
