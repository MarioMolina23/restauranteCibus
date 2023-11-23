import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dish_types_component_widget.dart';
import '/components/guardado_exitosamente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'editar_platillo_widget.dart' show EditarPlatilloWidget;
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

class EditarPlatilloModel extends FlutterFlowModel<EditarPlatilloWidget> {
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
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtPrecio widget.
  FocusNode? txtPrecioFocusNode;
  TextEditingController? txtPrecioController;
  final txtPrecioMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtPrecioControllerValidator;
  String? _txtPrecioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // Model for dish_types_component component.
  late DishTypesComponentModel dishTypesComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtPrecioControllerValidator = _txtPrecioControllerValidator;
    dishTypesComponentModel =
        createModel(context, () => DishTypesComponentModel());
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtPrecioFocusNode?.dispose();
    txtPrecioController?.dispose();

    dishTypesComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
