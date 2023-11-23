import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'agregar_ingrediente_tipo_receta_paso2_platillo_widget.dart'
    show AgregarIngredienteTipoRecetaPaso2PlatilloWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AgregarIngredienteTipoRecetaPaso2PlatilloModel
    extends FlutterFlowModel<AgregarIngredienteTipoRecetaPaso2PlatilloWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  RecipesRecord? recetaSeleccionadaParaIngrediente;
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreController;
  String? Function(BuildContext, String?)? txtNombreControllerValidator;
  String? _txtNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for txtQuantity widget.
  FocusNode? txtQuantityFocusNode;
  TextEditingController? txtQuantityController;
  final txtQuantityMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtQuantityControllerValidator;
  String? _txtQuantityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtQuantityControllerValidator = _txtQuantityControllerValidator;
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtQuantityFocusNode?.dispose();
    txtQuantityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
