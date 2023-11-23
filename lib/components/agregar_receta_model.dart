import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/unidades_medida_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'agregar_receta_widget.dart' show AgregarRecetaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarRecetaModel extends FlutterFlowModel<AgregarRecetaWidget> {
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
      return 'Campo requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for txtCantDisponible widget.
  FocusNode? txtCantDisponibleFocusNode;
  TextEditingController? txtCantDisponibleController;
  String? Function(BuildContext, String?)? txtCantDisponibleControllerValidator;
  String? _txtCantDisponibleControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for txtCantMinima widget.
  FocusNode? txtCantMinimaFocusNode;
  TextEditingController? txtCantMinimaController;
  String? Function(BuildContext, String?)? txtCantMinimaControllerValidator;
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
      return 'Campo requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtCantDisponibleControllerValidator =
        _txtCantDisponibleControllerValidator;
    unidadesMedidaModel = createModel(context, () => UnidadesMedidaModel());
    txtOneItemEqualsToControllerValidator =
        _txtOneItemEqualsToControllerValidator;
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtCantDisponibleFocusNode?.dispose();
    txtCantDisponibleController?.dispose();

    txtCantMinimaFocusNode?.dispose();
    txtCantMinimaController?.dispose();

    unidadesMedidaModel.dispose();
    txtOneItemEqualsToFocusNode?.dispose();
    txtOneItemEqualsToController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
