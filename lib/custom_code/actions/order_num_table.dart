// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future orderNumTable() async {
  // Ordenar ascendentemente los numeros de una lista de un AppState
// Assuming the list of numbers is stored in a variable called "numList" in the AppState

  //List<int> sortedList = List.from(FFAppState().numTable); // Create a copy of the list to avoid modifying the original list
  var sortedList = FFAppState().numTable.toList()
    ..sort((a, b) => a - b); // Sort the copy of the list in ascending order
  FFAppState().numTable =
      sortedList; // Update the original list in the AppState with the sorted list}
}
