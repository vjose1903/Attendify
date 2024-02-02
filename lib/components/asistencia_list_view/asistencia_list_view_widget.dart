import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/asistencia_modal/asistencia_modal_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/forms/asistencia/form_asistencia/form_asistencia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'asistencia_list_view_model.dart';
export 'asistencia_list_view_model.dart';

class AsistenciaListViewWidget extends StatefulWidget {
  const AsistenciaListViewWidget({
    super.key,
    required this.asistenciaList,
    required this.reloadAction,
    required this.currentSelectedStringDate,
    required this.grupoActividad,
    required this.grupoActividadDetalle,
  });

  final List<AsistenciaRecord>? asistenciaList;
  final Future Function()? reloadAction;
  final String? currentSelectedStringDate;
  final DocumentReference? grupoActividad;
  final GrupoActividadDetalleRecord? grupoActividadDetalle;

  @override
  State<AsistenciaListViewWidget> createState() =>
      _AsistenciaListViewWidgetState();
}

class _AsistenciaListViewWidgetState extends State<AsistenciaListViewWidget> {
  late AsistenciaListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsistenciaListViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final actividadAsistencia = widget.asistenciaList!.toList();
        if (actividadAsistencia.isEmpty) {
          return Center(
            child: SizedBox(
              height: 290.0,
              child: EmptyListWidget(
                icon: FaIcon(
                  FontAwesomeIcons.userTimes,
                  color: FlutterFlowTheme.of(context).primaryImputBorder,
                  size: 75.0,
                ),
                title: 'Sin registros de asistencia',
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            // Reload Data
            await widget.reloadAction?.call();
          },
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: actividadAsistencia.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8.0),
            itemBuilder: (context, actividadAsistenciaIndex) {
              final actividadAsistenciaItem =
                  actividadAsistencia[actividadAsistenciaIndex];
              return Builder(
                builder: (context) =>
                    StreamBuilder<List<ObjetoEntregadoRecord>>(
                  stream: queryObjetoEntregadoRecord(
                    queryBuilder: (objetoEntregadoRecord) =>
                        objetoEntregadoRecord.where(
                      'asistencia',
                      isEqualTo: actividadAsistenciaItem.reference,
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 2.0),
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
                    List<ObjetoEntregadoRecord>
                        listTileObjetoEntregadoRecordList = snapshot.data!;
                    final listTileObjetoEntregadoRecord =
                        listTileObjetoEntregadoRecordList.isNotEmpty
                            ? listTileObjetoEntregadoRecordList.first
                            : null;
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // Find Objetos entregados
                        _model.findViewObjetosEntregados =
                            await queryObjetoEntregadoRecordOnce(
                          parent: actividadAsistenciaItem.parentReference,
                          queryBuilder: (objetoEntregadoRecord) =>
                              objetoEntregadoRecord.where(
                            'asistencia',
                            isEqualTo: actividadAsistenciaItem.reference,
                          ),
                        );
                        // show asistencia modal
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: AsistenciaModalWidget(
                                  asistencia: actividadAsistenciaItem,
                                  objetosEntregados:
                                      _model.findViewObjetosEntregados,
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        setState(() {});
                      },
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.5,
                          children: [
                            SlidableAction(
                              label: 'Editar',
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              icon: FontAwesomeIcons.pencilAlt,
                              onPressed: (_) async {
                                if (dateTimeFormat(
                                      'dd/MM/yyyy',
                                      functions
                                          .toInitDayHour(getCurrentTimestamp),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ) ==
                                    widget.currentSelectedStringDate) {
                                  // Find Grupo Usuario
                                  _model.editFindGrupoUsuarioResponse =
                                      await GrupoUsuarioRecord.getDocumentOnce(
                                          actividadAsistenciaItem
                                              .grupoUsuario!);
                                  // find user info
                                  _model.editFindUserInfoResponse =
                                      await UsuariosRecord.getDocumentOnce(
                                          _model.editFindGrupoUsuarioResponse!
                                              .usuario!);
                                  // Find tipo usuario
                                  _model.editFindTipoUsuarioResponse =
                                      await TipoUsuarioRecord.getDocumentOnce(
                                          _model.editFindGrupoUsuarioResponse!
                                              .tipoUsuario!);
                                  // find objetos a entregar
                                  _model.editFindObjetosAEntregarResponsee =
                                      await queryActividadObjetoAEntregarRecordOnce(
                                    parent:
                                        actividadAsistenciaItem.parentReference,
                                    queryBuilder:
                                        (actividadObjetoAEntregarRecord) =>
                                            actividadObjetoAEntregarRecord
                                                .where(
                                                  'grupo',
                                                  isEqualTo: FFAppState()
                                                      .grupoSeleccionado,
                                                )
                                                .where(
                                                  'tipo_usuario',
                                                  isEqualTo:
                                                      listTileObjetoEntregadoRecord
                                                          ?.tipoUsuario,
                                                )
                                                .where(
                                                  'grupo_actividad',
                                                  isEqualTo:
                                                      widget.grupoActividad,
                                                ),
                                  );
                                  // Find Objetos Entregados
                                  _model.editFindObjetosEntregados =
                                      await queryObjetoEntregadoRecordOnce(
                                    parent:
                                        actividadAsistenciaItem.parentReference,
                                    queryBuilder: (objetoEntregadoRecord) =>
                                        objetoEntregadoRecord
                                            .where(
                                              'asistencia',
                                              isEqualTo:
                                                  listTileObjetoEntregadoRecord
                                                      ?.asistencia,
                                            )
                                            .where(
                                              'grupo',
                                              isEqualTo: FFAppState()
                                                  .grupoSeleccionado,
                                            ),
                                  );
                                  // open form asistencia
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.55,
                                          child: FormAsistenciaWidget(
                                            user:
                                                _model.editFindUserInfoResponse,
                                            action: FormAction.edit,
                                            grupoUsuario: _model
                                                .editFindGrupoUsuarioResponse,
                                            tipoUsuario: _model
                                                .editFindTipoUsuarioResponse!,
                                            actividadObjetosAEntregar: _model
                                                .editFindObjetosAEntregarResponsee,
                                            grupoActividadDetalle:
                                                widget.grupoActividadDetalle!,
                                            objetosEntregados: _model
                                                .editFindObjetosEntregados,
                                            reloadChip: () async {
                                              // reload asistencia
                                              await widget.reloadAction?.call();
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  // show msg error
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Solo puede editar asistencia del dia actual',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                await widget.reloadAction?.call();

                                setState(() {});
                              },
                            ),
                            Builder(
                              builder: (context) => SlidableAction(
                                label: 'Eliminar',
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                                icon: FontAwesomeIcons.solidTrashAlt,
                                onPressed: (_) async {
                                  if (dateTimeFormat(
                                        'dd/MM/yyyy',
                                        functions
                                            .toInitDayHour(getCurrentTimestamp),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ) ==
                                      widget.currentSelectedStringDate) {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: DeleteModalWidget(
                                            deleteMsg:
                                                'Esta accioón borrará la asistencia de:  ${actividadAsistenciaItem.usuarioName}, de esta actividad. ¿Desea Continuar?',
                                            title: 'Confirmación',
                                            deleteAction: () async {
                                              // find objetos entregados
                                              _model.deleteObjetosEntregados =
                                                  await queryObjetoEntregadoRecordOnce(
                                                parent: actividadAsistenciaItem
                                                    .parentReference,
                                                queryBuilder:
                                                    (objetoEntregadoRecord) =>
                                                        objetoEntregadoRecord
                                                            .where(
                                                  'asistencia',
                                                  isEqualTo:
                                                      actividadAsistenciaItem
                                                          .reference,
                                                ),
                                              );
                                              if (_model.deleteObjetosEntregados !=
                                                      null &&
                                                  (_model.deleteObjetosEntregados)!
                                                      .isNotEmpty) {
                                                while (FFAppState().contador <
                                                    _model
                                                        .deleteObjetosEntregados!
                                                        .length) {
                                                  // delete objeto entregado
                                                  await _model
                                                      .deleteObjetosEntregados![
                                                          FFAppState().contador]
                                                      .reference
                                                      .delete();
                                                  // increment Contador
                                                  FFAppState().contador =
                                                      FFAppState().contador + 1;
                                                }
                                                FFAppState().contador = 0;
                                              }
                                              // delete asistencia
                                              await actividadAsistenciaItem
                                                  .reference
                                                  .delete();
                                              // reload asistencia
                                              await widget.reloadAction?.call();
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    // show msg error
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Solo puede eliminar asistencia del dia actual',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  // reload asistencia
                                  await widget.reloadAction?.call();

                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            valueOrDefault<String>(
                              actividadAsistenciaItem.usuarioName,
                              'No Definido',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                ),
                          ),
                          subtitle: Text(
                            listTileObjetoEntregadoRecord != null
                                ? 'Entregado: ${listTileObjetoEntregadoRecord.cantidad.toString()}  ${listTileObjetoEntregadoRecord.objetoAEntregarLabel}'
                                : '',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.5,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          dense: false,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
