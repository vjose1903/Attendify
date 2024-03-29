import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_snack_bar/custom_snack_bar_widget.dart';
import '/components/forms/asistencia/asistencia_objeto_a_entregar/asistencia_objeto_a_entregar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'form_asistencia_model.dart';
export 'form_asistencia_model.dart';

class FormAsistenciaWidget extends StatefulWidget {
  const FormAsistenciaWidget({
    super.key,
    this.user,
    required this.reloadChip,
    required this.action,
    this.grupoUsuario,
    required this.tipoUsuario,
    this.actividadObjetosAEntregar,
    required this.grupoActividadDetalle,
    this.objetosEntregados,
  });

  final UsuariosRecord? user;
  final Future Function()? reloadChip;
  final FormAction? action;
  final GrupoUsuarioRecord? grupoUsuario;
  final TipoUsuarioRecord? tipoUsuario;
  final List<ActividadObjetoAEntregarRecord>? actividadObjetosAEntregar;
  final GrupoActividadDetalleRecord? grupoActividadDetalle;
  final List<ObjetoEntregadoRecord>? objetosEntregados;

  @override
  State<FormAsistenciaWidget> createState() => _FormAsistenciaWidgetState();
}

class _FormAsistenciaWidgetState extends State<FormAsistenciaWidget> {
  late FormAsistenciaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormAsistenciaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FORM_ASISTENCIA_FormAsistencia_ON_INIT_S');
      if (widget.action == FormAction.create) {
        if (widget.actividadObjetosAEntregar!.isNotEmpty) {
          while (FFAppState().contador <
              widget.actividadObjetosAEntregar!.length) {
            logFirebaseEvent('FormAsistencia_update_component_state');
            _model.addToObjetosEntregados(
                ObjetoAEntregarStruct.maybeFromMap(<String, dynamic>{
              'cantidadMaxima': widget
                  .actividadObjetosAEntregar?[FFAppState().contador].cantidad,
              'objetoAEntregar': widget
                  .actividadObjetosAEntregar?[FFAppState().contador]
                  .objetoAEntregar,
              'objetoAEntregarLabel': widget
                  .actividadObjetosAEntregar?[FFAppState().contador]
                  .objetoAEntregarLabel,
              'cantidadAEntregar': FFAppConstants.cero,
              'actividadObjetoAEntregar': widget
                  .actividadObjetosAEntregar?[FFAppState().contador].reference,
            })!
                    .toMap());
            // Increment Contador
            logFirebaseEvent('FormAsistencia_IncrementContador');
            FFAppState().contador = FFAppState().contador + 1;
          }
          // Reset Contador
          logFirebaseEvent('FormAsistencia_ResetContador');
          setState(() {
            FFAppState().contador = 0;
          });
        }
      } else {
        if (widget.objetosEntregados!.isNotEmpty) {
          while (FFAppState().contador < widget.objetosEntregados!.length) {
            logFirebaseEvent('FormAsistencia_update_component_state');
            _model.addToObjetosEntregados(
                ObjetoAEntregarStruct.maybeFromMap(<String, dynamic>{
              'cantidadMaxima': widget.actividadObjetosAEntregar
                  ?.where((e) =>
                      e.objetoAEntregar ==
                      widget.objetosEntregados?[FFAppState().contador]
                          .objetoAEntregar)
                  .toList()
                  .first
                  .cantidad,
              'objetoAEntregar': widget.actividadObjetosAEntregar
                  ?.where((e) =>
                      e.objetoAEntregar ==
                      widget.objetosEntregados?[FFAppState().contador]
                          .objetoAEntregar)
                  .toList()
                  .first
                  .objetoAEntregar,
              'objetoAEntregarLabel': widget.actividadObjetosAEntregar
                  ?.where((e) =>
                      e.objetoAEntregar ==
                      widget.objetosEntregados?[FFAppState().contador]
                          .objetoAEntregar)
                  .toList()
                  .first
                  .objetoAEntregarLabel,
              'cantidadAEntregar':
                  widget.objetosEntregados?[FFAppState().contador].cantidad,
              'actividadObjetoAEntregar': widget.actividadObjetosAEntregar
                  ?.where((e) =>
                      e.objetoAEntregar ==
                      widget.objetosEntregados?[FFAppState().contador]
                          .objetoAEntregar)
                  .toList()
                  .first
                  .reference,
              'objetoEntregadoReference':
                  widget.objetosEntregados?[FFAppState().contador].reference,
            })!
                    .toMap());
            // Increment Contador
            logFirebaseEvent('FormAsistencia_IncrementContador');
            FFAppState().contador = FFAppState().contador + 1;
          }
          // Reset Contador
          logFirebaseEvent('FormAsistencia_ResetContador');
          setState(() {
            FFAppState().contador = 0;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: Text(
                    widget.action == FormAction.edit
                        ? 'Modificar asistencia'
                        : 'Crear asistencia',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Control de Asistencia: Registra la Presencia',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.user?.photoUrl != null &&
                                    widget.user?.photoUrl != ''
                                ? widget.user?.photoUrl
                                : FFAppConstants.noUserImgUrl,
                            'https://firebasestorage.googleapis.com/v0/b/carnaval-d2054.appspot.com/o/assets%2Fuser.png?alt=media&token=765cad05-627d-4fdd-8621-d333ecf3271a',
                          ),
                          width: 70.0,
                          height: 70.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget.user?.displayName,
                                'No Definido',
                              ),
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                  ),
                              minFontSize: 16.0,
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.tipoUsuario?.descripcion,
                                'N/A',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
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
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).lightT10,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    if (widget.actividadObjetosAEntregar!.isNotEmpty) {
                      return Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (_model.objetosEntregados.isNotEmpty) {
                                  return Builder(
                                    builder: (context) {
                                      final actividadObjetoAEntregar =
                                          _model.objetosEntregados.toList();
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              actividadObjetoAEntregar.length,
                                              (actividadObjetoAEntregarIndex) {
                                            final actividadObjetoAEntregarItem =
                                                actividadObjetoAEntregar[
                                                    actividadObjetoAEntregarIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                15.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  widget.action ==
                                                                          FormAction
                                                                              .create
                                                                      ? 16.0
                                                                      : 5.0,
                                                                  0.0,
                                                                ),
                                                                0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .asistenciaObjetoAEntregarModels
                                                          .getModel(
                                                        getJsonField(
                                                          actividadObjetoAEntregarItem,
                                                          r'''$.actividadObjetoAEntregar''',
                                                        ).toString(),
                                                        actividadObjetoAEntregarIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          AsistenciaObjetoAEntregarWidget(
                                                        key: Key(
                                                          'Keyb6u_${getJsonField(
                                                            actividadObjetoAEntregarItem,
                                                            r'''$.actividadObjetoAEntregar''',
                                                          ).toString()}',
                                                        ),
                                                        actividadObjetoEntregar:
                                                            actividadObjetoAEntregarItem,
                                                        action: widget.action!,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Builder(
                                    builder: (context) {
                                      final objDeliver = widget
                                              .actividadObjetosAEntregar
                                              ?.toList() ??
                                          [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(objDeliver.length,
                                                (objDeliverIndex) {
                                          final objDeliverItem =
                                              objDeliver[objDeliverIndex];
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/lottie_animations/Animation_-_1705844841203.json',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 0.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'FORM_ASISTENCIA_COMP_CANCELAR_BTN_ON_TAP');
                      // Hide Bottom Sheet
                      logFirebaseEvent('Button_HideBottomSheet');
                      Navigator.pop(context);
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('FORM_ASISTENCIA_COMP__BTN_ON_TAP');
                        var shouldSetState = false;
                        // Create asistencia
                        logFirebaseEvent('Button_Createasistencia');

                        var asistenciaRecordReference =
                            AsistenciaRecord.createDoc(
                                widget.grupoActividadDetalle!.reference);
                        await asistenciaRecordReference
                            .set(createAsistenciaRecordData(
                          usuarioName: widget.user?.displayName,
                          presente: true,
                          grupo: FFAppState().grupoSeleccionado,
                          grupoName: FFAppState().grupoSeleccionadoName,
                          grupoUsuario: widget.grupoUsuario?.reference,
                          horaLlegada: getCurrentTimestamp,
                          tipoUsuarioLabel: widget.tipoUsuario?.descripcion,
                        ));
                        _model.createAsistenciaResponse =
                            AsistenciaRecord.getDocumentFromData(
                                createAsistenciaRecordData(
                                  usuarioName: widget.user?.displayName,
                                  presente: true,
                                  grupo: FFAppState().grupoSeleccionado,
                                  grupoName: FFAppState().grupoSeleccionadoName,
                                  grupoUsuario: widget.grupoUsuario?.reference,
                                  horaLlegada: getCurrentTimestamp,
                                  tipoUsuarioLabel:
                                      widget.tipoUsuario?.descripcion,
                                ),
                                asistenciaRecordReference);
                        shouldSetState = true;
                        if (_model.objetosEntregados.isNotEmpty) {
                          if (functions
                              .evaluateObjetosAEntregar(
                                  _model.objetosEntregados.toList())
                              .error) {
                            // Delete asistencia
                            logFirebaseEvent('Button_Deleteasistencia');
                            await _model.createAsistenciaResponse!.reference
                                .delete();
                            // show error overlap maximun
                            logFirebaseEvent('Button_showerroroverlapmaximun');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: SizedBox(
                                    height: 100.0,
                                    width: double.infinity,
                                    child: CustomSnackBarWidget(
                                      msg: functions
                                          .evaluateObjetosAEntregar(
                                              _model.objetosEntregados.toList())
                                          .message,
                                      type: ToastType.error,
                                      automaticHide: true,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            if (shouldSetState) setState(() {});
                            return;
                          } else {
                            while (FFAppState().contador <
                                _model.objetosEntregados.length) {
                              if (widget.action == FormAction.create) {
                                // Create Objeto Response
                                logFirebaseEvent('Button_CreateObjetoResponse');

                                var objetoEntregadoRecordReference =
                                    ObjetoEntregadoRecord.createDoc(widget
                                        .grupoActividadDetalle!.reference);
                                await objetoEntregadoRecordReference
                                    .set(createObjetoEntregadoRecordData(
                                  asistencia: _model
                                      .createAsistenciaResponse?.reference,
                                  objetoAEntregar: functions
                                      .parseObjetoAEntregarDataType(
                                          _model.objetosEntregados[
                                              FFAppState().contador])
                                      .objetoAEntregar,
                                  objetoAEntregarLabel: functions
                                      .parseObjetoAEntregarDataType(
                                          _model.objetosEntregados[
                                              FFAppState().contador])
                                      .objetoAEntregarLabel,
                                  grupoUsuario: widget.grupoUsuario?.reference,
                                  usuarioName: widget.user?.displayName,
                                  cantidad: functions
                                      .parseObjetoAEntregarDataType(
                                          _model.objetosEntregados[
                                              FFAppState().contador])
                                      .cantidadAEntregar,
                                  grupo: FFAppState().grupoSeleccionado,
                                  tipoUsuario: widget.tipoUsuario?.reference,
                                ));
                                _model.createObjetoEntregadoResponse =
                                    ObjetoEntregadoRecord.getDocumentFromData(
                                        createObjetoEntregadoRecordData(
                                          asistencia: _model
                                              .createAsistenciaResponse
                                              ?.reference,
                                          objetoAEntregar: functions
                                              .parseObjetoAEntregarDataType(
                                                  _model.objetosEntregados[
                                                      FFAppState().contador])
                                              .objetoAEntregar,
                                          objetoAEntregarLabel: functions
                                              .parseObjetoAEntregarDataType(
                                                  _model.objetosEntregados[
                                                      FFAppState().contador])
                                              .objetoAEntregarLabel,
                                          grupoUsuario:
                                              widget.grupoUsuario?.reference,
                                          usuarioName: widget.user?.displayName,
                                          cantidad: functions
                                              .parseObjetoAEntregarDataType(
                                                  _model.objetosEntregados[
                                                      FFAppState().contador])
                                              .cantidadAEntregar,
                                          grupo: FFAppState().grupoSeleccionado,
                                          tipoUsuario:
                                              widget.tipoUsuario?.reference,
                                        ),
                                        objetoEntregadoRecordReference);
                                shouldSetState = true;
                              } else {
                                // edit Objeto Response
                                logFirebaseEvent('Button_editObjetoResponse');

                                await functions
                                    .parseObjetoAEntregarDataType(
                                        _model.objetosEntregados[
                                            FFAppState().contador])
                                    .objetoEntregadoReference!
                                    .update(createObjetoEntregadoRecordData(
                                      cantidad: functions
                                          .parseObjetoAEntregarDataType(
                                              _model.objetosEntregados[
                                                  FFAppState().contador])
                                          .cantidadAEntregar,
                                    ));
                              }

                              // Increment Contador
                              logFirebaseEvent('Button_IncrementContador');
                              FFAppState().contador = FFAppState().contador + 1;
                            }
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().contador = 0;
                          }
                        }
                        if (widget.action == FormAction.edit) {
                          // Delete asistencia
                          logFirebaseEvent('Button_Deleteasistencia');
                          await _model.createAsistenciaResponse!.reference
                              .delete();
                        }
                        // Hide Bottom Sheet
                        logFirebaseEvent('Button_HideBottomSheet');
                        Navigator.pop(context);
                        // Reload List
                        logFirebaseEvent('Button_ReloadList');
                        await widget.reloadChip?.call();
                        if (shouldSetState) setState(() {});
                      },
                      text: widget.action == FormAction.edit
                          ? 'Editar asistencia'
                          : 'Guardar asistencia',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
