import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/guardado_exitosamente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agregar_platillo_inventario_model.dart';
export 'agregar_platillo_inventario_model.dart';

class AgregarPlatilloInventarioWidget extends StatefulWidget {
  const AgregarPlatilloInventarioWidget({
    Key? key,
    this.dishTypes,
  }) : super(key: key);

  final List<String>? dishTypes;

  @override
  _AgregarPlatilloInventarioWidgetState createState() =>
      _AgregarPlatilloInventarioWidgetState();
}

class _AgregarPlatilloInventarioWidgetState
    extends State<AgregarPlatilloInventarioWidget>
    with TickerProviderStateMixin {
  late AgregarPlatilloInventarioModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgregarPlatilloInventarioModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().Valores = [];
      });
    });

    _model.txtNombreController ??= TextEditingController();
    _model.txtNombreFocusNode ??= FocusNode();

    _model.txtPrecioController ??= TextEditingController();
    _model.txtPrecioFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 4.0,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xCCFFFFFF),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 670.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Color(0xFFE0E3E7),
                      width: 1.0,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                'Registrando platillo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                'Rellene los espacios con la información solicitada.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Color(0xFF57636C),
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Cerrar'),
                                                        content: Text(
                                                            '¿Está seguro que desea salir?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Cancelar'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Confirmar'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            setState(() {
                                              FFAppState().imagenEditando = '';
                                            });
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E3E7),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  FFAppState().imagenEditando =
                                                      _model.uploadedFileUrl;
                                                });
                                                setState(() {
                                                  _model.isDataUploading =
                                                      false;
                                                  _model.uploadedLocalFile =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl = '';
                                                });
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_a_photo_outlined,
                                                    color: Color(0xFF57636C),
                                                    size: 30.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Añadir Imagen',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Sube una imagen aquí...',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Color(
                                                                0xFF57636C),
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (FFAppState().imagenEditando !=
                                                '')
                                              Container(
                                                width: 200.0,
                                                height: 200.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  FFAppState().imagenEditando,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            if (FFAppState().imagenEditando !=
                                                    null &&
                                                FFAppState().imagenEditando !=
                                                    '')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.22, -0.93),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 100.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 50.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    size: 25.0,
                                                  ),
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Eliminación de imagen'),
                                                                  content: Text(
                                                                      '¿Desea eliminar la imagen?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'No'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirmar'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      setState(() {
                                                        FFAppState()
                                                            .imagenEditando = '';
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.txtNombreController,
                                    focusNode: _model.txtNombreFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.txtNombreController',
                                      Duration(milliseconds: 100),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      hintText: 'Nombre',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF14181B),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    validator: _model
                                        .txtNombreControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Text(
                                  'Selecione categorias para el platillo',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.15,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<
                                            List<MenuDishTypesRecord>>(
                                          stream: queryMenuDishTypesRecord(
                                            queryBuilder:
                                                (menuDishTypesRecord) =>
                                                    menuDishTypesRecord
                                                        .where(
                                                          'name',
                                                          isNotEqualTo: 'Todos',
                                                        )
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
                                                listViewMenuDishTypesRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMenuDishTypesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMenuDishTypesRecord =
                                                    listViewMenuDishTypesRecordList[
                                                        listViewIndex];
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.032,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        listViewMenuDishTypesRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Theme(
                                                        data: ThemeData(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            visualDensity:
                                                                VisualDensity
                                                                    .compact,
                                                            materialTapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                            shape:
                                                                CircleBorder(),
                                                          ),
                                                          unselectedWidgetColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                        child: Checkbox(
                                                          value: _model
                                                                  .checkboxValueMap[
                                                              listViewMenuDishTypesRecord] ??= false,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() => _model
                                                                        .checkboxValueMap[
                                                                    listViewMenuDishTypesRecord] =
                                                                newValue!);
                                                            if (newValue!) {
                                                              setState(() {
                                                                FFAppState()
                                                                    .addToValores(
                                                                        listViewMenuDishTypesRecord
                                                                            .name);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                FFAppState()
                                                                    .removeFromValores(
                                                                        listViewMenuDishTypesRecord
                                                                            .name);
                                                              });
                                                            }
                                                          },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.txtPrecioController,
                                    focusNode: _model.txtPrecioFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.txtPrecioController',
                                      Duration(milliseconds: 100),
                                      () => setState(() {}),
                                    ),
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      hintText: 'Precio',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF14181B),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .txtPrecioControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 15.0, 5.0, 5.0),
                                      child: FFButtonWidget(
                                        onPressed: (_model.txtNombreController
                                                        .text ==
                                                    '') ||
                                                (_model.txtPrecioController
                                                        .text ==
                                                    '') ||
                                                (FFAppState().imagenEditando ==
                                                        null ||
                                                    FFAppState()
                                                            .imagenEditando ==
                                                        '')
                                            ? null
                                            : () async {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                setState(() {
                                                  FFAppState()
                                                      .addToValores('Todos');
                                                });

                                                await MenuRecord.collection
                                                    .doc()
                                                    .set({
                                                  ...createMenuRecordData(
                                                    dishName: _model
                                                        .txtNombreController
                                                        .text,
                                                    price: int.tryParse(_model
                                                        .txtPrecioController
                                                        .text),
                                                    beingEdited: true,
                                                    dishUrl: FFAppState()
                                                        .imagenEditando,
                                                    subtractedFromInventory:
                                                        false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'type':
                                                          FFAppState().Valores,
                                                    },
                                                  ),
                                                });
                                                setState(() {
                                                  FFAppState().imagenEditando =
                                                      '';
                                                });
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          GuardadoExitosamenteWidget(),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                Navigator.pop(context);
                                              },
                                        text: 'Crear receta',
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          disabledColor: Color(0x3A23A8FF),
                                        ),
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
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
    );
  }
}
