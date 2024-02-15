import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/actions_document/actions_document_widget.dart';
import '/components/custom_snack_bar/custom_snack_bar_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/forms/form_activity/form_activity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'actividad_item_model.dart';
export 'actividad_item_model.dart';

class ActividadItemWidget extends StatefulWidget {
  const ActividadItemWidget({
    super.key,
    this.grupoActividad,
  });

  final GrupoActividadRecord? grupoActividad;

  @override
  State<ActividadItemWidget> createState() => _ActividadItemWidgetState();
}

class _ActividadItemWidgetState extends State<ActividadItemWidget> {
  late ActividadItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActividadItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<ActividadRecord>(
        stream: ActividadRecord.getDocument(widget.grupoActividad!.actividad!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 105.0, 0.0, 105.0),
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: SpinKitChasingDots(
                    color: FlutterFlowTheme.of(context).primary,
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
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Builder(
                  builder: (context) =>
                      StreamBuilder<List<ActividadImagenesRecord>>(
                    stream: queryActividadImagenesRecord(
                      queryBuilder: (actividadImagenesRecord) =>
                          actividadImagenesRecord
                              .where(
                                'actividad',
                                isEqualTo: containerActividadRecord.reference,
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 60.0,
                            ),
                          ),
                        );
                      }
                      List<ActividadImagenesRecord>
                          containerActividadImagenesRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerActividadImagenesRecord =
                          containerActividadImagenesRecordList.isNotEmpty
                              ? containerActividadImagenesRecordList.first
                              : null;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ACTIVIDAD_ITEM_Container_4x2dy28j_ON_TAP');
                          // Find Grupo Actividad Detalle
                          logFirebaseEvent(
                              'Container_FindGrupoActividadDetalle');
                          _model.doubleGrupoActividadDetalleResponse =
                              await queryGrupoActividadDetalleRecordOnce(
                            queryBuilder: (grupoActividadDetalleRecord) =>
                                grupoActividadDetalleRecord
                                    .where(
                                      'grupo_actividad',
                                      isEqualTo:
                                          widget.grupoActividad?.reference,
                                    )
                                    .where(
                                      'grupo',
                                      isEqualTo: FFAppState().grupoSeleccionado,
                                    )
                                    .orderBy('fecha'),
                          );
                          // Count imgs
                          logFirebaseEvent('Container_Countimgs');
                          _model.doubleImagenesActividadResponse =
                              await queryActividadImagenesRecordCount(
                            queryBuilder: (actividadImagenesRecord) =>
                                actividadImagenesRecord
                                    .where(
                                      'isPortada',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'actividad',
                                      isEqualTo:
                                          containerActividadRecord.reference,
                                    ),
                          );
                          // View Details
                          logFirebaseEvent('Container_ViewDetails');

                          context.pushNamed(
                            'DetalleActividad',
                            queryParameters: {
                              'actividad': serializeParam(
                                containerActividadRecord,
                                ParamType.Document,
                              ),
                              'grupoActividad': serializeParam(
                                widget.grupoActividad,
                                ParamType.Document,
                              ),
                              'portada': serializeParam(
                                containerActividadImagenesRecord.imgPath,
                                ParamType.String,
                              ),
                              'grupoActividadDetalles': serializeParam(
                                _model.doubleGrupoActividadDetalleResponse,
                                ParamType.Document,
                                true,
                              ),
                              'portadaBlurHash': serializeParam(
                                containerActividadImagenesRecord.imgBlurPath,
                                ParamType.String,
                              ),
                              'hasImagenes': serializeParam(
                                _model.doubleImagenesActividadResponse! > 0,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'actividad': containerActividadRecord,
                              'grupoActividad': widget.grupoActividad,
                              'grupoActividadDetalles':
                                  _model.doubleGrupoActividadDetalleResponse,
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                              ),
                            },
                          );

                          setState(() {});
                        },
                        onLongPress: () async {
                          logFirebaseEvent(
                              'ACTIVIDAD_ITEM_Container_4x2dy28j_ON_LON');
                          // Find Grupo Actividad Detalle
                          logFirebaseEvent(
                              'Container_FindGrupoActividadDetalle');
                          _model.longGrupoActividadDetalleResponse =
                              await queryGrupoActividadDetalleRecordOnce(
                            queryBuilder: (grupoActividadDetalleRecord) =>
                                grupoActividadDetalleRecord
                                    .where(
                                      'grupo_actividad',
                                      isEqualTo:
                                          widget.grupoActividad?.reference,
                                    )
                                    .where(
                                      'grupo',
                                      isEqualTo: FFAppState().grupoSeleccionado,
                                    ),
                          );
                          // Find Imgs
                          logFirebaseEvent('Container_FindImgs');
                          _model.longImgResponse =
                              await queryActividadImagenesRecordOnce(
                            queryBuilder: (actividadImagenesRecord) =>
                                actividadImagenesRecord.where(
                              'actividad',
                              isEqualTo: containerActividadRecord.reference,
                            ),
                          );
                          // Find objetos a entregar
                          logFirebaseEvent('Container_Findobjetosaentregar');
                          _model.longObjetosAEntregarResponse =
                              await queryActividadObjetoAEntregarRecordOnce(
                            parent: _model.longGrupoActividadDetalleResponse
                                ?.first.reference,
                            queryBuilder: (actividadObjetoAEntregarRecord) =>
                                actividadObjetoAEntregarRecord.where(
                              'grupo',
                              isEqualTo: FFAppState().grupoSeleccionado,
                            ),
                          );
                          // find access
                          logFirebaseEvent('Container_findaccess');
                          _model.longAccessResponse =
                              await queryAccesoRecordOnce(
                            parent: _model.longGrupoActividadDetalleResponse
                                ?.first.reference,
                            queryBuilder: (accesoRecord) => accesoRecord.where(
                              'grupo',
                              isEqualTo: FFAppState().grupoSeleccionado,
                            ),
                          );
                          // open form
                          logFirebaseEvent('Container_openform');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                  child: ActionsDocumentWidget(
                                    showQrBtn: false,
                                    editAction: () async {
                                      if (containerActividadRecord
                                              .fechaInicio! >
                                          functions.toInitDayHour(
                                              getCurrentTimestamp)) {
                                        logFirebaseEvent(
                                            'openform_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.75,
                                                child: FormActivityWidget(
                                                  action: FormAction.edit,
                                                  actividad:
                                                      containerActividadRecord,
                                                  objetosAEntregar: _model
                                                      .longObjetosAEntregarResponse,
                                                  imagenes:
                                                      _model.longImgResponse,
                                                  access:
                                                      _model.longAccessResponse,
                                                  grupoActividad: widget
                                                      .grupoActividad
                                                      ?.reference,
                                                  grupoActividadDetalle: _model
                                                      .longGrupoActividadDetalleResponse,
                                                  reloadChip: () async {
                                                    logFirebaseEvent(
                                                        '_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'reload',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        // show error msg
                                        logFirebaseEvent(
                                            'openform_showerrormsg');
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Solo se puede editar una actividad antes de su fecha de inicio',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    },
                                    deleteAction: () async {
                                      if (containerActividadRecord
                                              .fechaInicio! >
                                          getCurrentTimestamp) {
                                        // Show delete modal
                                        logFirebaseEvent(
                                            'openform_Showdeletemodal');
                                        await showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: DeleteModalWidget(
                                                  deleteMsg:
                                                      'Esta acción borrará definitivamente la actividad:  ${containerActividadRecord.nombre}, ¿Desea Continuar?',
                                                  title: 'Confirmar',
                                                  deleteAction: () async {
                                                    logFirebaseEvent(
                                                        'Showdeletemodal_custom_action');
                                                    _model.deleteActividadResponse =
                                                        await actions
                                                            .deleteActividad(
                                                      _model
                                                          .longGrupoActividadDetalleResponse!
                                                          .toList(),
                                                      containerActividadRecord,
                                                      widget.grupoActividad!,
                                                      _model.longImgResponse!
                                                          .toList(),
                                                    );
                                                    if (_model
                                                        .deleteActividadResponse!
                                                        .error) {
                                                      // show error msg
                                                      logFirebaseEvent(
                                                          'Showdeletemodal_showerrormsg');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, 1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: SizedBox(
                                                              height: 80.0,
                                                              child:
                                                                  CustomSnackBarWidget(
                                                                msg: _model
                                                                    .deleteActividadResponse!
                                                                    .message,
                                                                type: ToastType
                                                                    .error,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    }
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      } else {
                                        // show error msg
                                        logFirebaseEvent(
                                            'openform_showerrormsg');
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Solo se puede eliminar una actividad antes de su fecha de inicio',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    },
                                    showQRAction: () async {},
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Hero(
                                    tag: containerActividadImagenesRecord
                                                    ?.imgPath !=
                                                null &&
                                            containerActividadImagenesRecord
                                                    ?.imgPath !=
                                                ''
                                        ? containerActividadImagenesRecord!
                                            .imgPath
                                        : FFAppConstants.noImgUrl,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      child: OctoImage(
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                          containerActividadImagenesRecord!
                                              .imgBlurPath,
                                        ),
                                        image: NetworkImage(
                                          containerActividadImagenesRecord
                                                          .imgPath !=
                                                      ''
                                              ? containerActividadImagenesRecord.imgPath
                                              : FFAppConstants.noImgUrl,
                                        ),
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.fitWidth,
                                        alignment: const Alignment(0.0, -1.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          containerActividadRecord.nombre,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 19.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          containerActividadRecord.costo == 0.0
                                              ? 'Gratis'
                                              : formatNumber(
                                                  containerActividadRecord
                                                      .costo,
                                                  formatType: FormatType.custom,
                                                  currency: 'RD\$ ',
                                                  format: '#,###.##',
                                                  locale: '',
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 0.0),
                                          child: Text(
                                            containerActividadRecord.descripcion
                                                .maybeHandleOverflow(
                                              maxChars: 50,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 13.0,
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
  }
}
