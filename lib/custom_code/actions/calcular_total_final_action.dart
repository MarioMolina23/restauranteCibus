// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> calcularTotalFinalAction(
  int descuento,
  List<int> subtotal,
  DocumentReference userRef,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE\

  final QuerySnapshot productsSnapshot = await FirebaseFirestore.instance
      .collection('request')
      .where('userRef', isEqualTo: userRef)
      .get();

  double impuesto = 0;
  double total = 0;
  double porcentajeDescuento = 0;
  double descuentoTotal = 0;
  double totalFinal = 0;

  for (int add in subtotal) {
    total += add;
    impuesto = total * 0.13;
    porcentajeDescuento = descuento / 100;
    descuentoTotal = (total + impuesto) * porcentajeDescuento;
    totalFinal = (total + impuesto) - descuentoTotal;
  }

  return totalFinal.toInt();

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
