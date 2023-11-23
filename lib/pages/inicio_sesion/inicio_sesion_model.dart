import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/error_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'inicio_sesion_widget.dart' show InicioSesionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioSesionModel extends FlutterFlowModel<InicioSesionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for txt_correo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoController;
  String? Function(BuildContext, String?)? txtCorreoControllerValidator;
  String? _txtCorreoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return 'Favor ingresar un correo válido ';
    }
    return null;
  }

  // State field(s) for txt_clave widget.
  FocusNode? txtClaveFocusNode;
  TextEditingController? txtClaveController;
  late bool txtClaveVisibility;
  String? Function(BuildContext, String?)? txtClaveControllerValidator;
  String? _txtClaveControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (val.length < 6) {
      return 'La contraseña debe tener mínimo 6 caracteres';
    }
    if (val.length > 15) {
      return 'La contraseña excede los 18 caracteres';
    }
    if (!RegExp('').hasMatch(val)) {
      return 'Favor ingresar una contraseña válida';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtCorreoControllerValidator = _txtCorreoControllerValidator;
    txtClaveVisibility = false;
    txtClaveControllerValidator = _txtClaveControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtClaveFocusNode?.dispose();
    txtClaveController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
