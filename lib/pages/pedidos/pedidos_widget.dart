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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pedidos_model.dart';
export 'pedidos_model.dart';

class PedidosWidget extends StatefulWidget {
  const PedidosWidget({
    Key? key,
    required this.numMesaParametro,
    this.taxes,
  }) : super(key: key);

  final int? numMesaParametro;
  final int? taxes;

  @override
  _PedidosWidgetState createState() => _PedidosWidgetState();
}

class _PedidosWidgetState extends State<PedidosWidget> {
  late PedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PedidosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.eliminarDocumentosRequest(
        'request',
        currentUserReference!,
      );
      await actions.changeStateProduct(
        widget.numMesaParametro!,
      );
      setState(() {
        FFAppState().DescripcionOrden = '';
      });
      _model.totalListOutput4 = await actions.totalListAction(
        _model.request!.map((e) => e.subtotal).toList().toList(),
        currentUserReference!,
      );
      _model.impuestoOutput4 = await actions.calcularImpuestoAction(
        _model.request!.map((e) => e.subtotal).toList().toList(),
        currentUserReference!,
      );
      _model.totalFinalOutput4 = await actions.calcularTotalFinalAction(
        _model.txtDescuentoController.text == '0'
            ? 0
            : int.parse(_model.txtDescuentoController.text),
        _model.request!.map((e) => e.subtotal).toList().toList(),
        currentUserReference!,
      );
      _model.descuentoOutput4 = await actions.calcularDescuentoAction(
        int.parse(_model.txtDescuentoController.text),
        _model.request!.map((e) => e.subtotal).toList().toList(),
        currentUserReference!,
      );
      setState(() {
        _model.total = _model.totalFinalOutput4!;
        _model.subtotal = _model.totalListOutput4!;
        _model.impuesto = _model.impuestoOutput4!;
        _model.descuento = _model.descuentoOutput4!;
      });
    });

    _model.txtDescuentoController ??= TextEditingController();
    _model.txtDescuentoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.txtDescuentoController?.text = '0';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.dashboardModel,
                  updateCallback: () => setState(() {}),
                  child: DashboardWidget(
                    ctProfile: Color(0xFFE0E3E7),
                    ctPedido: Color(0xFFFF4858),
                    ctOrdenes: Color(0xFFE0E3E7),
                    ctInventario: Color(0xFFE0E3E7),
                    ctReportes: Color(0xFFE0E3E7),
                    ctBitacora: Color(0xFFE0E3E7),
                    ctNotif: Color(0xFFE0E3E7),
                    iconPerfil: FlutterFlowTheme.of(context).accent1,
                    iconPedido: Colors.white,
                    iconOrden: Color(0xFF616161),
                    iconInventario: Color(0xFF616161),
                    iconReporte: Color(0xFF616161),
                    iconBitacora: Color(0xFF616161),
                    iconNotif: Color(0xFF616161),
                    txtPerfil: Color(0xFF57636C),
                    txtPedido: Colors.white,
                    txtOrden: Color(0xFF57636C),
                    txtInventario: Color(0xFF57636C),
                    txtReporte: Color(0xFF57636C),
                    txtBitacora: Color(0xFF57636C),
                    txtNotif: Color(0xFF57636C),
                    ctGeneral: Color(0xFFE0E3E7),
                    iconGeneral: Color(0xFF616161),
                    txtGeneral: Color(0xFF57636C),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 25.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  'Bienvenido, ${currentUserDisplayName}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 21.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Text(
                                                'Mesa #${widget.numMesaParametro?.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 15.0, 10.0, 15.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: StreamBuilder<
                                            List<MenuDishTypesRecord>>(
                                          stream: queryMenuDishTypesRecord(
                                            queryBuilder:
                                                (menuDishTypesRecord) =>
                                                    menuDishTypesRecord
                                                        .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MenuDishTypesRecord>
                                                choiceChipsMenuDishTypesRecordList =
                                                snapshot.data!;
                                            return FlutterFlowChoiceChips(
                                              options:
                                                  choiceChipsMenuDishTypesRecordList
                                                      .map((e) => e.name)
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  _model.choiceChipsValue =
                                                      val?.first),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            3.0, 3.0, 3.0, 3.0),
                                                elevation: 5.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 22.0,
                                                labelPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            3.0, 3.0, 3.0, 3.0),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              chipSpacing: 12.0,
                                              rowSpacing: 12.0,
                                              multiselect: false,
                                              initialized:
                                                  _model.choiceChipsValue !=
                                                      null,
                                              alignment: WrapAlignment.center,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                ['Todos'],
                                              ),
                                              wrapped: true,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: StreamBuilder<List<MenuRecord>>(
                                    stream: queryMenuRecord(
                                      queryBuilder: (menuRecord) => menuRecord
                                          .where(
                                            'type',
                                            arrayContains:
                                                _model.choiceChipsValue,
                                          )
                                          .where(
                                            'being_edited',
                                            isEqualTo: false,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MenuRecord> gridViewMenuRecordList =
                                          snapshot.data!;
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 0.85,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            gridViewMenuRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewMenuRecord =
                                              gridViewMenuRecordList[
                                                  gridViewIndex];
                                          return Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              gridViewMenuRecord
                                                                  .dishUrl,
                                                              'https://olo-images-live.imgix.net/58/588af0edf03b40949a0e49b1d19528ca.jpg?auto=format%2Ccompress&q=60&cs=tinysrgb&w=2175&h=1401&fit=crop&fm=png32&s=0b27fef4d9ec61dab4e9ba185196bad8',
                                                            ),
                                                            width: 100.0,
                                                            height: 140.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          gridViewMenuRecord
                                                              .dishName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '₡${gridViewMenuRecord.price.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 1.0, 15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          await RequestRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createRequestRecordData(
                                                                menuDish:
                                                                    gridViewMenuRecord
                                                                        .reference,
                                                                cantidad: 1,
                                                                subtotal:
                                                                    gridViewMenuRecord
                                                                        .price,
                                                                userRef:
                                                                    currentUserReference,
                                                              ));

                                                          await ProductsOrderRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createProductsOrderRecordData(
                                                                menuDish:
                                                                    gridViewMenuRecord
                                                                        .reference,
                                                                amount: 1,
                                                                tableNumber: widget
                                                                    .numMesaParametro,
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                price:
                                                                    gridViewMenuRecord
                                                                        .price,
                                                                userRef:
                                                                    currentUserReference,
                                                                isSelected:
                                                                    true,
                                                              ));
                                                          _model.totalListOutput3 =
                                                              await actions
                                                                  .totalListAction(
                                                            _model.request!
                                                                .map((e) =>
                                                                    e.subtotal)
                                                                .toList(),
                                                            currentUserReference!,
                                                          );
                                                          _model.impuestoOutput3 =
                                                              await actions
                                                                  .calcularImpuestoAction(
                                                            _model.request!
                                                                .map((e) =>
                                                                    e.subtotal)
                                                                .toList(),
                                                            currentUserReference!,
                                                          );
                                                          _model.totalFinalOutput3 =
                                                              await actions
                                                                  .calcularTotalFinalAction(
                                                            _model.txtDescuentoController
                                                                        .text ==
                                                                    '0'
                                                                ? 0
                                                                : int.parse(_model
                                                                    .txtDescuentoController
                                                                    .text),
                                                            _model.request!
                                                                .map((e) =>
                                                                    e.subtotal)
                                                                .toList(),
                                                            currentUserReference!,
                                                          );
                                                          _model.descuentoOutput3 =
                                                              await actions
                                                                  .calcularDescuentoAction(
                                                            int.parse(_model
                                                                .txtDescuentoController
                                                                .text),
                                                            _model.request!
                                                                .map((e) =>
                                                                    e.subtotal)
                                                                .toList(),
                                                            currentUserReference!,
                                                          );
                                                          setState(() {
                                                            _model.total = _model
                                                                .totalFinalOutput3!;
                                                            _model.subtotal = _model
                                                                .totalListOutput3!;
                                                            _model.impuesto = _model
                                                                .impuestoOutput3!;
                                                            _model.descuento =
                                                                _model
                                                                    .descuentoOutput3!;
                                                          });

                                                          setState(() {});
                                                        },
                                                        text: 'Agregar',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.role,
                                                              '') ==
                                                          'Administrador(a)')
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              StreamBuilder<
                                                                  List<
                                                                      MenuRecord>>(
                                                            stream:
                                                                queryMenuRecord(
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MenuRecord>
                                                                  iconButtonMenuRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final iconButtonMenuRecord =
                                                                  iconButtonMenuRecordList
                                                                          .isNotEmpty
                                                                      ? iconButtonMenuRecordList
                                                                          .first
                                                                      : null;
                                                              return FlutterFlowIconButton(
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidTrashAlt,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Confirmación '),
                                                                                content: Text('¿Desea eliminar este platillo?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancelar'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirmar'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    await gridViewMenuRecord
                                                                        .reference
                                                                        .delete();

                                                                    context
                                                                        .pushNamed(
                                                                      'Pedidos',
                                                                      queryParameters:
                                                                          {
                                                                        'numMesaParametro':
                                                                            serializeParam(
                                                                          widget
                                                                              .numMesaParametro,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.28,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x25090F13),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 16.0),
                      child: StreamBuilder<List<RequestRecord>>(
                        stream: queryRequestRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<RequestRecord> columnRequestRecordList =
                              snapshot.data!;
                          final columnRequestRecord =
                              columnRequestRecordList.isNotEmpty
                                  ? columnRequestRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 21.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Orden Actual',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF14181B),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                      icon: FaIcon(
                                        FontAwesomeIcons.pencilAlt,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  child: DetalleOrdenWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Revise su pedido a continuación antes de confirmar.',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      color: Color(0xFF57636C),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Divider(
                                height: 24.0,
                                thickness: 2.0,
                                color: Color(0xFFF1F4F8),
                              ),
                              Expanded(
                                child: StreamBuilder<List<RequestRecord>>(
                                  stream: queryRequestRecord(
                                    queryBuilder: (requestRecord) =>
                                        requestRecord.where(
                                      'userRef',
                                      isEqualTo: currentUserReference,
                                    ),
                                  )..listen((snapshot) async {
                                      List<RequestRecord>
                                          listViewRequestRecordList = snapshot;
                                      if (_model.listViewPreviousSnapshot !=
                                              null &&
                                          !const ListEquality(
                                                  RequestRecordDocumentEquality())
                                              .equals(
                                                  listViewRequestRecordList,
                                                  _model
                                                      .listViewPreviousSnapshot)) {
                                        _model.request =
                                            await queryRequestRecordOnce();
                                        _model.totalListOutput =
                                            await actions.totalListAction(
                                          _model.request!
                                              .map((e) => e.subtotal)
                                              .toList(),
                                          currentUserReference!,
                                        );
                                        _model.impuestoOutput = await actions
                                            .calcularImpuestoAction(
                                          _model.request!
                                              .map((e) => e.subtotal)
                                              .toList(),
                                          currentUserReference!,
                                        );
                                        _model.totalFinalOutput = await actions
                                            .calcularTotalFinalAction(
                                          _model.txtDescuentoController.text ==
                                                  '0'
                                              ? 0
                                              : int.parse(_model
                                                  .txtDescuentoController.text),
                                          _model.request!
                                              .map((e) => e.subtotal)
                                              .toList(),
                                          currentUserReference!,
                                        );
                                        _model.descuentoOutput2 = await actions
                                            .calcularDescuentoAction(
                                          int.parse(_model
                                              .txtDescuentoController.text),
                                          listViewRequestRecordList
                                              .map((e) => e.subtotal)
                                              .toList(),
                                          currentUserReference!,
                                        );
                                        setState(() {
                                          _model.total =
                                              _model.totalFinalOutput!;
                                          _model.subtotal =
                                              _model.totalListOutput!;
                                          _model.impuesto =
                                              _model.impuestoOutput!;
                                          _model.descuento =
                                              _model.descuentoOutput2!;
                                        });

                                        setState(() {});
                                      }
                                      _model.listViewPreviousSnapshot =
                                          snapshot;
                                    }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<RequestRecord>
                                        listViewRequestRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewRequestRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewRequestRecord =
                                            listViewRequestRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: StreamBuilder<MenuRecord>(
                                            stream: MenuRecord.getDocument(
                                                listViewRequestRecord
                                                    .menuDish!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerMenuRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: double.infinity,
                                                height: 95.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFF1F4F8),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              containerMenuRecord
                                                                  .dishUrl,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.1,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.00,
                                                                          0.00),
                                                                      child:
                                                                          Text(
                                                                        containerMenuRecord
                                                                            .dishName,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: Color(0xFF14181B),
                                                                              fontSize: 17.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.00,
                                                                            -1.00),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProductsOrderRecord>>(
                                                                        stream:
                                                                            queryProductsOrderRecord(
                                                                          queryBuilder: (productsOrderRecord) => productsOrderRecord
                                                                              .where(
                                                                                'menuDish',
                                                                                isEqualTo: containerMenuRecord.reference,
                                                                              )
                                                                              .where(
                                                                                'table_number',
                                                                                isEqualTo: widget.numMesaParametro,
                                                                              )
                                                                              .where(
                                                                                'userRef',
                                                                                isEqualTo: currentUserReference,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<ProductsOrderRecord>
                                                                              iconButtonProductsOrderRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final iconButtonProductsOrderRecord = iconButtonProductsOrderRecordList.isNotEmpty
                                                                              ? iconButtonProductsOrderRecordList.first
                                                                              : null;
                                                                          return FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.clear_rounded,
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              size: 22.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await listViewRequestRecord.reference.delete();
                                                                              await iconButtonProductsOrderRecord!.reference.delete();
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.00, 0.05),
                                                                              child: Text(
                                                                                '₡${containerMenuRecord.price.toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFFFF4858),
                                                                                      fontSize: 18.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<ProductsOrderRecord>>(
                                                                            stream:
                                                                                queryProductsOrderRecord(
                                                                              queryBuilder: (productsOrderRecord) => productsOrderRecord
                                                                                  .where(
                                                                                    'menuDish',
                                                                                    isEqualTo: listViewRequestRecord.menuDish,
                                                                                  )
                                                                                  .where(
                                                                                    'table_number',
                                                                                    isEqualTo: widget.numMesaParametro,
                                                                                  )
                                                                                  .where(
                                                                                    'userRef',
                                                                                    isEqualTo: currentUserReference,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<ProductsOrderRecord> iconButtonProductsOrderRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final iconButtonProductsOrderRecord = iconButtonProductsOrderRecordList.isNotEmpty ? iconButtonProductsOrderRecordList.first : null;
                                                                              return FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 2.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 25.0,
                                                                                fillColor: Color(0xFFFF4858),
                                                                                disabledColor: Color(0x87FF5963),
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.minus,
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  size: 10.0,
                                                                                ),
                                                                                onPressed: listViewRequestRecord.cantidad < 2
                                                                                    ? null
                                                                                    : () async {
                                                                                        await listViewRequestRecord.reference.update({
                                                                                          ...createRequestRecordData(
                                                                                            subtotal: functions.restarSubtotal(listViewRequestRecord.subtotal, containerMenuRecord.price),
                                                                                          ),
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'cantidad': FieldValue.increment(-(1)),
                                                                                            },
                                                                                          ),
                                                                                        });

                                                                                        await iconButtonProductsOrderRecord!.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'amount': FieldValue.increment(-(1)),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                      },
                                                                              );
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            listViewRequestRecord.cantidad.toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<ProductsOrderRecord>>(
                                                                            stream:
                                                                                queryProductsOrderRecord(
                                                                              queryBuilder: (productsOrderRecord) => productsOrderRecord
                                                                                  .where(
                                                                                    'menuDish',
                                                                                    isEqualTo: listViewRequestRecord.menuDish,
                                                                                  )
                                                                                  .where(
                                                                                    'table_number',
                                                                                    isEqualTo: widget.numMesaParametro,
                                                                                  )
                                                                                  .where(
                                                                                    'userRef',
                                                                                    isEqualTo: currentUserReference,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<ProductsOrderRecord> iconButtonProductsOrderRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final iconButtonProductsOrderRecord = iconButtonProductsOrderRecordList.isNotEmpty ? iconButtonProductsOrderRecordList.first : null;
                                                                              return FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 2.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 25.0,
                                                                                fillColor: Color(0xFFFF4858),
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.plus,
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  size: 10.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  await listViewRequestRecord.reference.update({
                                                                                    ...createRequestRecordData(
                                                                                      subtotal: functions.sumarSubTotal(listViewRequestRecord.subtotal, containerMenuRecord.price),
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'cantidad': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });

                                                                                  await iconButtonProductsOrderRecord!.reference.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'amount': FieldValue.increment(1),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (currentUserUid ==
                                                                    '-1')
                                                                  Text(
                                                                    functions
                                                                        .calcularSubtotal(
                                                                            containerMenuRecord.price,
                                                                            listViewRequestRecord.cantidad)
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              5.0,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Desglose',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Digitar descuento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .txtDescuentoController,
                                                focusNode: _model
                                                    .txtDescuentoFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.txtDescuentoController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    if (_model
                                                            .txtDescuentoController
                                                            .text ==
                                                        '') {
                                                      setState(() {
                                                        _model
                                                            .txtDescuentoController
                                                            ?.text = '0';
                                                      });
                                                    } else {
                                                      _model.totalListOutput2 =
                                                          await actions
                                                              .totalListAction(
                                                        _model.request!
                                                            .map((e) =>
                                                                e.subtotal)
                                                            .toList(),
                                                        currentUserReference!,
                                                      );
                                                      _model.impuestoOutput2 =
                                                          await actions
                                                              .calcularImpuestoAction(
                                                        _model.request!
                                                            .map((e) =>
                                                                e.subtotal)
                                                            .toList(),
                                                        currentUserReference!,
                                                      );
                                                      _model.descuentoOutput =
                                                          await actions
                                                              .calcularDescuentoAction(
                                                        int.parse(_model
                                                            .txtDescuentoController
                                                            .text),
                                                        _model.request!
                                                            .map((e) =>
                                                                e.subtotal)
                                                            .toList(),
                                                        currentUserReference!,
                                                      );
                                                      _model.totalFinalOutput2 =
                                                          await actions
                                                              .calcularTotalFinalAction(
                                                        int.parse(_model
                                                            .txtDescuentoController
                                                            .text),
                                                        _model.request!
                                                            .map((e) =>
                                                                e.subtotal)
                                                            .toList(),
                                                        currentUserReference!,
                                                      );
                                                      setState(() {
                                                        _model.total = _model
                                                            .totalFinalOutput2!;
                                                        _model.subtotal = _model
                                                            .totalListOutput2!;
                                                        _model.impuesto = _model
                                                            .impuestoOutput2!;
                                                        _model.descuento = _model
                                                            .descuentoOutput!;
                                                      });
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                                onFieldSubmitted: (_) async {
                                                  if (_model
                                                          .txtDescuentoController
                                                          .text ==
                                                      '') {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 0));
                                                    setState(() {
                                                      _model
                                                          .txtDescuentoController
                                                          ?.text = '0';
                                                    });
                                                  }
                                                },
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  prefixIcon: FaIcon(
                                                    FontAwesomeIcons.percentage,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                textAlign: TextAlign.end,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .txtDescuentoControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Subtotal',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kcolones,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<RequestRecord>>(
                                                stream: queryRequestRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestRecord>
                                                      subtotalRequestRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    formatNumber(
                                                      _model.subtotal,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Mono',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Impuesto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kcolones,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<RequestRecord>>(
                                                stream: queryRequestRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestRecord>
                                                      impuestoRequestRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    formatNumber(
                                                      _model.impuesto,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Mono',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Descuento',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kcolones,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<RequestRecord>>(
                                                stream: queryRequestRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestRecord>
                                                      descuentoRequestRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    _model.txtDescuentoController
                                                                .text ==
                                                            '0'
                                                        ? '0'
                                                        : formatNumber(
                                                            _model.descuento,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Mono',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Total',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 36.0,
                                                icon: Icon(
                                                  Icons.info_outlined,
                                                  color: Color(0xFF57636C),
                                                  size: 18.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kcolones,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 18.0,
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<RequestRecord>>(
                                                stream: queryRequestRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<RequestRecord>
                                                      totalRequestRecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    formatNumber(
                                                      _model.total,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 25.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 24.0),
                                      child: StreamBuilder<List<RequestRecord>>(
                                        stream: queryRequestRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<RequestRecord>
                                              buttonRequestRecordList =
                                              snapshot.data!;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              _model.resuladodeletedocsorderItemsInventoryTemp =
                                                  await actions
                                                      .deletedocsorderItemsInventoryTemp();
                                              if (_model
                                                      .resuladodeletedocsorderItemsInventoryTemp ==
                                                  1) {
                                                await actions
                                                    .copyDocumentsToOrderItemsInventoryTemp(
                                                  widget.numMesaParametro!,
                                                );
                                                _model.resultadoRestaInventario =
                                                    await actions
                                                        .subtractIngredientsFromMenu(
                                                  widget.numMesaParametro!,
                                                );
                                                setState(() {
                                                  FFAppState().estaEnPedidos =
                                                      false;
                                                });
                                                if (_model
                                                        .resultadoRestaInventario !=
                                                    '') {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ProductoCantidadInsuficienteWidget(
                                                            platillos: _model
                                                                .resultadoRestaInventario!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  await HistoryRecord.collection
                                                      .doc()
                                                      .set(
                                                          createHistoryRecordData(
                                                        photoUrl:
                                                            currentUserPhoto,
                                                        createdTime:
                                                            getCurrentTimestamp,
                                                        userName:
                                                            currentUserDisplayName,
                                                        role: valueOrDefault(
                                                            currentUserDocument
                                                                ?.role,
                                                            ''),
                                                        description:
                                                            'Agregó Pedido: Mesa #${widget.numMesaParametro.toString()}',
                                                      ));

                                                  await OrdersRecord.collection
                                                      .doc()
                                                      .set(
                                                          createOrdersRecordData(
                                                        tableNumber: widget
                                                            .numMesaParametro,
                                                        creationDate:
                                                            getCurrentTimestamp,
                                                        orderDetail: FFAppState()
                                                            .DescripcionOrden,
                                                        image: '',
                                                        subtotal:
                                                            _model.subtotal,
                                                        taxes: _model.impuesto,
                                                        discount:
                                                            _model.descuento,
                                                        total: _model.total,
                                                        stateFood:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        stateOrder: 1,
                                                        percentageDiscount: _model
                                                            .txtDescuentoController
                                                            .text,
                                                      ));

                                                  await NotificationsRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createNotificationsRecordData(
                                                        notifType: 'Pedido',
                                                        title:
                                                            '¡Nuevo Pedido de Comida!',
                                                        message:
                                                            '¡Hemos recibido un nuevo pedido de comida en la mesa #${widget.numMesaParametro?.toString()}!',
                                                        time:
                                                            getCurrentTimestamp,
                                                      ));
                                                  setState(() {
                                                    FFAppState()
                                                        .DescripcionOrden = '';
                                                  });

                                                  context.pushNamed(
                                                    'Ordenes',
                                                    queryParameters: {
                                                      'mesa': serializeParam(
                                                        widget.numMesaParametro,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  setState(() {
                                                    FFAppState()
                                                        .removeFromNumTable(widget
                                                            .numMesaParametro!);
                                                  });
                                                  await actions
                                                      .eliminarDocumentosRequest(
                                                    'request',
                                                    currentUserReference!,
                                                  );
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Hubo un problema inesperado'),
                                                      content: Text(
                                                          'Ve a otra pantalla luego vuelve y crea el pedido de cero o contacta al Administrador del sistema.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: 'Confirmar',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFF4858),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Roboto Mono',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
