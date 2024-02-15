import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'asistencia_objeto_a_entregar_model.dart';
export 'asistencia_objeto_a_entregar_model.dart';

class AsistenciaObjetoAEntregarWidget extends StatefulWidget {
  const AsistenciaObjetoAEntregarWidget({
    super.key,
    required this.actividadObjetoEntregar,
    required this.action,
  });

  final dynamic actividadObjetoEntregar;
  final FormAction? action;

  @override
  State<AsistenciaObjetoAEntregarWidget> createState() =>
      _AsistenciaObjetoAEntregarWidgetState();
}

class _AsistenciaObjetoAEntregarWidgetState
    extends State<AsistenciaObjetoAEntregarWidget> {
  late AsistenciaObjetoAEntregarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsistenciaObjetoAEntregarModel());

    _model.cantidadTxtController ??= TextEditingController(
        text: getJsonField(
      widget.actividadObjetoEntregar,
      r'''$.cantidadAEntregar''',
    ).toString().toString());
    _model.cantidadTxtFocusNode ??= FocusNode();
    _model.cantidadTxtFocusNode!.addListener(
      () async {
        logFirebaseEvent('ASISTENCIA_OBJETO_A_ENTREGAR_CantidadTxt');
        logFirebaseEvent('CantidadTxt_custom_action');
        await actions.updateObjetoAEntregarJson(
          widget.actividadObjetoEntregar!,
          <String, dynamic>{
            'cantidadAEntregar': _model.cantidadTxtController.text,
          },
        );
        // Set state
        logFirebaseEvent('CantidadTxt_Setstate');
        setState(() {});
      },
    );
    _model.objetoTxtController ??= TextEditingController(
        text: getJsonField(
      widget.actividadObjetoEntregar,
      r'''$.objetoAEntregarLabel''',
    ).toString().toString());
    _model.objetoTxtFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: SizedBox(
                width: 100.0,
                child: TextFormField(
                  controller: _model.cantidadTxtController,
                  focusNode: _model.cantidadTxtFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.cantidadTxtController',
                    const Duration(milliseconds: 2000),
                    () async {
                      logFirebaseEvent(
                          'ASISTENCIA_OBJETO_A_ENTREGAR_CantidadTxt');
                      logFirebaseEvent('CantidadTxt_custom_action');
                      await actions.consoleLog(
                        null,
                        'cambiando input',
                        null,
                      );
                      logFirebaseEvent('CantidadTxt_custom_action');
                      await actions.updateObjetoAEntregarJson(
                        widget.actividadObjetoEntregar!,
                        <String, dynamic>{
                          'cantidadAEntregar':
                              _model.cantidadTxtController.text,
                        },
                      );
                      // Set state
                      logFirebaseEvent('CantidadTxt_Setstate');
                      setState(() {});
                    },
                  ),
                  textCapitalization: TextCapitalization.words,
                  readOnly: widget.action == FormAction.edit,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).error,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: functions
                                    .parseObjetoAEntregarDataType(
                                        widget.actividadObjetoEntregar!)
                                    .cantidadAEntregar >
                                functions
                                    .parseObjetoAEntregarDataType(
                                        widget.actividadObjetoEntregar!)
                                    .cantidadMaxima
                            ? FlutterFlowTheme.of(context).error
                            : FlutterFlowTheme.of(context).primaryImputBorder,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor:
                        FlutterFlowTheme.of(context).primaryImputBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.number,
                  validator: _model.cantidadTxtControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.objetoTxtController,
                  focusNode: _model.objetoTxtFocusNode,
                  textCapitalization: TextCapitalization.words,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Objeto a entregar',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryImputBorder,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor:
                        FlutterFlowTheme.of(context).primaryImputBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator:
                      _model.objetoTxtControllerValidator.asValidator(context),
                ),
              ),
            ),
            if (widget.action == FormAction.edit)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 90.0,
                  height: 47.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        fillColor: FlutterFlowTheme.of(context).success,
                        disabledColor:
                            FlutterFlowTheme.of(context).successSecondary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: (functions
                                    .parseObjetoAEntregarDataType(
                                        widget.actividadObjetoEntregar!)
                                    .cantidadAEntregar
                                    .toString() ==
                                functions
                                    .parseObjetoAEntregarDataType(
                                        widget.actividadObjetoEntregar!)
                                    .cantidadMaxima
                                    .toString())
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'ASISTENCIA_OBJETO_A_ENTREGAR_addButton_O');
                                // Add Deliver item
                                logFirebaseEvent('addButton_AddDeliveritem');
                                _model.addResponse =
                                    await actions.updateObjetoAEntregarJson(
                                  widget.actividadObjetoEntregar!,
                                  <String, dynamic>{
                                    'cantidadAEntregar': _model.cantidadTxtController.text !=
                                                ''
                                        ? functions.addReduceNumber(
                                            functions.parseDouble(_model
                                                .cantidadTxtController.text),
                                            MathAction.add,
                                            1.0)
                                        : FFAppConstants.cero,
                                  },
                                );
                                // Set field
                                logFirebaseEvent('addButton_Setfield');
                                setState(() {
                                  _model.cantidadTxtController?.text = functions
                                      .parseObjetoAEntregarDataType(
                                          _model.addResponse!)
                                      .cantidadAEntregar
                                      .toString();
                                });

                                setState(() {});
                              },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        fillColor: FlutterFlowTheme.of(context).error,
                        disabledColor:
                            FlutterFlowTheme.of(context).errorSecondary,
                        icon: FaIcon(
                          FontAwesomeIcons.minus,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: ((functions
                                        .parseObjetoAEntregarDataType(
                                            widget.actividadObjetoEntregar!)
                                        .cantidadAEntregar
                                        .toString() ==
                                    '0') ||
                                (functions
                                            .parseObjetoAEntregarDataType(
                                                widget.actividadObjetoEntregar!)
                                            .cantidadAEntregar
                                            .toString() ==
                                        ''))
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'ASISTENCIA_OBJETO_A_ENTREGAR_reduceButto');
                                // Reduce Deliver item
                                logFirebaseEvent(
                                    'reduceButton_ReduceDeliveritem');
                                _model.reduceResponse =
                                    await actions.updateObjetoAEntregarJson(
                                  widget.actividadObjetoEntregar!,
                                  <String, dynamic>{
                                    'cantidadAEntregar':
                                        functions.addReduceNumber(
                                            functions.parseDouble(_model
                                                .cantidadTxtController.text),
                                            MathAction.substract,
                                            1.0),
                                  },
                                );
                                // set field
                                logFirebaseEvent('reduceButton_setfield');
                                setState(() {
                                  _model.cantidadTxtController?.text = functions
                                      .parseObjetoAEntregarDataType(
                                          _model.reduceResponse!)
                                      .cantidadAEntregar
                                      .toString();
                                });

                                setState(() {});
                              },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (functions
                .parseObjetoAEntregarDataType(widget.actividadObjetoEntregar!)
                .cantidadAEntregar >
            functions
                .parseObjetoAEntregarDataType(widget.actividadObjetoEntregar!)
                .cantidadMaxima)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 3.0, 0.0, 0.0),
            child: Text(
              'Max. ${functions.parseObjetoAEntregarDataType(widget.actividadObjetoEntregar!).objetoAEntregarLabel}:  ${functions.parseObjetoAEntregarDataType(widget.actividadObjetoEntregar!).cantidadMaxima.toString()}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).error,
                    fontSize: 12.0,
                  ),
            ),
          ),
      ],
    );
  }
}
