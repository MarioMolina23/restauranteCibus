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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'agregar_usuario_widget.dart' show AgregarUsuarioWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AgregarUsuarioModel extends FlutterFlowModel<AgregarUsuarioWidget> {
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

  // State field(s) for txtContrasena widget.
  FocusNode? txtContrasenaFocusNode;
  TextEditingController? txtContrasenaController;
  late bool txtContrasenaVisibility;
  String? Function(BuildContext, String?)? txtContrasenaControllerValidator;
  String? _txtContrasenaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '*Campo Obligatorio';
    }

    if (val.length < 6) {
      return 'La contraseña debe tener mínimo 6 caractéres';
    }
    if (val.length > 12) {
      return 'La contraseña excede los 12 caracteres';
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#\$%^&+=!¡¿?*.,;:_-])(?!.*\\s).*\$')
        .hasMatch(val)) {
      return 'Debe contener al menos una letra mayúscula, minúscula,  un dígito y un carácter especial.';
    }
    return null;
  }

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

  // State field(s) for txtNumero widget.
  FocusNode? txtNumeroFocusNode;
  TextEditingController? txtNumeroController;
  final txtNumeroMask = MaskTextInputFormatter(mask: '####-####');
  String? Function(BuildContext, String?)? txtNumeroControllerValidator;
  String? _txtNumeroControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for txtRol widget.
  String? txtRolValue;
  FormFieldController<String>? txtRolValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtNombreControllerValidator = _txtNombreControllerValidator;
    txtContrasenaVisibility = false;
    txtContrasenaControllerValidator = _txtContrasenaControllerValidator;
    txtCorreoControllerValidator = _txtCorreoControllerValidator;
    txtNumeroControllerValidator = _txtNumeroControllerValidator;
    txtSalarioControllerValidator = _txtSalarioControllerValidator;
  }

  void dispose() {
    txtNombreFocusNode?.dispose();
    txtNombreController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaController?.dispose();

    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtNumeroFocusNode?.dispose();
    txtNumeroController?.dispose();

    txtSalarioFocusNode?.dispose();
    txtSalarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
