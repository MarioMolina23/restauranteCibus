import '/backend/backend.dart';
import '/components/dashboard_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bitacora_widget.dart' show BitacoraWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BitacoraModel extends FlutterFlowModel<BitacoraWidget> {
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
