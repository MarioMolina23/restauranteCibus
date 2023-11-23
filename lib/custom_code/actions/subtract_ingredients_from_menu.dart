// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> subtractIngredientsFromMenu(int tableNumber) async {
  var orderItems = await FirebaseFirestore.instance
      .collection('orderItemsInventoryTemp')
      .where('tableNumber', isEqualTo: tableNumber)
      .get();

  String errors = ''; // Initialize errors string to an empty string
  bool subtractedFromInventory =
      false; // Initialize subtractedFromInventory variable

  for (var orderItem in orderItems.docs) {
    var menuRef = orderItem.data()['menuRef'];
    var cantidad = orderItem.data()['cantidad'];

    // Get subtractedFromInventory
    var menuSnapshot = await menuRef.get();
    subtractedFromInventory =
        menuSnapshot.data()?['subtractedFromInventory'] ?? false;

    // Check subtractedFromInventory
    if (subtractedFromInventory == false) {
      var dishIngredients = await FirebaseFirestore.instance
          .collection('menu')
          .doc(menuRef.id)
          .collection('dish_ingredients')
          .get();

      //validates
      for (var document in dishIngredients.docs) {
        if (document.data()['product_ref'] != null) {
          // Call subtractIngredientsFromProduct custom action
          String subtractResult =
              await subtractIngredientsFromProductMenuValidations(
                  document.data()['product_ref'],
                  document.data()['quantity'] * cantidad,
                  document.data()['unit_of_measure']);
          if (subtractResult.isNotEmpty) {
            errors += subtractResult + ', '; // Concatenate errors to the string
          }
        } else if (document.data()['recipe_ref'] != null) {
          // Call subtractAvailableFromRecipe custom action
          String subtractResult =
              await subtractAvailableFromRecipeMenuValidations(
                  document.data()['recipe_ref'],
                  document.data()['quantity'] * cantidad,
                  document.data()['unit_of_measure']);
          if (subtractResult.isNotEmpty) {
            errors += subtractResult + ', '; // Concatenate errors to the string
          }
        }
      }

      if (errors.isNotEmpty) {
        return errors; // If there are errors, return them directly
      }

      //subtracs
      for (var document in dishIngredients.docs) {
        if (document.data()['product_ref'] != null) {
          // Call subtractIngredientsFromProduct custom action
          await subtractIngredientsFromProductMenu(
              document.data()['product_ref'],
              document.data()['quantity'] * cantidad,
              document.data()['unit_of_measure']);

          // Check if currently_available_stock is less than or equal to min_available_stock
          var productRef = document.data()['product_ref'];
          var productSnapshot = await FirebaseFirestore.instance
              .collection('products')
              .doc(productRef.id)
              .get();
          var currentlyAvailableStock =
              productSnapshot.data()?['currently_available_stock'];
          var minAvailableStock =
              productSnapshot.data()?['min_available_stock'];
          var productName = productSnapshot.data()?['product_name'];
          if (currentlyAvailableStock <= minAvailableStock) {
            // Create a new document in the notifications collection
            await FirebaseFirestore.instance.collection('notifications').add({
              'Message':
                  'El producto "$productName" ha alcanzado su cantidad mínima en el inventario.',
              'NotifType': 'Inventario',
              'Title': '¡Reposición de Inventario Necesaria!',
              'Time': DateTime.now(),
            });
          }
        } else if (document.data()['recipe_ref'] != null) {
          // Call subtractAvailableFromRecipe custom action
          await subtractAvailableFromRecipeMenu(
              document.data()['recipe_ref'],
              document.data()['quantity'] * cantidad,
              document.data()['unit_of_measure']);
        }
      }

      // Update subtractedFromInventory
      await menuSnapshot.reference.update({'subtractedFromInventory': true});
    }
  }

  return '';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
