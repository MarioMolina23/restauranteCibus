import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dish_types_component_model.dart';
export 'dish_types_component_model.dart';

class DishTypesComponentWidget extends StatefulWidget {
  const DishTypesComponentWidget({
    Key? key,
    this.dishTypes,
  }) : super(key: key);

  final List<String>? dishTypes;

  @override
  _DishTypesComponentWidgetState createState() =>
      _DishTypesComponentWidgetState();
}

class _DishTypesComponentWidgetState extends State<DishTypesComponentWidget> {
  late DishTypesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DishTypesComponentModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.35,
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder<List<MenuDishTypesRecord>>(
              stream: queryMenuDishTypesRecord(
                queryBuilder: (menuDishTypesRecord) => menuDishTypesRecord
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
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<MenuDishTypesRecord> listViewMenuDishTypesRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMenuDishTypesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewMenuDishTypesRecord =
                        listViewMenuDishTypesRecordList[listViewIndex];
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.032,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            listViewMenuDishTypesRecord.name,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: CircleBorder(),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValueMap[
                                  listViewMenuDishTypesRecord] ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.checkboxValueMap[
                                    listViewMenuDishTypesRecord] = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    _model.addToDishTypes(
                                        listViewMenuDishTypesRecord.name);
                                  });
                                } else {
                                  setState(() {
                                    _model.removeFromDishTypes(
                                        listViewMenuDishTypesRecord.name);
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
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
    );
  }
}
