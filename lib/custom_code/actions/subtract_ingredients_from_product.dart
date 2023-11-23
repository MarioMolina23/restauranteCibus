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

Future<int> subtractIngredientsFromProduct(DocumentReference productRef,
    double ingredientQuantity, String ingredientUnitOfMeasure) async {
  DocumentSnapshot<Object?> productSnapshot = await productRef.get();
  Map<String, dynamic>? productData =
      productSnapshot.data() as Map<String, dynamic>?;

  if (productData != null) {
    double oneItemEqualsTo = productData['one_item_equals_to'];

    double convertedIngredientQuantity;
    if (ingredientUnitOfMeasure == 'g') {
      convertedIngredientQuantity = ingredientQuantity / 1000;
    } else if (ingredientUnitOfMeasure == 'ml') {
      convertedIngredientQuantity = ingredientQuantity / 1000;
    } else {
      convertedIngredientQuantity = ingredientQuantity;
    }

    double productUnitsUsed = convertedIngredientQuantity / oneItemEqualsTo;

    double currentlyAvailableStock = productData['currently_available_stock'];
    if (ingredientUnitOfMeasure == 'Por unidad') {
      if (currentlyAvailableStock >= ingredientQuantity) {
        currentlyAvailableStock -= ingredientQuantity;
      } else {
        return 2;
      }
    } else {
      if (currentlyAvailableStock >= productUnitsUsed) {
        currentlyAvailableStock -= productUnitsUsed;
      } else {
        return 2;
      }
    }

    if (currentlyAvailableStock < 0) {
      return 2;
    }

    await productRef
        .update({'currently_available_stock': currentlyAvailableStock});
    return 1;
  }
  return 2;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
