import '/auth/firebase_auth/auth_util.dart';
import '/components/cambiar_correo_widget.dart';
import '/components/dashboard_widget.dart';
import '/components/eliminar_cuenta_widget.dart';
import '/components/gestion_menu_types_widget.dart';
import '/components/gestion_mesas_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'general_widget.dart' show GeneralWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeneralModel extends FlutterFlowModel<GeneralWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Dashboard component.
  late DashboardModel dashboardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashboardModel = createModel(context, () => DashboardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dashboardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
