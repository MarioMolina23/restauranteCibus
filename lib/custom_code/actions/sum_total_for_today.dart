// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> sumTotalForToday(DateTime selectedDay) async {
  // Get the start and end of the current day
  DateTime startOfDay =
      DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0, 0);
  DateTime endOfDay = DateTime(
      selectedDay.year, selectedDay.month, selectedDay.day, 23, 59, 59);

  // Query the "orders" collection and filter by creation_date
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('orders')
      .where('creation_date', isGreaterThanOrEqualTo: startOfDay)
      .where('creation_date', isLessThanOrEqualTo: endOfDay)
      .get();

  // Throw an exception if the query returns an empty result
  if (querySnapshot.docs.isEmpty) {
    return 0;
  }

  // Sum the "total" attribute of each document
  int sum = 0;
  querySnapshot.docs.forEach((doc) {
    sum += (doc.data() as Map<String, dynamic>)['total'] as int;
  });

  return sum;
}
