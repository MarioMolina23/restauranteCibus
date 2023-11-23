// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> totalListAction(
  List<int> subTotal,
  DocumentReference userRef,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final QuerySnapshot productsSnapshot = await FirebaseFirestore.instance
      .collection('request')
      .where('userRef', isEqualTo: userRef)
      .get();

  double total = 0;
  for (int add in subTotal) {
    total += add;
  }
  total = (total * 100.0) /
      100.0; // Not sure why you're doing this, but I kept it as it was in your original code
  return total.toInt();

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
