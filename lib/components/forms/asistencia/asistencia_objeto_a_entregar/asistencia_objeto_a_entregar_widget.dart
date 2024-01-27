import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'asistencia_objeto_a_entregar_model.dart';
export 'asistencia_objeto_a_entregar_model.dart';

class AsistenciaObjetoAEntregarWidget extends StatefulWidget {
  const AsistenciaObjetoAEntregarWidget({
    super.key,
    required this.parameter1,
  });

  final dynamic parameter1;

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

    _model.cantidadTxtController ??= TextEditingController();
    _model.cantidadTxtFocusNode ??= FocusNode();
    _model.cantidadTxtFocusNode!.addListener(
      () async {
        await actions.updateObjetoAEntregarJson(
          widget.parameter1!,
          <String, dynamic>{
            'cantidadAEntregar': _model.cantidadTxtController.text,
          },
        );
        // Set state
        setState(() {});
      },
    );
    _model.objetoTxtController ??= TextEditingController(
        text: getJsonField(
      widget.parameter1,
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
                      await actions.updateObjetoAEntregarJson(
                        widget.parameter1!,
                        <String, dynamic>{
                          'cantidadAEntregar':
                              _model.cantidadTxtController.text,
                        },
                      );
                      // Set state
                      setState(() {});
                    },
                  ),
                  textCapitalization: TextCapitalization.words,
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
                                        widget.parameter1!)
                                    .cantidadAEntregar >
                                functions
                                    .parseObjetoAEntregarDataType(
                                        widget.parameter1!)
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
          ],
        ),
        if (functions
                .parseObjetoAEntregarDataType(widget.parameter1!)
                .cantidadAEntregar >
            functions
                .parseObjetoAEntregarDataType(widget.parameter1!)
                .cantidadMaxima)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 3.0, 0.0, 0.0),
            child: Text(
              'Max. ${functions.parseObjetoAEntregarDataType(widget.parameter1!).objetoAEntregarLabel}:  ${functions.parseObjetoAEntregarDataType(widget.parameter1!).cantidadMaxima.toString()}',
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
