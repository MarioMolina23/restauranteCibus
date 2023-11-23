import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dish_types_component_widget.dart' show DishTypesComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DishTypesComponentModel
    extends FlutterFlowModel<DishTypesComponentWidget> {
  ///  Local state fields for this component.

  List<String> dishTypes = [];
  void addToDishTypes(String item) => dishTypes.add(item);
  void removeFromDishTypes(String item) => dishTypes.remove(item);
  void removeAtIndexFromDishTypes(int index) => dishTypes.removeAt(index);
  void insertAtIndexInDishTypes(int index, String item) =>
      dishTypes.insert(index, item);
  void updateDishTypesAtIndex(int index, Function(String) updateFn) =>
      dishTypes[index] = updateFn(dishTypes[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.

  Map<MenuDishTypesRecord, bool> checkboxValueMap = {};
  List<MenuDishTypesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
