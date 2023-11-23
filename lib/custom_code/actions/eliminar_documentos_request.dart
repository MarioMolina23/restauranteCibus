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

Future<bool> eliminarDocumentosRequest(
  String nombreColeccion,
  DocumentReference userRef,
) async {
  final QuerySnapshot productsSnapshot = await FirebaseFirestore.instance
      .collection('request')
      .where('userRef', isEqualTo: userRef)
      .get();

  // Create a batch to perform the deletion
  WriteBatch batch = FirebaseFirestore.instance.batch();

  // Add the delete operations to the batch
  productsSnapshot.docs.forEach((doc) {
    batch.delete(doc.reference);
  });

  // Commit the batch to execute the delete operations
  await batch.commit();

  return true;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
