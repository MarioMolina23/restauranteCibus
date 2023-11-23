import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'editar_usuario_widget.dart' show EditarUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditarUsuarioModel extends FlutterFlowModel<EditarUsuarioWidget> {
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
      return '*Campo Obligatorio';
    }

    if (!RegExp('^[a-zA-ZáéíóúÁÉÍÓÚ\\s]+\$').hasMatch(val)) {
      return 'No se aceptan caracteres especiales';
    }
    return null;
  }

  // State field(s) for txtRol widget.
  String? txtRolValue;
  FormFieldController<String>? txtRolValueController;
  // State field(s) for txtCorreo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoController;
  String? Function(BuildContext, String?)? txtCorreoControllerValidator;
  String? _txtCorreoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (!RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$')
        .hasMatch(val)) {
      return 'Ingrese una dirección de correo válida';
    }
    return null;
  }

  // State field(s) for txtTelefono widget.
  FocusNode? txtTelefonoFocusNode;
  TextEditingController? txtTelefonoController;
  final txtTelefonoMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtTelefonoControllerValidator;
  String? _txtTelefonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (val.length < 9) {
      return 'El número debe contener 8 dígitos';
    }
    if (val.length > 9) {
      return 'El número debe contener 8 dígitos';
    }

    return null;
  }

  // State field(s) for txtSalario widget.
  FocusNode? txtSalarioFocusNode;
  TextEditingController? txtSalarioController;
  String? Function(BuildContext, String?)? txtSalarioControllerValidator;
  String? _txtSalarioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (val.length > 9) {
      return 'El número no puede sobrepasar los 9 dígitos';
    }

    return null;
  }

  // State field(s) for txtEstado widget.
  String? txtEstadoValue;
  FormFieldController<String>? txtEstadoValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtCorreoControllerValidator = _txtCorreoControllerValidator;
    txtTelefonoControllerValidator = _txtTelefonoControllerValidator;
    txtSalarioControllerValidator = _txtSalarioControllerValidator;
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtTelefonoFocusNode?.dispose();
    txtTelefonoController?.dispose();

    txtSalarioFocusNode?.dispose();
    txtSalarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
