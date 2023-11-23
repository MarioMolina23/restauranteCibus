// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateOrderRef(
  DocumentReference orderRef,
  int tableNumber,
) async {
  await FirebaseFirestore.instance
      .collection('productsOrder')
      .where('table_number', isEqualTo: tableNumber)
      .where('isSelected', isEqualTo: true)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      doc.reference.update({'orderRef': orderRef});
    });
  });
}
