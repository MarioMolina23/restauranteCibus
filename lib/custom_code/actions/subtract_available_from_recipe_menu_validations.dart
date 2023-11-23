// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> subtractAvailableFromRecipeMenuValidations(
    DocumentReference recipeRef,
    double ingredientQuantity,
    String ingredientUnitOfMeasure) async {
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
        String name = recipeData['name'];
        return name;
      }
    } else {
      if (currentlyAvailableStock < recipeUnitsUsed) {
        String name = recipeData['name'];
        return name;
      }
    }

    if (currentlyAvailableStock < 0) {
      String name = recipeData['name'];
      return name;
    }
  }
  return '';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
