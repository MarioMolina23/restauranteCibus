import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'cambiar_correo_widget.dart' show CambiarCorreoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CambiarCorreoModel extends FlutterFlowModel<CambiarCorreoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for txtCorreoNuevo widget.
  FocusNode? txtCorreoNuevoFocusNode;
  TextEditingController? txtCorreoNuevoController;
  String? Function(BuildContext, String?)? txtCorreoNuevoControllerValidator;
  String? _txtCorreoNuevoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return 'Favor ingresar un correo válido';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtCorreoNuevoControllerValidator = _txtCorreoNuevoControllerValidator;
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    txtCorreoNuevoFocusNode?.dispose();
    txtCorreoNuevoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
