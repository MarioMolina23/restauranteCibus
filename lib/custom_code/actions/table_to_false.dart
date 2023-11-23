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

export 'package:cloud_firestore/cloud_firestore.dart';

Future<void> tableToFalse(int table) async {
  final tablesRef = FirebaseFirestore.instance.collection('tables');
  final querySnapshot =
      await tablesRef.where('numberTable', isEqualTo: table).get();
  final docs = querySnapshot.docs;
  for (final doc in docs) {
    await doc.reference.update({'isSelected': false});
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
