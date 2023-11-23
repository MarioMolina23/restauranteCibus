import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'detalle_orden_modificar_widget.dart' show DetalleOrdenModificarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalleOrdenModificarModel
    extends FlutterFlowModel<DetalleOrdenModificarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DescriptionModify widget.
  FocusNode? descriptionModifyFocusNode;
  TextEditingController? descriptionModifyController;
  String? Function(BuildContext, String?)? descriptionModifyControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    descriptionModifyFocusNode?.dispose();
    descriptionModifyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
