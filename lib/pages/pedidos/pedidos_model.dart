import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dashboard_widget.dart';
import '/components/detalle_orden_widget.dart';
import '/components/producto_cantidad_insuficiente_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'pedidos_widget.dart' show PedidosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PedidosModel extends FlutterFlowModel<PedidosWidget> {
  ///  Local state fields for this page.

  int total = 0;

  int subtotal = 0;

  int impuesto = 0;

  int descuento = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - totalListAction] action in Pedidos widget.
  int? totalListOutput4;
  // Stores action output result for [Custom Action - calcularImpuestoAction] action in Pedidos widget.
  int? impuestoOutput4;
  // Stores action output result for [Custom Action - calcularTotalFinalAction] action in Pedidos widget.
  int? totalFinalOutput4;
  // Stores action output result for [Custom Action - calcularDescuentoAction] action in Pedidos widget.
  int? descuentoOutput4;
  // Model for Dashboard component.
  late DashboardModel dashboardModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Custom Action - totalListAction] action in btnAgregar widget.
  int? totalListOutput3;
  // Stores action output result for [Custom Action - calcularImpuestoAction] action in btnAgregar widget.
  int? impuestoOutput3;
  // Stores action output result for [Custom Action - calcularTotalFinalAction] action in btnAgregar widget.
  int? totalFinalOutput3;
  // Stores action output result for [Custom Action - calcularDescuentoAction] action in btnAgregar widget.
  int? descuentoOutput3;
  List<RequestRecord>? listViewPreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in ListView widget.
  List<RequestRecord>? request;
  // Stores action output result for [Custom Action - totalListAction] action in ListView widget.
  int? totalListOutput;
  // Stores action output result for [Custom Action - calcularImpuestoAction] action in ListView widget.
  int? impuestoOutput;
  // Stores action output result for [Custom Action - calcularTotalFinalAction] action in ListView widget.
  int? totalFinalOutput;
  // Stores action output result for [Custom Action - calcularDescuentoAction] action in ListView widget.
  int? descuentoOutput2;
  // State field(s) for txtDescuento widget.
  FocusNode? txtDescuentoFocusNode;
  TextEditingController? txtDescuentoController;
  String? Function(BuildContext, String?)? txtDescuentoControllerValidator;
  // Stores action output result for [Custom Action - totalListAction] action in txtDescuento widget.
  int? totalListOutput2;
  // Stores action output result for [Custom Action - calcularImpuestoAction] action in txtDescuento widget.
  int? impuestoOutput2;
  // Stores action output result for [Custom Action - calcularDescuentoAction] action in txtDescuento widget.
  int? descuentoOutput;
  // Stores action output result for [Custom Action - calcularTotalFinalAction] action in txtDescuento widget.
  int? totalFinalOutput2;
  // Stores action output result for [Custom Action - deletedocsorderItemsInventoryTemp] action in Button widget.
  int? resuladodeletedocsorderItemsInventoryTemp;
  // Stores action output result for [Custom Action - subtractIngredientsFromMenu] action in Button widget.
  String? resultadoRestaInventario;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashboardModel = createModel(context, () => DashboardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    dashboardModel.dispose();
    txtDescuentoFocusNode?.dispose();
    txtDescuentoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
