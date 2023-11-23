// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Custom Action: copyDocumentsToOrderItemsInventoryTemp
Future<void> copyDocumentsToOrderItemsInventoryTemp(int tableNumber) async {
  // Retrieve all documents from the "request" collection
  var requestDocuments =
      await FirebaseFirestore.instance.collection('request').get();

  // Iterate through the retrieved documents
  for (var requestDocument in requestDocuments.docs) {
    // Create a new document in the "orderItemsInventoryTemp" collection
    await FirebaseFirestore.instance
        .collection('orderItemsInventoryTemp')
        .doc()
        .set({
      'menuRef': requestDocument.data()['menuDish'],
      'cantidad': requestDocument.data()['cantidad'],
      'tableNumber': tableNumber,
    });
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
