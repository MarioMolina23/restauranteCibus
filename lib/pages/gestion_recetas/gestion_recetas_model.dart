import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/agregar_receta_widget.dart';
import '/components/dashboard_widget.dart';
import '/components/editar_receta_widget.dart';
import '/components/eliminado_exitosamente_widget.dart';
import '/components/ingredientes_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'gestion_recetas_widget.dart' show GestionRecetasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GestionRecetasModel extends FlutterFlowModel<GestionRecetasWidget> {
  ///  Local state fields for this page.

  DocumentReference? recetaSeleccionada;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Dashboard component.
  late DashboardModel dashboardModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashboardModel = createModel(context, () => DashboardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dashboardModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
