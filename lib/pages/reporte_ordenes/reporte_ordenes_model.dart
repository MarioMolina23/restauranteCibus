import '/backend/backend.dart';
import '/components/dashboard_widget.dart';
import '/components/ver_detalles_orden_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'reporte_ordenes_widget.dart' show ReporteOrdenesWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReporteOrdenesModel extends FlutterFlowModel<ReporteOrdenesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Dashboard component.
  late DashboardModel dashboardModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  List<OrdersRecord>? listViewPreviousSnapshot;
  // Stores action output result for [Custom Action - sumTotalForToday] action in ListView widget.
  int? total;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashboardModel = createModel(context, () => DashboardModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    unfocusNode.dispose();
    dashboardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
