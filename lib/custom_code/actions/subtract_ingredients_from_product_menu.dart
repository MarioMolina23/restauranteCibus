// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> subtractIngredientsFromProductMenu(DocumentReference productRef,
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
      currentlyAvailableStock -= ingredientQuantity;
    } else {
      currentlyAvailableStock -= productUnitsUsed;
    }

    await productRef
        .update({'currently_available_stock': currentlyAvailableStock});
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
