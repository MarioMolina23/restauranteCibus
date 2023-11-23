import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'gestion_mesas_widget.dart' show GestionMesasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GestionMesasModel extends FlutterFlowModel<GestionMesasWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtMesas widget.
  FocusNode? txtMesasFocusNode;
  TextEditingController? txtMesasController;
  String? Function(BuildContext, String?)? txtMesasControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtMesasFocusNode?.dispose();
    txtMesasController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
