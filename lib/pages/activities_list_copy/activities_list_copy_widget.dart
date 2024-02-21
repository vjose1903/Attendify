import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/actividad_item/actividad_item_widget.dart';
import '/components/activity_filters/activity_filters_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/forms/form_activity/form_activity_widget.dart';
import '/components/suspencion_por_pago_modal/suspencion_por_pago_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'activities_list_copy_model.dart';
export 'activities_list_copy_model.dart';

class ActivitiesListCopyWidget extends StatefulWidget {
  const ActivitiesListCopyWidget({super.key});

  @override
  State<ActivitiesListCopyWidget> createState() =>
      _ActivitiesListCopyWidgetState();
}

class _ActivitiesListCopyWidgetState extends State<ActivitiesListCopyWidget> {
  late ActivitiesListCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivitiesListCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActivitiesListCopy'});
    _model.searchActividadesController ??= TextEditingController();
    _model.searchActividadesFocusNode ??= FocusNode();
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
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('ACTIVITIES_LIST_COPY_FloatingActionButto');
              if (FFAppState().pagoStatus) {
                logFirebaseEvent('FloatingActionButton_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: false,
                  enableDrag: false,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          child: FormActivityWidget(
                            action: FormAction.create,
                            reloadChip: () async {
                              logFirebaseEvent('_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'reload',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              } else {
                // No pago Made
                logFirebaseEvent('FloatingActionButton_NopagoMade');
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: SuspencionPorPagoModalWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));

                return;
              }
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.85,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.activityFiltersModel,
              updateCallback: () => setState(() {}),
              child: const ActivityFiltersWidget(),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ACTIVITIES_LIST_COPY_arrow_back_rounded_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Actividades',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 10.0),
                child: Container(
                  width: double.infinity,
                  height: 52.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.searchActividadesController,
                                focusNode: _model.searchActividadesFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchActividadesController',
                                  const Duration(milliseconds: 500),
                                  () async {
                                    logFirebaseEvent(
                                        'ACTIVITIES_LIST_COPY_searchActividades_O');
                                    if (_model.searchActividadesController
                                                .text !=
                                            '') {
                                      // Simple search actividades
                                      logFirebaseEvent(
                                          'searchActividades_Simplesearchactividade');
                                      await queryGrupoActividadRecordOnce()
                                          .then(
                                            (records) => _model
                                                    .simpleSearchResults =
                                                TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record, [
                                                      record.actividadName]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .searchActividadesController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(() => setState(() {}));

                                      // Show filter List
                                      logFirebaseEvent(
                                          'searchActividades_ShowfilterList');
                                      setState(() {
                                        _model.showFullList = false;
                                      });
                                    } else {
                                      // Show full List
                                      logFirebaseEvent(
                                          'searchActividades_ShowfullList');
                                      setState(() {
                                        _model.showFullList = true;
                                      });
                                    }
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Busqueda...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model
                                    .searchActividadesControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.tune_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 22.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ACTIVITIES_LIST_COPY_tune_sharp_ICN_ON_T');
                            logFirebaseEvent('IconButton_drawer');
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.showFullList) {
                      return StreamBuilder<List<GrupoActividadRecord>>(
                        stream: queryGrupoActividadRecord(
                          queryBuilder: (grupoActividadRecord) =>
                              grupoActividadRecord
                                  .where(
                                    'grupos',
                                    arrayContains:
                                        FFAppState().grupoSeleccionado,
                                  )
                                  .orderBy('fecha_inicio'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 60.0,
                                height: 60.0,
                                child: SpinKitChasingDots(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 60.0,
                                ),
                              ),
                            );
                          }
                          List<GrupoActividadRecord>
                              fullListActividadesGrupoActividadRecordList =
                              snapshot.data!;
                          if (fullListActividadesGrupoActividadRecordList
                              .isEmpty) {
                            return SizedBox(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: EmptyListWidget(
                                icon: Icon(
                                  Icons.local_activity_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryImputBackground,
                                  size: 70.0,
                                ),
                                title: 'No hay Actividades',
                                msg:
                                    'Al parecer no hay registros de actividades.',
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              200.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                fullListActividadesGrupoActividadRecordList
                                    .length,
                            itemBuilder: (context, fullListActividadesIndex) {
                              final fullListActividadesGrupoActividadRecord =
                                  fullListActividadesGrupoActividadRecordList[
                                      fullListActividadesIndex];
                              return wrapWithModel(
                                model: _model.actividadItemModels1.getModel(
                                  fullListActividadesGrupoActividadRecord
                                      .reference.id,
                                  fullListActividadesIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ActividadItemWidget(
                                  key: Key(
                                    'Keywuj_${fullListActividadesGrupoActividadRecord.reference.id}',
                                  ),
                                  grupoActividad:
                                      fullListActividadesGrupoActividadRecord,
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          final filterGrupoActividadList =
                              _model.simpleSearchResults.toList();
                          if (filterGrupoActividadList.isEmpty) {
                            return SizedBox(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: EmptyListWidget(
                                icon: Icon(
                                  Icons.local_activity_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryImputBackground,
                                  size: 70.0,
                                ),
                                title: 'No hay Actividades',
                                msg:
                                    'Al parecer no hay registros de actividades.',
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              200.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: filterGrupoActividadList.length,
                            itemBuilder:
                                (context, filterGrupoActividadListIndex) {
                              final filterGrupoActividadListItem =
                                  filterGrupoActividadList[
                                      filterGrupoActividadListIndex];
                              return wrapWithModel(
                                model: _model.actividadItemModels2.getModel(
                                  filterGrupoActividadListItem.reference.id,
                                  filterGrupoActividadListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ActividadItemWidget(
                                  key: Key(
                                    'Key8db_${filterGrupoActividadListItem.reference.id}',
                                  ),
                                  grupoActividad: filterGrupoActividadListItem,
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
