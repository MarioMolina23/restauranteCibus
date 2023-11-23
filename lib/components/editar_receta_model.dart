import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/guardado_exitosamente_widget.dart';
import '/components/unidades_medida_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'editar_receta_widget.dart' show EditarRecetaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarRecetaModel extends FlutterFlowModel<EditarRecetaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

  // State field(s) for txtCurrentlyAvailableStock widget.
  FocusNode? txtCurrentlyAvailableStockFocusNode;
  TextEditingController? txtCurrentlyAvailableStockController;
  final txtCurrentlyAvailableStockMask =
      MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)?
      txtCurrentlyAvailableStockControllerValidator;
  String? _txtCurrentlyAvailableStockControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // State field(s) for txtCantMinima widget.
  FocusNode? txtCantMinimaFocusNode;
  TextEditingController? txtCantMinimaController;
  String? Function(BuildContext, String?)? txtCantMinimaControllerValidator;
  String? _txtCantMinimaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // State field(s) for txtUnitOfMeasure widget.
  FocusNode? txtUnitOfMeasureFocusNode;
  TextEditingController? txtUnitOfMeasureController;
  String? Function(BuildContext, String?)? txtUnitOfMeasureControllerValidator;
  String? _txtUnitOfMeasureControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // Model for unidadesMedida component.
  late UnidadesMedidaModel unidadesMedidaModel;
  // State field(s) for txtOneItemEqualsTo widget.
  FocusNode? txtOneItemEqualsToFocusNode;
  TextEditingController? txtOneItemEqualsToController;
  String? Function(BuildContext, String?)?
      txtOneItemEqualsToControllerValidator;
  String? _txtOneItemEqualsToControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtCurrentlyAvailableStockControllerValidator =
        _txtCurrentlyAvailableStockControllerValidator;
    txtCantMinimaControllerValidator = _txtCantMinimaControllerValidator;
    txtUnitOfMeasureControllerValidator = _txtUnitOfMeasureControllerValidator;
    unidadesMedidaModel = createModel(context, () => UnidadesMedidaModel());
    txtOneItemEqualsToControllerValidator =
        _txtOneItemEqualsToControllerValidator;
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtCurrentlyAvailableStockFocusNode?.dispose();
    txtCurrentlyAvailableStockController?.dispose();

    txtCantMinimaFocusNode?.dispose();
    txtCantMinimaController?.dispose();

    txtUnitOfMeasureFocusNode?.dispose();
    txtUnitOfMeasureController?.dispose();

    unidadesMedidaModel.dispose();
    txtOneItemEqualsToFocusNode?.dispose();
    txtOneItemEqualsToController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
