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

Future<void> addRequestDocument(
    int tableNumber, DocumentReference userRef) async {
  // Check if there are any existing documents in the "request" collection
  final QuerySnapshot requestSnapshot =
      await FirebaseFirestore.instance.collection('request').limit(1).get();

  // If there are no existing documents, proceed with adding a new document
  if (requestSnapshot.docs.isEmpty) {
    // Perform a query on the "productsOrder" collection
    final QuerySnapshot productsSnapshot = await FirebaseFirestore.instance
        .collection('productsOrder')
        .where('table_number', isEqualTo: tableNumber)
        .where('isSelected', isEqualTo: true)
        .where('userRef', isEqualTo: userRef)
        .get();

    // Iterate through the retrieved documents
    for (final DocumentSnapshot productDoc in productsSnapshot.docs) {
      final Map<String, dynamic>? productData =
          productDoc.data() as Map<String, dynamic>?;

      if (productData != null) {
        // Create a new document in the "request" collection
        await FirebaseFirestore.instance.collection('request').add({
          'menuDish': productData['menuDish'],
          'cantidad': productData['amount'],
          'subtotal': productData['price'],
        });
      }
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
