import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'unidades_medida_copy_model.dart';
export 'unidades_medida_copy_model.dart';

class UnidadesMedidaCopyWidget extends StatefulWidget {
  const UnidadesMedidaCopyWidget({Key? key}) : super(key: key);

  @override
  _UnidadesMedidaCopyWidgetState createState() =>
      _UnidadesMedidaCopyWidgetState();
}

class _UnidadesMedidaCopyWidgetState extends State<UnidadesMedidaCopyWidget> {
  late UnidadesMedidaCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnidadesMedidaCopyModel());

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

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(null),
      options: [
        'Litros (L)',
        'Mililitros (ml)',
        'Kilogramos (kg)',
        'Gramos (g)',
        'Por unidad'
      ],
      onChanged: (val) => setState(() => _model.dropDownValue = val),
      width: 338.0,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Plus Jakarta Sans',
          ),
      hintText: 'Selecciona la unidad de medida...',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).lineColor,
      borderWidth: 2.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
