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

Future<void> changeStateProduct(
  int mesa,
) async {
  await FirebaseFirestore.instance
      .collection('productsOrder')
      .where('table_number', isEqualTo: mesa)
      .where('isSelected', isEqualTo: true)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      doc.reference.update({'isSelected': false});
    });
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
