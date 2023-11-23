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

Future<int> subtractAvailableFromRecipeNotInUse(DocumentReference recipeRef,
    double ingredientQuantity, String ingredientUnitOfMeasure) async {
  DocumentSnapshot<Object?> recipeSnapshot = await recipeRef.get();
  Map<String, dynamic>? recipeData =
      recipeSnapshot.data() as Map<String, dynamic>?;

  if (recipeData != null) {
    double oneItemEqualsTo = recipeData['one_item_equals_to'];

    double convertedIngredientQuantity;
    if (ingredientUnitOfMeasure == 'g') {
      convertedIngredientQuantity = ingredientQuantity / 1000;
    } else if (ingredientUnitOfMeasure == 'ml') {
      convertedIngredientQuantity = ingredientQuantity / 1000;
    } else {
      convertedIngredientQuantity = ingredientQuantity;
    }

    double recipeUnitsUsed = convertedIngredientQuantity / oneItemEqualsTo;

    double currentlyAvailableStock = recipeData['available_quantity'];
    if (ingredientUnitOfMeasure == 'Por unidad') {
      if (currentlyAvailableStock < ingredientQuantity) {
        return 2;
      }
      currentlyAvailableStock -= ingredientQuantity;
    } else {
      if (currentlyAvailableStock < recipeUnitsUsed) {
        return 2;
      }
      currentlyAvailableStock -= recipeUnitsUsed;
    }

    await recipeRef.update({'available_quantity': currentlyAvailableStock});
    return 1;
  }
  return 2;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
