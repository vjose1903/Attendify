import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/actions_document/actions_document_widget.dart';
import '/components/activity_filters/activity_filters_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/forms/form_activity/form_activity_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'activities_list_model.dart';
export 'activities_list_model.dart';

class ActivitiesListWidget extends StatefulWidget {
  const ActivitiesListWidget({super.key});

  @override
  State<ActivitiesListWidget> createState() => _ActivitiesListWidgetState();
}

class _ActivitiesListWidgetState extends State<ActivitiesListWidget> {
  late ActivitiesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivitiesListModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
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
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      child: FormActivityWidget(
                        action: FormAction.create,
                        reloadChip: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'reload',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
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
                  height: 44.0,
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
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
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
                                validator: _model.textControllerValidator
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
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<GrupoActividadRecord>>(
                  stream: queryGrupoActividadRecord(
                    queryBuilder: (grupoActividadRecord) =>
                        grupoActividadRecord.where(
                      'grupos',
                      arrayContains: FFAppState().grupoSeleccionado,
                    ),
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
                        listViewGrupoActividadRecordList = snapshot.data!;
                    if (listViewGrupoActividadRecordList.isEmpty) {
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
                          msg: 'Al parecer no hay registros de actividades.',
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
                      itemCount: listViewGrupoActividadRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewGrupoActividadRecord =
                            listViewGrupoActividadRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: StreamBuilder<ActividadRecord>(
                            stream: ActividadRecord.getDocument(
                                listViewGrupoActividadRecord.actividad!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 105.0, 0.0, 105.0),
                                    child: SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 60.0,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final containerActividadRecord = snapshot.data!;
                              return Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 295.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Builder(
                                      builder: (context) => StreamBuilder<
                                          List<ActividadImagenesRecord>>(
                                        stream: queryActividadImagenesRecord(
                                          queryBuilder:
                                              (actividadImagenesRecord) =>
                                                  actividadImagenesRecord
                                                      .where(
                                                        'actividad',
                                                        isEqualTo:
                                                            containerActividadRecord
                                                                .reference,
                                                      )
                                                      .where(
                                                        'isPortada',
                                                        isEqualTo: true,
                                                      ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 60.0,
                                                height: 60.0,
                                                child: SpinKitChasingDots(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 60.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ActividadImagenesRecord>
                                              containerActividadImagenesRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerActividadImagenesRecord =
                                              containerActividadImagenesRecordList
                                                      .isNotEmpty
                                                  ? containerActividadImagenesRecordList
                                                      .first
                                                  : null;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onDoubleTap: () async {
                                              // Find Grupo Actividad Detalle
                                              _model.doubleGrupoActividadDetalleResponse =
                                                  await queryGrupoActividadDetalleRecordOnce(
                                                queryBuilder:
                                                    (grupoActividadDetalleRecord) =>
                                                        grupoActividadDetalleRecord
                                                            .where(
                                                              'grupo_actividad',
                                                              isEqualTo:
                                                                  listViewGrupoActividadRecord
                                                                      .reference,
                                                            )
                                                            .where(
                                                              'grupo',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .grupoSeleccionado,
                                                            )
                                                            .orderBy('fecha'),
                                              );
                                              // Count imgs
                                              _model.doubleImagenesActividadResponse =
                                                  await queryActividadImagenesRecordCount(
                                                queryBuilder:
                                                    (actividadImagenesRecord) =>
                                                        actividadImagenesRecord
                                                            .where(
                                                              'isPortada',
                                                              isEqualTo: false,
                                                            )
                                                            .where(
                                                              'actividad',
                                                              isEqualTo:
                                                                  containerActividadRecord
                                                                      .reference,
                                                            ),
                                              );
                                              // View Details

                                              context.pushNamed(
                                                'DetalleActividad',
                                                queryParameters: {
                                                  'actividad': serializeParam(
                                                    containerActividadRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'grupoActividad':
                                                      serializeParam(
                                                    listViewGrupoActividadRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'portada': serializeParam(
                                                    containerActividadImagenesRecord
                                                        .imgPath,
                                                    ParamType.String,
                                                  ),
                                                  'grupoActividadDetalles':
                                                      serializeParam(
                                                    _model
                                                        .doubleGrupoActividadDetalleResponse,
                                                    ParamType.Document,
                                                    true,
                                                  ),
                                                  'portadaBlurHash':
                                                      serializeParam(
                                                    containerActividadImagenesRecord
                                                        .imgBlurPath,
                                                    ParamType.String,
                                                  ),
                                                  'hasImagenes': serializeParam(
                                                    _model.doubleImagenesActividadResponse! >
                                                        0,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'actividad':
                                                      containerActividadRecord,
                                                  'grupoActividad':
                                                      listViewGrupoActividadRecord,
                                                  'grupoActividadDetalles': _model
                                                      .doubleGrupoActividadDetalleResponse,
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                  ),
                                                },
                                              );

                                              setState(() {});
                                            },
                                            onLongPress: () async {
                                              // Find Grupo Actividad Detalle
                                              _model.longGrupoActividadDetalleResponse =
                                                  await queryGrupoActividadDetalleRecordOnce(
                                                queryBuilder:
                                                    (grupoActividadDetalleRecord) =>
                                                        grupoActividadDetalleRecord
                                                            .where(
                                                              'grupo_actividad',
                                                              isEqualTo:
                                                                  listViewGrupoActividadRecord
                                                                      .reference,
                                                            )
                                                            .where(
                                                              'grupo',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .grupoSeleccionado,
                                                            ),
                                              );
                                              // Find Imgs
                                              _model.longImgResponse =
                                                  await queryActividadImagenesRecordOnce(
                                                queryBuilder:
                                                    (actividadImagenesRecord) =>
                                                        actividadImagenesRecord
                                                            .where(
                                                  'actividad',
                                                  isEqualTo:
                                                      containerActividadRecord
                                                          .reference,
                                                ),
                                              );
                                              // Find objetos a entregar
                                              _model.longObjetosAEntregarResponse =
                                                  await queryActividadObjetoAEntregarRecordOnce(
                                                parent: _model
                                                    .longGrupoActividadDetalleResponse
                                                    ?.first
                                                    .reference,
                                                queryBuilder:
                                                    (actividadObjetoAEntregarRecord) =>
                                                        actividadObjetoAEntregarRecord
                                                            .where(
                                                  'grupo',
                                                  isEqualTo: FFAppState()
                                                      .grupoSeleccionado,
                                                ),
                                              );
                                              // find access
                                              _model.longAccessResponse =
                                                  await queryAccesoRecordOnce(
                                                parent: _model
                                                    .longGrupoActividadDetalleResponse
                                                    ?.first
                                                    .reference,
                                                queryBuilder: (accesoRecord) =>
                                                    accesoRecord.where(
                                                  'grupo',
                                                  isEqualTo: FFAppState()
                                                      .grupoSeleccionado,
                                                ),
                                              );
                                              // open form
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
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.4,
                                                        child:
                                                            ActionsDocumentWidget(
                                                          showQrBtn: false,
                                                          editAction: () async {
                                                            if (containerActividadRecord
                                                                    .fechaInicio! >
                                                                functions
                                                                    .toInitDayHour(
                                                                        getCurrentTimestamp)) {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                isDismissible:
                                                                    false,
                                                                enableDrag:
                                                                    false,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          SizedBox(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.75,
                                                                        child:
                                                                            FormActivityWidget(
                                                                          action:
                                                                              FormAction.edit,
                                                                          actividad:
                                                                              containerActividadRecord,
                                                                          objetosAEntregar:
                                                                              _model.longObjetosAEntregarResponse,
                                                                          imagenes:
                                                                              _model.longImgResponse,
                                                                          access:
                                                                              _model.longAccessResponse,
                                                                          grupoActividad:
                                                                              listViewGrupoActividadRecord.reference,
                                                                          grupoActividadDetalle:
                                                                              _model.longGrupoActividadDetalleResponse,
                                                                          reloadChip:
                                                                              () async {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'reload',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: const Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            } else {
                                                              // show error msg
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Solo se puede editar una actividad antes de su fecha de inicio',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          deleteAction:
                                                              () async {
                                                            if (containerActividadRecord
                                                                    .fechaInicio! >
                                                                getCurrentTimestamp) {
                                                              // Show delete modal
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            double.infinity,
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            DeleteModalWidget(
                                                                          deleteMsg:
                                                                              'Esta acción borrará definitivamente la actividad:  ${containerActividadRecord.nombre}, ¿Desea Continuar?',
                                                                          title:
                                                                              'Confirmar',
                                                                          deleteAction:
                                                                              () async {
                                                                            // delete grupo actividad
                                                                            await listViewGrupoActividadRecord.reference.delete();
                                                                            // delete actividad
                                                                            await containerActividadRecord.reference.delete();
                                                                            while (FFAppState().contador <
                                                                                _model.longImgResponse!.length) {
                                                                              // remove img from firestore
                                                                              await FirebaseStorage.instance.refFromURL(_model.longImgResponse![FFAppState().contador].imgPath).delete();
                                                                              // delete img record
                                                                              await _model.longImgResponse![FFAppState().contador].reference.delete();
                                                                              // increment Contador
                                                                              FFAppState().contador = FFAppState().contador + 1;
                                                                            }
                                                                            // reset contador
                                                                            FFAppState().contador =
                                                                                0;
                                                                            while (FFAppState().contador <
                                                                                _model.longGrupoActividadDetalleResponse!.length) {
                                                                              // delete grupo actividad detalle
                                                                              await _model.longGrupoActividadDetalleResponse![FFAppState().contador].reference.delete();
                                                                              // Increment Contador
                                                                              FFAppState().contador = FFAppState().contador + 1;
                                                                            }
                                                                            FFAppState().contador =
                                                                                0;
                                                                            // Show success Msg
                                                                            ScaffoldMessenger.of(context).clearSnackBars();
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Actividad eliminada correctamente.',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: const Duration(milliseconds: 4500),
                                                                                backgroundColor: FlutterFlowTheme.of(context).success,
                                                                              ),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            } else {
                                                              // show error msg
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Solo se puede eliminar una actividad antes de su fecha de inicio',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          showQRAction:
                                                              () async {},
                                                          pasarAsistencia:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Hero(
                                                        tag: containerActividadImagenesRecord?.imgPath !=
                                                                    null &&
                                                                containerActividadImagenesRecord
                                                                        ?.imgPath !=
                                                                    ''
                                                            ? containerActividadImagenesRecord!
                                                                .imgPath
                                                            : FFAppConstants
                                                                .noImgUrl,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    16.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          child: OctoImage(
                                                            placeholderBuilder:
                                                                OctoPlaceholder
                                                                    .blurHash(
                                                              containerActividadImagenesRecord!
                                                                  .imgBlurPath,
                                                            ),
                                                            image: NetworkImage(
                                                              containerActividadImagenesRecord
                                                                              .imgPath !=
                                                                          ''
                                                                  ? containerActividadImagenesRecord.imgPath
                                                                  : FFAppConstants
                                                                      .noImgUrl,
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height: 200.0,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            alignment:
                                                                const Alignment(
                                                                    0.0, -1.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              containerActividadRecord
                                                                  .nombre,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        19.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              containerActividadRecord
                                                                          .costo ==
                                                                      0.0
                                                                  ? 'Gratis'
                                                                  : formatNumber(
                                                                      containerActividadRecord
                                                                          .costo,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      currency:
                                                                          'RD\$ ',
                                                                      format:
                                                                          '#,###.##',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  10.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              containerActividadRecord
                                                                          .fechaInicio ==
                                                                      containerActividadRecord
                                                                          .fechaFin
                                                                  ? dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      containerActividadRecord
                                                                          .fechaInicio!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )
                                                                  : '${dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      containerActividadRecord
                                                                          .fechaInicio,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'dd/MM/yyyy',
                                                                      containerActividadRecord
                                                                          .fechaFin,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                containerActividadRecord
                                                                    .descripcion
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 50,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          13.0,
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
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
