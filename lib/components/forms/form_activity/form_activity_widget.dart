import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_snack_bar/custom_snack_bar_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'form_activity_model.dart';
export 'form_activity_model.dart';

class FormActivityWidget extends StatefulWidget {
  const FormActivityWidget({
    super.key,
    required this.reloadChip,
    required this.action,
    this.actividad,
    this.objetosAEntregar,
    this.imagenes,
    this.access,
    this.grupoActividad,
    this.grupoActividadDetalle,
  });

  final Future Function()? reloadChip;
  final FormAction? action;
  final ActividadRecord? actividad;
  final List<ActividadObjetoAEntregarRecord>? objetosAEntregar;
  final List<ActividadImagenesRecord>? imagenes;
  final List<AccesoRecord>? access;
  final DocumentReference? grupoActividad;
  final List<GrupoActividadDetalleRecord>? grupoActividadDetalle;

  @override
  State<FormActivityWidget> createState() => _FormActivityWidgetState();
}

class _FormActivityWidgetState extends State<FormActivityWidget> {
  late FormActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormActivityModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Make Array for the creation activity group
      _model.addToGruposParaLaActividad(FFAppState().grupoSeleccionado!);
      if (widget.imagenes != null && (widget.imagenes)!.isNotEmpty) {
        // start processing Imgs
        setState(() {
          _model.processingImgs = true;
        });
        while (FFAppState().contador < widget.imagenes!.length) {
          // Add img to state
          setState(() {
            _model.addToImgsToSave(<String, dynamic>{
              'imgPath': widget.imagenes?[FFAppState().contador].imgPath,
              'isPortada': widget.imagenes?[FFAppState().contador].isPortada,
              'reference': widget.imagenes?[FFAppState().contador].reference,
              'documentID':
                  widget.imagenes?[FFAppState().contador].reference.id,
              'imgBlurPath':
                  widget.imagenes?[FFAppState().contador].imgBlurPath,
            });
          });
          // increment Contador
          setState(() {
            FFAppState().contador = FFAppState().contador + 1;
          });
        }
        // reset Contador
        FFAppState().contador = 0;
        // end processing Imgs
        setState(() {
          _model.processingImgs = false;
        });
      }
      if (widget.objetosAEntregar != null &&
          (widget.objetosAEntregar)!.isNotEmpty) {
        // start processing deliver items
        setState(() {
          _model.processingDeliverITems = true;
        });
        while (FFAppState().contador < widget.objetosAEntregar!.length) {
          // Add item to state
          setState(() {
            _model.addToObjetosAEntregarSelected(<String, dynamic>{
              'tipo_usuario': <String, dynamic>{
                'descripcion': widget
                    .objetosAEntregar?[FFAppState().contador].tipoUsuarioLabel,
                'reference': widget
                    .objetosAEntregar?[FFAppState().contador].tipoUsuario,
              },
              'objeto_a_entregar': <String, dynamic>{
                'descripcion': widget.objetosAEntregar?[FFAppState().contador]
                    .objetoAEntregarLabel,
                'reference': widget
                    .objetosAEntregar?[FFAppState().contador].objetoAEntregar,
              },
              'cantidad':
                  widget.objetosAEntregar?[FFAppState().contador].cantidad,
              'reference':
                  widget.objetosAEntregar?[FFAppState().contador].reference,
              'documentID':
                  widget.objetosAEntregar?[FFAppState().contador].reference.id,
            });
          });
          // increment Contador
          setState(() {
            FFAppState().contador = FFAppState().contador + 1;
          });
        }
        // reset Contador
        setState(() {
          FFAppState().contador = 0;
        });
        // end processing deliver items
        setState(() {
          _model.processingDeliverITems = false;
        });
      }
      if (widget.access != null && (widget.access)!.isNotEmpty) {
        // start processing access
        _model.processingAccess = true;
        while (FFAppState().contador < widget.access!.length) {
          // add access to state
          _model.addToAccessToSave(
              widget.access![FFAppState().contador].tipoUsuarioLabel);
          // increment Contador
          setState(() {
            FFAppState().contador = FFAppState().contador + 1;
          });
        }
        // reset Contador
        setState(() {
          FFAppState().contador = 0;
        });
        // end processing access
        setState(() {
          _model.processingAccess = false;
        });
      } else {
        // start processing access
        _model.processingAccess = true;
        _model.allTipoUsuarioResponse = await queryTipoUsuarioRecordOnce();
        while (FFAppState().contador < _model.allTipoUsuarioResponse!.length) {
          // add tipo user to state
          setState(() {
            _model.addToAccessToSave(_model
                .allTipoUsuarioResponse![FFAppState().contador].descripcion);
          });
          // increment Contador
          setState(() {
            FFAppState().contador = FFAppState().contador + 1;
          });
        }
        // reset Contador
        setState(() {
          FFAppState().contador = 0;
        });
        // end processing access
        setState(() {
          _model.processingAccess = false;
        });
      }

      setState(() {});
    });

    _model.nombreTxtController ??=
        TextEditingController(text: widget.actividad?.nombre);
    _model.nombreTxtFocusNode ??= FocusNode();

    _model.descripcionTxtController ??=
        TextEditingController(text: widget.actividad?.descripcion);
    _model.descripcionTxtFocusNode ??= FocusNode();

    _model.fechaTxtController ??= TextEditingController();
    _model.fechaTxtFocusNode ??= FocusNode();
    _model.fechaTxtFocusNode!.addListener(
      () async {
        if (widget.action == FormAction.edit) {
          // Blur current Input
          await actions.blurCurrentInput(
            context,
          );
          // dates can't edit
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 1.0)
                    .resolve(Directionality.of(context)),
                child: const SizedBox(
                  height: 80.0,
                  width: double.infinity,
                  child: CustomSnackBarWidget(
                    msg:
                        'No se puede editar el rango de fecha de una actividad.',
                    type: ToastType.error,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));

          return;
        } else {
          if ((_model.fechaTxtFocusNode?.hasFocus ?? false)) {
            if (_model.datePickerShow) {
              // Switch datePicker to false
              setState(() {
                _model.datePickerShow = false;
              });
            } else {
              // Show DatePicker
              final datePicked1Date = await showDatePicker(
                context: context,
                initialDate: ((_model.fechaTxtController.text != ''
                        ? functions.parseDateStringToDateTime(
                            _model.fechaTxtController.text)
                        : getCurrentTimestamp) ??
                    DateTime.now()),
                firstDate: (getCurrentTimestamp ?? DateTime(1900)),
                lastDate: ((_model.hastaTxtController.text != ''
                        ? functions.parseDateStringToDateTime(
                            _model.fechaTxtController.text)
                        : null) ??
                    DateTime(2050)),
                builder: (context, child) {
                  return wrapInMaterialDatePickerTheme(
                    context,
                    child!,
                    headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                    headerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    headerTextStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                            ),
                    pickerBackgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    pickerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    selectedDateTimeBackgroundColor:
                        FlutterFlowTheme.of(context).primary,
                    selectedDateTimeForegroundColor:
                        FlutterFlowTheme.of(context).primaryImputBackground,
                    actionButtonForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    iconSize: 24.0,
                  );
                },
              );

              if (datePicked1Date != null) {
                safeSetState(() {
                  _model.datePicked1 = DateTime(
                    datePicked1Date.year,
                    datePicked1Date.month,
                    datePicked1Date.day,
                  );
                });
              }
              // Switch datePicker to true
              setState(() {
                _model.datePickerShow = true;
              });
              if (_model.datePicked1 != null) {
                // Set fecha/desde Value
                setState(() {
                  _model.fechaTxtController?.text = valueOrDefault<String>(
                    dateTimeFormat(
                      'dd/MM/yyyy',
                      _model.datePicked1,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'FechaDatePickerSelected',
                  );
                });
                if (_model.oneDaySwitchValue!) {
                  // Set hasta Value
                  setState(() {
                    _model.hastaTxtController?.text = valueOrDefault<String>(
                      dateTimeFormat(
                        'dd/MM/yyyy',
                        _model.datePicked1,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      'FechaDatePickerSelected',
                    );
                  });
                }
                // Blur current Input
                await actions.blurCurrentInput(
                  context,
                );
              }
            }
          } else {
            // Switch datePicker to false
            setState(() {
              _model.datePickerShow = false;
            });
          }
        }
      },
    );
    _model.hastaTxtController ??= TextEditingController();
    _model.hastaTxtFocusNode ??= FocusNode();
    _model.hastaTxtFocusNode!.addListener(
      () async {
        if (widget.action == FormAction.edit) {
          // Blur current Input
          await actions.blurCurrentInput(
            context,
          );
          // dates can't edit
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 1.0)
                    .resolve(Directionality.of(context)),
                child: const SizedBox(
                  height: 80.0,
                  width: double.infinity,
                  child: CustomSnackBarWidget(
                    msg:
                        'No se puede editar el rango de fecha de una actividad.',
                    type: ToastType.error,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));

          return;
        } else {
          if ((_model.hastaTxtFocusNode?.hasFocus ?? false)) {
            if (_model.datePickerShow) {
              // Switch datePicker to false
              setState(() {
                _model.datePickerShow = false;
              });
            } else {
              // Show DatePicker
              final datePicked2Date = await showDatePicker(
                context: context,
                initialDate: (() {
                      if (_model.hastaTxtController.text != '') {
                        return functions.parseDateStringToDateTime(
                            _model.hastaTxtController.text);
                      } else if (_model.fechaTxtController.text != '') {
                        return functions.parseDateStringToDateTime(
                            _model.fechaTxtController.text);
                      } else {
                        return getCurrentTimestamp;
                      }
                    }() ??
                    DateTime.now()),
                firstDate: ((_model.fechaTxtController.text != ''
                        ? functions.parseDateStringToDateTime(
                            _model.fechaTxtController.text)
                        : getCurrentTimestamp) ??
                    DateTime(1900)),
                lastDate: DateTime(2050),
                builder: (context, child) {
                  return wrapInMaterialDatePickerTheme(
                    context,
                    child!,
                    headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                    headerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    headerTextStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                            ),
                    pickerBackgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    pickerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    selectedDateTimeBackgroundColor:
                        FlutterFlowTheme.of(context).primary,
                    selectedDateTimeForegroundColor:
                        FlutterFlowTheme.of(context).primaryImputBorder,
                    actionButtonForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    iconSize: 24.0,
                  );
                },
              );

              if (datePicked2Date != null) {
                safeSetState(() {
                  _model.datePicked2 = DateTime(
                    datePicked2Date.year,
                    datePicked2Date.month,
                    datePicked2Date.day,
                  );
                });
              }
              // Switch datePicker to true
              setState(() {
                _model.datePickerShow = true;
              });
              if (_model.datePicked2 != null) {
                // Set hasta Value
                setState(() {
                  _model.hastaTxtController?.text = valueOrDefault<String>(
                    dateTimeFormat(
                      'dd/MM/yyyy',
                      _model.datePicked2,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'hastaDatePickerSelected',
                  );
                });
              }
              // Blur current Input
              await actions.blurCurrentInput(
                context,
              );
            }
          } else {
            // Switch datePicker to false
            setState(() {
              _model.datePickerShow = false;
            });
          }
        }
      },
    );
    _model.costoTxtController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.actividad?.costo.toString(),
      '0',
    ));
    _model.costoTxtFocusNode ??= FocusNode();

    _model.deliverCantTxtController ??= TextEditingController();
    _model.deliverCantTxtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.fechaTxtController?.text = dateTimeFormat(
            'dd/MM/yyyy',
            widget.actividad?.fechaInicio,
            locale: FFLocalizations.of(context).languageCode,
          );
          _model.hastaTxtController?.text = dateTimeFormat(
            'dd/MM/yyyy',
            widget.actividad?.fechaFin,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
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
                        ? 'Modificar actividad'
                        : 'Crear actividad',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Modela Tu Agenda: Creación y Edición de Actividades',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  controller: _model.scrollColumn,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Form(
                          key: _model.formKey1,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 40.0, 0.0, 5.0),
                                  child: Text(
                                    'Acceso permitido',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryImputBorder,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: _model.rowChips,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (!_model.processingAccess) {
                                              return StreamBuilder<
                                                  List<TipoUsuarioRecord>>(
                                                stream:
                                                    queryTipoUsuarioRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        child:
                                                            SpinKitChasingDots(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 60.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TipoUsuarioRecord>
                                                      chipsAccesoTipoUsuarioRecordList =
                                                      snapshot.data!;
                                                  return FlutterFlowChoiceChips(
                                                    options:
                                                        chipsAccesoTipoUsuarioRecordList
                                                            .map((e) =>
                                                                e.descripcion)
                                                            .toList()
                                                            .map((label) =>
                                                                ChipData(label))
                                                            .toList(),
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .chipsAccesoValues =
                                                            val),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 13.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 18.0,
                                                      labelPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  1.0,
                                                                  5.0,
                                                                  1.0),
                                                      elevation: 4.0,
                                                      borderWidth: 2.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryImputBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 13.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      iconSize: 18.0,
                                                      labelPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  1.0,
                                                                  5.0,
                                                                  1.0),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .chipsAccesoValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .chipsAccesoValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      _model.accessToSave,
                                                    ),
                                                    wrapped: false,
                                                  );
                                                },
                                              );
                                            } else {
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.89,
                                                height: 32.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Lottie.asset(
                                                  'assets/lottie_animations/Animation_-_1705844841203.json',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.4,
                                                  height: 100.0,
                                                  fit: BoxFit.contain,
                                                  animate: true,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ]
                                          .addToStart(const SizedBox(width: 10.0))
                                          .addToEnd(const SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.nombreTxtController,
                                  focusNode: _model.nombreTxtFocusNode,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Introduzca el nombre',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryImputBorder,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryImputBackground,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.nombreTxtControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.descripcionTxtController,
                                  focusNode: _model.descripcionTxtFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Descripción',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: 'Introduzca una descripción',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryImputBorder,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryImputBackground,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: 4,
                                  minLines: 4,
                                  validator: _model
                                      .descripcionTxtControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget.action == FormAction.edit) {
                                        // dates can't edit
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: const SizedBox(
                                                height: 80.0,
                                                width: double.infinity,
                                                child: CustomSnackBarWidget(
                                                  msg:
                                                      'No se puede editar el rango de fecha de una actividad.',
                                                  type: ToastType.error,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      } else {
                                        // change switch
                                        setState(() {
                                          _model.oneDaySwitchValue =
                                              (_model.oneDaySwitchValue!
                                                  ? false
                                                  : true);
                                        });
                                        if (_model.oneDaySwitchValue!) {
                                          if (_model.fechaTxtController.text !=
                                                  '') {
                                            // Set Same date on endDate
                                            setState(() {
                                              _model.hastaTxtController?.text =
                                                  dateTimeFormat(
                                                'dd/MM/yyyy',
                                                functions
                                                    .parseDateStringToDateTime(
                                                        _model
                                                            .fechaTxtController
                                                            .text),
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            });
                                          }
                                        } else {
                                          // Clear HastaTxt
                                          setState(() {
                                            _model.hastaTxtController?.clear();
                                          });
                                        }
                                      }
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Un solo día',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Switch.adaptive(
                                                value: _model
                                                    .oneDaySwitchValue ??= ((widget
                                                                    .actividad !=
                                                                null) &&
                                                            (widget.actividad
                                                                    ?.fechaInicio ==
                                                                widget.actividad
                                                                    ?.fechaFin)) ||
                                                        (widget.actividad ==
                                                            null)
                                                    ? true
                                                    : false,
                                                onChanged: (widget.action ==
                                                        FormAction.edit)
                                                    ? null
                                                    : (newValue) async {
                                                        setState(() => _model
                                                                .oneDaySwitchValue =
                                                            newValue);
                                                        if (newValue) {
                                                          if (_model.fechaTxtController
                                                                      .text !=
                                                                  '') {
                                                            // Set Same date on endDate
                                                            setState(() {
                                                              _model.hastaTxtController
                                                                      ?.text =
                                                                  dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                functions.parseDateStringToDateTime(
                                                                    _model
                                                                        .fechaTxtController
                                                                        .text),
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                            });
                                                          }
                                                        } else {
                                                          // Clear HastaTxt
                                                          setState(() {
                                                            _model
                                                                .hastaTxtController
                                                                ?.clear();
                                                          });
                                                        }
                                                      },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryImputBorder,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Builder(
                                        builder: (context) => TextFormField(
                                          controller: _model.fechaTxtController,
                                          focusNode: _model.fechaTxtFocusNode,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          readOnly:
                                              widget.action == FormAction.edit,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: valueOrDefault<String>(
                                              _model.oneDaySwitchValue == true
                                                  ? 'Fecha'
                                                  : 'Desde',
                                              'Fecha',
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: 'DD/MM/YYYY',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryImputBorder,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryImputBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          keyboardType: TextInputType.datetime,
                                          validator: _model
                                              .fechaTxtControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.fechaTxtMask
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (_model.oneDaySwitchValue == false)
                                      Expanded(
                                        child: Builder(
                                          builder: (context) => TextFormField(
                                            controller:
                                                _model.hastaTxtController,
                                            focusNode: _model.hastaTxtFocusNode,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            readOnly: widget.action ==
                                                FormAction.edit,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Hasta',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintText: 'DD/MM/YYYY',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryImputBorder,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryImputBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            keyboardType:
                                                TextInputType.datetime,
                                            validator: _model
                                                .hastaTxtControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.hastaTxtMask
                                            ],
                                          ),
                                        ),
                                      ),
                                  ].divide(const SizedBox(width: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // change free switch
                                    setState(() {
                                      _model.freeSwitchValue =
                                          (_model.freeSwitchValue!
                                              ? false
                                              : true);
                                    });
                                    if (_model.freeSwitchValue!) {
                                      // Set Costo 0
                                      setState(() {
                                        _model.costoTxtController?.text = '0';
                                      });
                                    } else {
                                      // Clean Costo
                                      setState(() {
                                        _model.costoTxtController?.clear();
                                      });
                                    }
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Gratis.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Switch.adaptive(
                                              value: _model.freeSwitchValue ??=
                                                  ((widget.actividad != null) &&
                                                              (widget.actividad
                                                                      ?.costo ==
                                                                  0.0)) ||
                                                          (widget.actividad ==
                                                              null)
                                                      ? true
                                                      : false,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    _model.freeSwitchValue =
                                                        newValue);
                                                if (newValue) {
                                                  // Set Costo 0
                                                  setState(() {
                                                    _model.costoTxtController
                                                        ?.text = '0';
                                                  });
                                                } else {
                                                  // Reset costo field
                                                  setState(() {
                                                    _model.costoTxtController
                                                        ?.clear();
                                                  });
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryImputBorder,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.freeSwitchValue == false)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.costoTxtController,
                                    focusNode: _model.costoTxtFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Costo',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'Introduzca el Costo',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryImputBorder,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryImputBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .costoTxtControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Imagenes',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 35.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .disablePrimaryColor,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed:
                                                        _model.uploadingIMG
                                                            ? null
                                                            : () async {
                                                                // Is Uploading IMG
                                                                setState(() {
                                                                  _model.uploadingIMG =
                                                                      true;
                                                                });
                                                                // Upload files to firestore
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  imageQuality:
                                                                      55,
                                                                  includeBlurHash:
                                                                      true,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isDataUploading =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Uploading file...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFiles =
                                                                          selectedUploadedFiles;
                                                                      _model.uploadedFileUrls =
                                                                          downloadUrls;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Success!');
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Failed to upload data');
                                                                    return;
                                                                  }
                                                                }

                                                                // IMGS uploaded
                                                                setState(() {
                                                                  _model.uploadingIMG =
                                                                      false;
                                                                });
                                                                if (_model
                                                                        .uploadedFileUrls.isNotEmpty) {
                                                                  while (FFAppState()
                                                                          .contador <
                                                                      _model
                                                                          .uploadedFileUrls
                                                                          .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.addToImgsToSave(<String,
                                                                          dynamic>{
                                                                        'imgPath':
                                                                            _model.uploadedFileUrls[FFAppState().contador],
                                                                        'isPortada': (widget.action == FormAction.create) &&
                                                                                (_model.imgsToSave.isEmpty) &&
                                                                                (FFAppState().contador == 0)
                                                                            ? true
                                                                            : false,
                                                                        'imgBlurPath': _model
                                                                            .uploadedLocalFiles[FFAppState().contador]
                                                                            .blurHash,
                                                                      });
                                                                    });
                                                                    // Increment Contador
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .contador =
                                                                          FFAppState().contador +
                                                                              1;
                                                                    });
                                                                  }
                                                                  // Reset contador
                                                                  FFAppState()
                                                                      .contador = 0;
                                                                }
                                                              },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 350.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryImputBorder,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  if (!_model.processingImgs) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final imgSelected =
                                                              _model.imgsToSave
                                                                  .toList();
                                                          if (imgSelected
                                                              .isEmpty) {
                                                            return EmptyListWidget(
                                                              icon: Icon(
                                                                Icons
                                                                    .image_search,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .noSelectedOption,
                                                                size: 70.0,
                                                              ),
                                                              title:
                                                                  'No hay imagenes seleccionadas',
                                                            );
                                                          }
                                                          return ListView
                                                              .separated(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              0,
                                                              0,
                                                              20.0,
                                                            ),
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                imgSelected
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                const SizedBox(
                                                                    height:
                                                                        15.0),
                                                            itemBuilder: (context,
                                                                imgSelectedIndex) {
                                                              final imgSelectedItem =
                                                                  imgSelected[
                                                                      imgSelectedIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 80.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                80.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                getJsonField(
                                                                                          imgSelectedItem,
                                                                                          r'''$.imgPath''',
                                                                                        ) !=
                                                                                        null
                                                                                    ? getJsonField(
                                                                                        imgSelectedItem,
                                                                                        r'''$.imgPath''',
                                                                                      ).toString()
                                                                                    : FFAppConstants.noImgUrl,
                                                                                width: 300.0,
                                                                                height: 100.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                      ),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxPortadaValueMap[imgSelectedItem] ??= getJsonField(
                                                                                      imgSelectedItem,
                                                                                      r'''$.isPortada''',
                                                                                    ),
                                                                                    onChanged: (newValue) async {
                                                                                      setState(() => _model.checkboxPortadaValueMap[imgSelectedItem] = newValue!);
                                                                                      if (newValue!) {
                                                                                        while (FFAppState().contador < _model.imgsToSave.length) {
                                                                                          if (getJsonField(
                                                                                                _model.imgsToSave[FFAppState().contador],
                                                                                                r'''$.imgPath''',
                                                                                              ) !=
                                                                                              getJsonField(
                                                                                                imgSelectedItem,
                                                                                                r'''$.imgPath''',
                                                                                              )) {
                                                                                            // Set all to false
                                                                                            setState(() {
                                                                                              _model.updateImgsToSaveAtIndex(
                                                                                                FFAppState().contador,
                                                                                                (_) => <String, dynamic>{
                                                                                                  'imgPath': getJsonField(
                                                                                                    _model.imgsToSave[FFAppState().contador],
                                                                                                    r'''$.imgPath''',
                                                                                                  ),
                                                                                                  'isPortada': false,
                                                                                                  'reference': _model.imgsToSave[FFAppState().contador] != null
                                                                                                      ? getJsonField(
                                                                                                          _model.imgsToSave[FFAppState().contador],
                                                                                                          r'''$.reference''',
                                                                                                        )
                                                                                                      : null,
                                                                                                  'imgBlurPath': getJsonField(
                                                                                                    _model.imgsToSave[FFAppState().contador],
                                                                                                    r'''$.imgBlurPath''',
                                                                                                  ),
                                                                                                },
                                                                                              );
                                                                                            });
                                                                                          } else {
                                                                                            // change Actual to true
                                                                                            setState(() {
                                                                                              _model.updateImgsToSaveAtIndex(
                                                                                                FFAppState().contador,
                                                                                                (_) => <String, dynamic>{
                                                                                                  'imgPath': getJsonField(
                                                                                                    _model.imgsToSave[FFAppState().contador],
                                                                                                    r'''$.imgPath''',
                                                                                                  ),
                                                                                                  'isPortada': true,
                                                                                                  'reference': _model.imgsToSave[FFAppState().contador] != null
                                                                                                      ? getJsonField(
                                                                                                          _model.imgsToSave[FFAppState().contador],
                                                                                                          r'''$.reference''',
                                                                                                        )
                                                                                                      : null,
                                                                                                  'imgBlurPath': getJsonField(
                                                                                                    _model.imgsToSave[FFAppState().contador],
                                                                                                    r'''$.imgBlurPath''',
                                                                                                  ),
                                                                                                },
                                                                                              );
                                                                                            });
                                                                                            await actions.consoleLog(
                                                                                              null,
                                                                                              getJsonField(
                                                                                                _model.imgsToSave[FFAppState().contador],
                                                                                                r'''$.imgPath''',
                                                                                              ).toString(),
                                                                                              null,
                                                                                            );
                                                                                          }

                                                                                          // Increment Contador
                                                                                          setState(() {
                                                                                            FFAppState().contador = FFAppState().contador + 1;
                                                                                          });
                                                                                        }
                                                                                        // Reset Contador
                                                                                        FFAppState().contador = 0;
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Portada',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.trashAlt,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                22.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: SizedBox(
                                                                                    height: double.infinity,
                                                                                    width: double.infinity,
                                                                                    child: DeleteModalWidget(
                                                                                      deleteMsg: '¿Esta seguro que desea remover el elemento seleccionado?',
                                                                                      title: 'Confirmación',
                                                                                      deleteAction: () async {
                                                                                        if (getJsonField(
                                                                                              imgSelectedItem,
                                                                                              r'''$.reference''',
                                                                                            ) !=
                                                                                            null) {
                                                                                          // Agregar al listado de remover
                                                                                          _model.addToImgsToRemove(imgSelectedItem);
                                                                                        } else {
                                                                                          // Delete img from firestore
                                                                                          await FirebaseStorage.instance
                                                                                              .refFromURL(getJsonField(
                                                                                                imgSelectedItem,
                                                                                                r'''$.imgPath''',
                                                                                              ).toString())
                                                                                              .delete();
                                                                                        }

                                                                                        // Quitar del listado de seleccionados
                                                                                        setState(() {
                                                                                          _model.removeFromImgsToSave(imgSelectedItem);
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            controller: _model
                                                                .listViewController1,
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Lottie.asset(
                                                        'assets/lottie_animations/Animation_-_1705844841203.json',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        height: 100.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  // Change deliver Items
                                  setState(() {
                                    _model.deliverSwitchValue =
                                        (_model.deliverSwitchValue!
                                            ? false
                                            : true);
                                  });
                                  if (_model.objetosAEntregarSelected.isNotEmpty) {
                                    // find objetos with reference
                                    _model.objetosAEntregarWithReference =
                                        await actions.filterByKey(
                                      _model.objetosAEntregarSelected.toList(),
                                      'reference',
                                      true,
                                    );
                                    while (FFAppState().contador <
                                        _model.objetosAEntregarWithReference!
                                            .length) {
                                      // Add item to remove state
                                      _model.addToObjetosAEntregarToRemove(
                                          _model.objetosAEntregarWithReference![
                                              FFAppState().contador]);
                                      // Remove objeto selected
                                      setState(() {
                                        _model
                                            .removeFromObjetosAEntregarSelected(
                                                _model.objetosAEntregarSelected
                                                    .first);
                                      });
                                      // Increment Contador
                                      FFAppState().contador =
                                          FFAppState().contador + 1;
                                    }
                                    setState(() {
                                      FFAppState().contador = 0;
                                    });
                                  }

                                  setState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Incluir Entregable',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Switch.adaptive(
                                            value: _model
                                                .deliverSwitchValue ??= (widget
                                                                .objetosAEntregar !=
                                                            null &&
                                                        (widget.objetosAEntregar)!
                                                            .isNotEmpty) &&
                                                    (widget.objetosAEntregar!.isNotEmpty)
                                                ? true
                                                : false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.deliverSwitchValue =
                                                      newValue);

                                              if (!newValue) {
                                                if (_model
                                                        .objetosAEntregarSelected.isNotEmpty) {
                                                  // find objetos with reference
                                                  _model.objetosAEntregarWithReferenceSwitch =
                                                      await actions.filterByKey(
                                                    _model
                                                        .objetosAEntregarSelected
                                                        .toList(),
                                                    'reference',
                                                    true,
                                                  );
                                                  while (FFAppState().contador <
                                                      _model
                                                          .objetosAEntregarWithReferenceSwitch!
                                                          .length) {
                                                    // Add item to remove state
                                                    _model.addToObjetosAEntregarToRemove(
                                                        _model.objetosAEntregarWithReferenceSwitch![
                                                            FFAppState()
                                                                .contador]);
                                                    // Remove objeto selected
                                                    setState(() {
                                                      _model.removeFromObjetosAEntregarSelected(
                                                          _model
                                                              .objetosAEntregarSelected
                                                              .first);
                                                    });
                                                    // Increment Contador
                                                    FFAppState().contador =
                                                        FFAppState().contador +
                                                            1;
                                                  }
                                                  setState(() {
                                                    FFAppState().contador = 0;
                                                  });
                                                }

                                                setState(() {});
                                              }
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryImputBorder,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Visibility(
                                    visible: _model.deliverSwitchValue ?? true,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Form(
                                          key: _model.formKey2,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) => Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 15.0,
                                                          10.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<TipoUsuarioRecord>>(
                                                    future:
                                                        queryTipoUsuarioRecordOnce(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            child:
                                                                SpinKitChasingDots(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 60.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TipoUsuarioRecord>
                                                          deliverTipoUsuarioDDTipoUsuarioRecordList =
                                                          snapshot.data!;
                                                      return FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .deliverTipoUsuarioDDValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options:
                                                            deliverTipoUsuarioDDTipoUsuarioRecordList
                                                                .map((e) => e
                                                                    .descripcion)
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .deliverTipoUsuarioDDValue =
                                                              val);
                                                          var shouldSetState =
                                                              false;
                                                          if (_model.deliverTipoUsuarioDDValue !=
                                                                  null &&
                                                              _model.deliverTipoUsuarioDDValue !=
                                                                  '') {
                                                            if (_model
                                                                    .objetosAEntregarSelected.isNotEmpty) {
                                                              _model.isObjAlreadyIncluded =
                                                                  await actions
                                                                      .arrayObjAEntregarHasTipoUsuario(
                                                                _model
                                                                    .deliverTipoUsuarioDDValue!,
                                                                _model
                                                                    .objetosAEntregarSelected
                                                                    .toList(),
                                                              );
                                                              shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .isObjAlreadyIncluded!) {
                                                                // Show error msg
                                                                showDialog(
                                                                  barrierColor:
                                                                      Colors
                                                                          .transparent,
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
                                                                              1.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          const SizedBox(
                                                                        height:
                                                                            80.0,
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            CustomSnackBarWidget(
                                                                          msg:
                                                                              'No puede agregar 2 registros del mismo tipo de usuario',
                                                                          type:
                                                                              ToastType.error,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                // reset Dropdowns
                                                                setState(() {
                                                                  _model
                                                                      .deliverTipoUsuarioDDValueController
                                                                      ?.reset();
                                                                });
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                            }
                                                            // Find Tipo Usuario
                                                            _model.findTipoUsuarioResult =
                                                                await actions
                                                                    .getTipoUsuarioByDescripcion(
                                                              _model
                                                                  .deliverTipoUsuarioDDValue!,
                                                            );
                                                            shouldSetState =
                                                                true;
                                                          }
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        },
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        hintText:
                                                            'Tipo Usuario',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryImputBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryImputBorder,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .deliverCantTxtController,
                                                        focusNode: _model
                                                            .deliverCantTxtFocusNode,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Cantidad',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryImputBorder,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryImputBackground,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        keyboardType:
                                                            const TextInputType
                                                                .numberWithOptions(
                                                                decimal: true),
                                                        validator: _model
                                                            .deliverCantTxtControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 2,
                                                      child: StreamBuilder<
                                                          List<
                                                              ObjetoAEntregarRecord>>(
                                                        stream:
                                                            queryObjetoAEntregarRecord(
                                                          queryBuilder:
                                                              (objetoAEntregarRecord) =>
                                                                  objetoAEntregarRecord
                                                                      .where(
                                                            'grupo',
                                                            isEqualTo: FFAppState()
                                                                .grupoSeleccionado,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 60.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ObjetoAEntregarRecord>
                                                              deliverItemDDObjetoAEntregarRecordList =
                                                              snapshot.data!;
                                                          return FlutterFlowDropDown<
                                                              String>(
                                                            controller: _model
                                                                    .deliverItemDDValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options:
                                                                deliverItemDDObjetoAEntregarRecordList
                                                                    .map((e) =>
                                                                        e.descripcion)
                                                                    .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              setState(() =>
                                                                  _model.deliverItemDDValue =
                                                                      val);
                                                              var shouldSetState =
                                                                  false;
                                                              if (_model.deliverItemDDValue !=
                                                                      null &&
                                                                  _model.deliverItemDDValue !=
                                                                      '') {
                                                                // find Objeto a Entregar
                                                                _model.findObjetoAEntregarResult =
                                                                    await actions
                                                                        .getObjetoAEntregarByDescripcion(
                                                                  _model
                                                                      .deliverItemDDValue!,
                                                                  FFAppState()
                                                                      .grupoSeleccionado!,
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                              } else {
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }

                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                            },
                                                            width: 300.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                            hintText: 'Objeto',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryImputBackground,
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryImputBorder,
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            disabled:
                                                                deliverItemDDObjetoAEntregarRecordList.isEmpty,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          // Validate Form
                                                          if (_model.formKey2
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey2
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .deliverTipoUsuarioDDValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          if (_model
                                                                  .deliverItemDDValue ==
                                                              null) {
                                                            return;
                                                          }
                                                          // Add item to state
                                                          setState(() {
                                                            _model
                                                                .addToObjetosAEntregarSelected(<String,
                                                                    dynamic>{
                                                              'tipo_usuario':
                                                                  <String,
                                                                      dynamic>{
                                                                'descripcion': _model
                                                                    .findTipoUsuarioResult
                                                                    ?.descripcion,
                                                                'reference': _model
                                                                    .findTipoUsuarioResult
                                                                    ?.reference,
                                                              },
                                                              'objeto_a_entregar':
                                                                  <String,
                                                                      dynamic>{
                                                                'descripcion': _model
                                                                    .findObjetoAEntregarResult
                                                                    ?.descripcion,
                                                                'reference': _model
                                                                    .findObjetoAEntregarResult
                                                                    ?.reference,
                                                              },
                                                              'cantidad': _model
                                                                  .deliverCantTxtController
                                                                  .text,
                                                            });
                                                          });
                                                          // Reset Cantidad
                                                          setState(() {
                                                            _model
                                                                .deliverCantTxtController
                                                                ?.clear();
                                                          });
                                                          // reset Dropdowns
                                                          setState(() {
                                                            _model
                                                                .deliverTipoUsuarioDDValueController
                                                                ?.reset();
                                                            _model
                                                                .deliverItemDDValueController
                                                                ?.reset();
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 15.0, 10.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 270.0,
                                              constraints: const BoxConstraints(
                                                maxHeight: 270.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryImputBorder,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  if (!_model
                                                      .processingDeliverITems) {
                                                    return Builder(
                                                      builder: (context) {
                                                        final objetosAEntregar =
                                                            _model
                                                                .objetosAEntregarSelected
                                                                .map((e) => e)
                                                                .toList();
                                                        if (objetosAEntregar
                                                            .isEmpty) {
                                                          return const SizedBox(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                EmptyListWidget(
                                                              icon: Icon(
                                                                Icons
                                                                    .diversity_3_sharp,
                                                                color: Color(
                                                                    0xFF47484E),
                                                                size: 50.0,
                                                              ),
                                                              msg:
                                                                  'Debe de registrar entregables para contninuar',
                                                              title:
                                                                  'Sin Entregables',
                                                            ),
                                                          );
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            5.0,
                                                            0,
                                                            0,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              objetosAEntregar
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 15.0),
                                                          itemBuilder: (context,
                                                              objetosAEntregarIndex) {
                                                            final objetosAEntregarItem =
                                                                objetosAEntregar[
                                                                    objetosAEntregarIndex];
                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
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
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                objetosAEntregarItem,
                                                                                r'''$.tipo_usuario.descripcion''',
                                                                              ).toString(),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${getJsonField(
                                                                                  objetosAEntregarItem,
                                                                                  r'''$.objeto_a_entregar.descripcion''',
                                                                                ).toString()}:  ${getJsonField(
                                                                                  objetosAEntregarItem,
                                                                                  r'''$.cantidad''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .trashAlt,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: SizedBox(
                                                                                  height: double.infinity,
                                                                                  width: double.infinity,
                                                                                  child: DeleteModalWidget(
                                                                                    deleteMsg: '¿Esta seguro que desea remover el elemento seleccionado?',
                                                                                    title: 'Confirmación',
                                                                                    deleteAction: () async {
                                                                                      if (getJsonField(
                                                                                            objetosAEntregarItem,
                                                                                            r'''$.reference''',
                                                                                          ) !=
                                                                                          null) {
                                                                                        // Agregar al listado de remover
                                                                                        _model.addToObjetosAEntregarToRemove(objetosAEntregarItem);
                                                                                      }
                                                                                      // Quitar del listado de seleccionados
                                                                                      setState(() {
                                                                                        _model.removeFromObjetosAEntregarSelected(objetosAEntregarItem);
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          controller: _model
                                                              .listViewController2,
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Lottie.asset(
                                                        'assets/lottie_animations/Animation_-_1705844841203.json',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.4,
                                                        height: 100.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.imgsToSave.isNotEmpty) {
                        // get ims without reference
                        _model.imgWithoutRefence = await actions.filterByKey(
                          _model.imgsToSave.toList(),
                          'reference',
                          false,
                        );
                        if (_model.imgWithoutRefence!.isNotEmpty) {
                          while (FFAppState().contador <
                              _model.imgWithoutRefence!.length) {
                            // Delete img
                            await FirebaseStorage.instance
                                .refFromURL(getJsonField(
                                  _model.imgWithoutRefence![
                                      FFAppState().contador],
                                  r'''$.imgPath''',
                                ).toString())
                                .delete();
                            // Increment Contador
                            setState(() {
                              FFAppState().contador = FFAppState().contador + 1;
                            });
                          }
                          // Reset Contador
                          setState(() {
                            FFAppState().contador = 0;
                          });
                        }
                      }
                      // Hide Bottom Sheet
                      Navigator.pop(context);

                      setState(() {});
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
                        // Scroll to top
                        await _model.scrollColumn?.animateTo(
                          0,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.ease,
                        );
                        // Validate Form
                        if (_model.formKey1.currentState == null ||
                            !_model.formKey1.currentState!.validate()) {
                          return;
                        }
                        if (widget.action == FormAction.create) {
                          // create activity
                          _model.activityCreatedResult =
                              await actions.createActivity(
                            _model.nombreTxtController.text,
                            _model.descripcionTxtController.text,
                            functions.parseDateStringToDateTime(
                                _model.fechaTxtController.text)!,
                            functions.parseDateStringToDateTime(
                                _model.hastaTxtController.text)!,
                            double.parse(_model.costoTxtController.text),
                            _model.deliverSwitchValue!,
                            _model.objetosAEntregarSelected.toList(),
                            _model.gruposParaLaActividad.toList(),
                            _model.imgsToSave.toList(),
                            _model.chipsAccesoValues!.toList(),
                          );
                          if (_model.activityCreatedResult!.error) {
                            // show error msg
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
                                    height: 80.0,
                                    width: double.infinity,
                                    child: CustomSnackBarWidget(
                                      msg:
                                          _model.activityCreatedResult!.message,
                                      type: ToastType.error,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            // show success msg
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Actividad creada correctamente',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).success,
                              ),
                            );
                            // close bottom sheet
                            Navigator.pop(context);
                          }
                        } else {
                          // Edit Activity
                          _model.editActivityResponse =
                              await actions.editActivity(
                            _model.nombreTxtController.text,
                            _model.descripcionTxtController.text,
                            double.parse(_model.costoTxtController.text),
                            _model.deliverSwitchValue!,
                            _model.objetosAEntregarSelected.toList(),
                            _model.gruposParaLaActividad.toList(),
                            _model.imgsToSave.toList(),
                            _model.accessToSave.toList(),
                            _model.imgsToRemove.toList(),
                            _model.objetosAEntregarToRemove.toList(),
                            widget.actividad!.reference,
                            widget.grupoActividad!,
                            widget.grupoActividadDetalle!
                                .map((e) => e.reference)
                                .toList(),
                          );
                          if (_model.editActivityResponse!.error) {
                            // show error msg
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
                                    height: 80.0,
                                    width: double.infinity,
                                    child: CustomSnackBarWidget(
                                      msg: _model.editActivityResponse!.message,
                                      type: ToastType.error,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            // show success msg
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Actividad editada correctamente',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).success,
                              ),
                            );
                            // close bottom sheet
                            Navigator.pop(context);
                          }
                        }

                        setState(() {});
                      },
                      text: widget.action == FormAction.edit
                          ? 'Editar actividad'
                          : 'Guardar actividad',
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
