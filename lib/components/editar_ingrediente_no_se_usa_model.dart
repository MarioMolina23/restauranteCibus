import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/unidades_medida_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'editar_ingrediente_no_se_usa_widget.dart'
    show EditarIngredienteNoSeUsaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarIngredienteNoSeUsaModel
    extends FlutterFlowModel<EditarIngredienteNoSeUsaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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

  // State field(s) for txtUnitOfMeasure widget.
  FocusNode? txtUnitOfMeasureFocusNode;
  TextEditingController? txtUnitOfMeasureController;
  String? Function(BuildContext, String?)? txtUnitOfMeasureControllerValidator;
  // Model for unidadesMedida component.
  late UnidadesMedidaModel unidadesMedidaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtQuantityControllerValidator = _txtQuantityControllerValidator;
    unidadesMedidaModel = createModel(context, () => UnidadesMedidaModel());
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtQuantityFocusNode?.dispose();
    txtQuantityController?.dispose();

    txtUnitOfMeasureFocusNode?.dispose();
    txtUnitOfMeasureController?.dispose();

    unidadesMedidaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
