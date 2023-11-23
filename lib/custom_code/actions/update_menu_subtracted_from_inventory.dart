// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateMenuSubtractedFromInventory(int tableNumber) async {
  CollectionReference menuCollection =
      FirebaseFirestore.instance.collection('menu');

  QuerySnapshot menuSnapshot = await menuCollection.get();

  for (DocumentSnapshot doc in menuSnapshot.docs) {
    await menuCollection.doc(doc.id).update({
      'subtractedFromInventory': false,
    });
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
