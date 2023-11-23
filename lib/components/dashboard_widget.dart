import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/editar_perfil_widget.dart';
import '/components/num_mesa_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    Key? key,
    this.ctProfile,
    this.ctPedido,
    this.ctOrdenes,
    this.ctInventario,
    this.ctReportes,
    this.ctBitacora,
    this.ctNotif,
    this.iconPerfil,
    this.iconPedido,
    this.iconOrden,
    this.iconInventario,
    this.iconReporte,
    this.iconBitacora,
    this.iconNotif,
    this.txtPerfil,
    this.txtPedido,
    this.txtOrden,
    this.txtInventario,
    this.txtReporte,
    this.txtBitacora,
    this.txtNotif,
    this.ctGeneral,
    this.iconGeneral,
    this.txtGeneral,
  }) : super(key: key);

  final Color? ctProfile;
  final Color? ctPedido;
  final Color? ctOrdenes;
  final Color? ctInventario;
  final Color? ctReportes;
  final Color? ctBitacora;
  final Color? ctNotif;
  final Color? iconPerfil;
  final Color? iconPedido;
  final Color? iconOrden;
  final Color? iconInventario;
  final Color? iconReporte;
  final Color? iconBitacora;
  final Color? iconNotif;
  final Color? txtPerfil;
  final Color? txtPedido;
  final Color? txtOrden;
  final Color? txtInventario;
  final Color? txtReporte;
  final Color? txtBitacora;
  final Color? txtNotif;
  final Color? ctGeneral;
  final Color? iconGeneral;
  final Color? txtGeneral;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'email',
          isEqualTo: currentUserEmail,
        ),
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
        List<UsersRecord> containerUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerUsersRecord = containerUsersRecordList.isNotEmpty
            ? containerUsersRecordList.first
            : null;
        return Container(
          width: MediaQuery.sizeOf(context).width * 0.111,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBtnText,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.11,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/IMG_3125.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 5.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().estaEnPedidos == true) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Salir de pedido'),
                                  content: Text('¿Desea salir del pedido?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          if (valueOrDefault(currentUserDocument?.role, '') ==
                              'Administrador(a)') {
                            await actions.changeStateProduct(
                              FFAppState().indexMesa,
                            );

                            context.pushNamed('Perfil');

                            setState(() {
                              FFAppState().estaEnPedidos = false;
                            });
                            _model.tableSalirPedido9 =
                                await queryTablesRecordOnce(
                              queryBuilder: (tablesRecord) =>
                                  tablesRecord.where(
                                'numberTable',
                                isEqualTo: FFAppState().indexMesa,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.tableSalirPedido!.reference
                                .update(createTablesRecordData(
                              isSelected: false,
                            ));
                            await actions.eliminarDocumentosRequest(
                              'request',
                              currentUserReference!,
                            );
                          } else {
                            await actions.changeStateProduct(
                              FFAppState().indexMesa,
                            );
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: EditarPerfilWidget(
                                      usuario: containerUsersRecord!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            setState(() {
                              FFAppState().estaEnPedidos = false;
                            });
                            _model.tableSalirPedido10 =
                                await queryTablesRecordOnce(
                              queryBuilder: (tablesRecord) =>
                                  tablesRecord.where(
                                'numberTable',
                                isEqualTo: FFAppState().indexMesa,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.tableSalirPedido!.reference
                                .update(createTablesRecordData(
                              isSelected: false,
                            ));
                            await actions.eliminarDocumentosRequest(
                              'request',
                              currentUserReference!,
                            );
                          }
                        }
                      } else {
                        if (valueOrDefault(currentUserDocument?.role, '') ==
                            'Administrador(a)') {
                          context.pushNamed('Perfil');
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: EditarPerfilWidget(
                                    usuario: containerUsersRecord!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: 97.4,
                      height: 50.8,
                      decoration: BoxDecoration(
                        color: widget.ctProfile,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: widget.iconPerfil,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().estaEnPedidos == true) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Salir de pedido'),
                                                      content: Text(
                                                          '¿Desea salir del pedido?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child:
                                                              Text('Cancelar'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirmar'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          context.pushNamed('Perfil');

                                          setState(() {
                                            FFAppState().estaEnPedidos = false;
                                          });
                                          _model.tableSalirPedido2 =
                                              await queryTablesRecordOnce(
                                            queryBuilder: (tablesRecord) =>
                                                tablesRecord.where(
                                              'numberTable',
                                              isEqualTo: FFAppState().indexMesa,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          await _model
                                              .tableSalirPedido2!.reference
                                              .update(createTablesRecordData(
                                            isSelected: false,
                                          ));
                                        }
                                      }

                                      setState(() {});
                                    },
                                    child: Text(
                                      valueOrDefault(currentUserDocument?.role,
                                                  '') ==
                                              'Administrador(a)'
                                          ? 'Usuarios'
                                          : 'Perfil',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: widget.txtPerfil,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if ((valueOrDefault(currentUserDocument?.role, '') ==
                        'Administrador(a)') ||
                    (valueOrDefault(currentUserDocument?.role, '') ==
                        'Mesero(a)'))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().estaEnPedidos == true) {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Salir de pedido'),
                                      content: Text('¿Desea salir del pedido?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.changeStateProduct(
                                FFAppState().indexMesa,
                              );

                              context.pushNamed('Ordenes');

                              setState(() {
                                FFAppState().estaEnPedidos = false;
                              });
                              _model.tableSalirPedido =
                                  await queryTablesRecordOnce(
                                queryBuilder: (tablesRecord) =>
                                    tablesRecord.where(
                                  'numberTable',
                                  isEqualTo: FFAppState().indexMesa,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.tableSalirPedido!.reference
                                  .update(createTablesRecordData(
                                isSelected: false,
                              ));
                              await actions.eliminarDocumentosRequest(
                                'request',
                                currentUserReference!,
                              );
                            }
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: NumMesaWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            await actions.orderNumTable();
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: 97.4,
                          height: 55.6,
                          decoration: BoxDecoration(
                            color: widget.ctPedido,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.45),
                                      child: Icon(
                                        Icons.fastfood_outlined,
                                        color: widget.iconPedido,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Text(
                                        'Pedidos',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: widget.txtPedido,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().estaEnPedidos == true) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Salir de pedido'),
                                  content: Text('¿Desea salir del pedido?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await actions.changeStateProduct(
                            FFAppState().indexMesa,
                          );

                          context.pushNamed('Ordenes');

                          setState(() {
                            FFAppState().estaEnPedidos = false;
                          });
                          _model.tableSalirPedido1 =
                              await queryTablesRecordOnce(
                            queryBuilder: (tablesRecord) => tablesRecord.where(
                              'numberTable',
                              isEqualTo: FFAppState().indexMesa,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await _model.tableSalirPedido3!.reference
                              .update(createTablesRecordData(
                            isSelected: false,
                          ));
                          await actions.eliminarDocumentosRequest(
                            'request',
                            currentUserReference!,
                          );
                        }
                      } else {
                        context.pushNamed('Ordenes');
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: 97.4,
                      height: 50.8,
                      decoration: BoxDecoration(
                        color: widget.ctOrdenes,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.paste,
                                  color: widget.iconOrden,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Órdenes',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: widget.txtOrden,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if ((valueOrDefault(currentUserDocument?.role, '') ==
                        'Administrador(a)') ||
                    (valueOrDefault(currentUserDocument?.role, '') ==
                        'Cocinero(a)'))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().estaEnPedidos == true) {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Salir de pedido'),
                                      content: Text('¿Desea salir del pedido?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.changeStateProduct(
                                FFAppState().indexMesa,
                              );

                              context.pushNamed('Inventario');

                              setState(() {
                                FFAppState().estaEnPedidos = false;
                              });
                              _model.tableSalirPedido3 =
                                  await queryTablesRecordOnce(
                                queryBuilder: (tablesRecord) =>
                                    tablesRecord.where(
                                  'numberTable',
                                  isEqualTo: FFAppState().indexMesa,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.tableSalirPedido3!.reference
                                  .update(createTablesRecordData(
                                isSelected: false,
                              ));
                              await actions.eliminarDocumentosRequest(
                                'request',
                                currentUserReference!,
                              );
                            }
                          } else {
                            context.pushNamed('Inventario');
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: 97.4,
                          height: 50.8,
                          decoration: BoxDecoration(
                            color: widget.ctInventario,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.store,
                                      color: widget.iconInventario,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Inventario',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: widget.txtInventario,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.role, '') ==
                    'Administrador(a)')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().estaEnPedidos == true) {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Salir de pedido'),
                                      content: Text('¿Desea salir del pedido?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.changeStateProduct(
                                FFAppState().indexMesa,
                              );

                              context.pushNamed('ReporteOrdenes');

                              setState(() {
                                FFAppState().estaEnPedidos = false;
                              });
                              _model.tableSalirPedido4 =
                                  await queryTablesRecordOnce(
                                queryBuilder: (tablesRecord) =>
                                    tablesRecord.where(
                                  'numberTable',
                                  isEqualTo: FFAppState().indexMesa,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.tableSalirPedido4!.reference
                                  .update(createTablesRecordData(
                                isSelected: false,
                              ));
                              await actions.eliminarDocumentosRequest(
                                'request',
                                currentUserReference!,
                              );
                            }
                          } else {
                            context.pushNamed('ReporteOrdenes');
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: 97.4,
                          height: 50.8,
                          decoration: BoxDecoration(
                            color: widget.ctReportes,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat_rounded,
                                      color: widget.iconReporte,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Reportes',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: widget.txtReporte,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                if (valueOrDefault(currentUserDocument?.role, '') ==
                    'Administrador(a)')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().estaEnPedidos == true) {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Salir de pedido'),
                                      content: Text('¿Desea salir del pedido?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.changeStateProduct(
                                FFAppState().indexMesa,
                              );

                              context.pushNamed('Bitacora');

                              setState(() {
                                FFAppState().estaEnPedidos = false;
                              });
                              _model.tableSalirPedido5 =
                                  await queryTablesRecordOnce(
                                queryBuilder: (tablesRecord) =>
                                    tablesRecord.where(
                                  'numberTable',
                                  isEqualTo: FFAppState().indexMesa,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.tableSalirPedido5!.reference
                                  .update(createTablesRecordData(
                                isSelected: false,
                              ));
                              await actions.eliminarDocumentosRequest(
                                'request',
                                currentUserReference!,
                              );
                            }
                          } else {
                            context.pushNamed('Bitacora');
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: 97.4,
                          height: 50.8,
                          decoration: BoxDecoration(
                            color: widget.ctBitacora,
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.idCard,
                                      color: widget.iconBitacora,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Bitácora',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: widget.txtBitacora,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().estaEnPedidos == true) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Salir de pedido'),
                                  content: Text('¿Desea salir del pedido?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await actions.changeStateProduct(
                            FFAppState().indexMesa,
                          );

                          context.pushNamed('Notificaciones');

                          setState(() {
                            FFAppState().estaEnPedidos = false;
                          });
                          _model.tableSalirPedido6 =
                              await queryTablesRecordOnce(
                            queryBuilder: (tablesRecord) => tablesRecord.where(
                              'numberTable',
                              isEqualTo: FFAppState().indexMesa,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await _model.tableSalirPedido6!.reference
                              .update(createTablesRecordData(
                            isSelected: false,
                          ));
                          await actions.eliminarDocumentosRequest(
                            'request',
                            currentUserReference!,
                          );
                        }
                      } else {
                        context.pushNamed('Notificaciones');
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: 97.4,
                      height: 51.1,
                      decoration: BoxDecoration(
                        color: widget.ctNotif,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: widget.iconNotif,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Notificaciones',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.txtNotif,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().estaEnPedidos == true) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Salir de pedido'),
                                  content: Text('¿Desea salir del pedido?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await actions.changeStateProduct(
                            FFAppState().indexMesa,
                          );

                          context.pushNamed('General');

                          setState(() {
                            FFAppState().estaEnPedidos = false;
                          });
                          _model.tableSalirPedido7 =
                              await queryTablesRecordOnce(
                            queryBuilder: (tablesRecord) => tablesRecord.where(
                              'numberTable',
                              isEqualTo: FFAppState().indexMesa,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await _model.tableSalirPedido7!.reference
                              .update(createTablesRecordData(
                            isSelected: false,
                          ));
                          await actions.eliminarDocumentosRequest(
                            'request',
                            currentUserReference!,
                          );
                        }
                      } else {
                        context.pushNamed('General');
                      }

                      setState(() {});
                    },
                    child: Container(
                      width: 97.4,
                      height: 51.1,
                      decoration: BoxDecoration(
                        color: widget.ctGeneral,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.build,
                                  color: widget.iconGeneral,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'General',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.txtGeneral,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().estaEnPedidos == true) {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Salir de pedido'),
                                          content:
                                              Text('¿Desea salir del pedido?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirmar'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  context.pushNamedAuth(
                                      'General', context.mounted);

                                  setState(() {
                                    FFAppState().estaEnPedidos = false;
                                  });
                                  _model.tableSalirPedido8 =
                                      await queryTablesRecordOnce(
                                    queryBuilder: (tablesRecord) =>
                                        tablesRecord.where(
                                      'numberTable',
                                      isEqualTo: FFAppState().indexMesa,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);

                                  await _model.tableSalirPedido8!.reference
                                      .update(createTablesRecordData(
                                    isSelected: false,
                                  ));
                                }
                              } else {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Cerrar Sesión'),
                                              content:
                                                  Text('¿Desea cerrar sesión?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirmar'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'InicioSesion', context.mounted);
                                }
                              }

                              setState(() {});
                            },
                            child: Container(
                              width: 97.4,
                              height: 51.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.login_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cerrar Sesión',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
