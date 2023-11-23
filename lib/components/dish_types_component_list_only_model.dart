import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dish_types_component_list_only_widget.dart'
    show DishTypesComponentListOnlyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DishTypesComponentListOnlyModel
    extends FlutterFlowModel<DishTypesComponentListOnlyWidget> {
  ///  Local state fields for this component.

  List<String> dishTypes = [];
  void addToDishTypes(String item) => dishTypes.add(item);
  void removeFromDishTypes(String item) => dishTypes.remove(item);
  void removeAtIndexFromDishTypes(int index) => dishTypes.removeAt(index);
  void insertAtIndexInDishTypes(int index, String item) =>
      dishTypes.insert(index, item);
  void updateDishTypesAtIndex(int index, Function(String) updateFn) =>
      dishTypes[index] = updateFn(dishTypes[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
