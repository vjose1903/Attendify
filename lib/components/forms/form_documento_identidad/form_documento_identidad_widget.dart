import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'form_documento_identidad_model.dart';
export 'form_documento_identidad_model.dart';

class FormDocumentoIdentidadWidget extends StatefulWidget {
  const FormDocumentoIdentidadWidget({
    super.key,
    this.documentoIdentidad,
  });

  final DocumentoIdentidadRecord? documentoIdentidad;

  @override
  State<FormDocumentoIdentidadWidget> createState() =>
      _FormDocumentoIdentidadWidgetState();
}

class _FormDocumentoIdentidadWidgetState
    extends State<FormDocumentoIdentidadWidget> {
  late FormDocumentoIdentidadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormDocumentoIdentidadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.documentoIdentidad?.tipo == TipoDocumentoIdentidad.cedula) {
        // set cedula values
        setState(() {
          _model.tipoDocDDValueController?.value = 0;
        });
      } else if (widget.documentoIdentidad?.tipo ==
          TipoDocumentoIdentidad.rnc) {
        // set rnc values
        setState(() {
          _model.tipoDocDDValueController?.value = 1;
        });
      } else if (widget.documentoIdentidad?.tipo ==
          TipoDocumentoIdentidad.pasaporte) {
        // set pasaporte values
        setState(() {
          _model.tipoDocDDValueController?.value = 2;
        });
      }

      // Set current tido documento selected
      setState(() {
        _model.currentTipoDoc = widget.documentoIdentidad?.tipo;
        _model.currentValueTipoDoc = _model.tipoDocDDValue;
        _model.documentoIdentidadParam = widget.documentoIdentidad?.reference;
      });
    });

    _model.cedulaTxtController ??=
        TextEditingController(text: widget.documentoIdentidad?.valor);
    _model.cedulaTxtFocusNode ??= FocusNode();

    _model.rncTxtController ??=
        TextEditingController(text: widget.documentoIdentidad?.valor);
    _model.rncTxtFocusNode ??= FocusNode();

    _model.pasaporteTxtController ??=
        TextEditingController(text: widget.documentoIdentidad?.valor);
    _model.pasaporteTxtFocusNode ??= FocusNode();
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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowDropDown<int>(
                controller: _model.tipoDocDDValueController ??=
                    FormFieldController<int>(
                  _model.tipoDocDDValue ??= _model.currentValueTipoDoc,
                ),
                options: List<int>.from([0, 1, 2]),
                optionLabels: const ['Cédula', 'Rnc', 'Pasaporte'],
                onChanged: (val) async {
                  setState(() => _model.tipoDocDDValue = val);
                  if (_model.tipoDocDDValue == 0) {
                    // Set Tipo Documento = cedula
                    setState(() {
                      _model.currentTipoDoc = TipoDocumentoIdentidad.cedula;
                      _model.currentValueTipoDoc = _model.tipoDocDDValue;
                    });
                  } else if (_model.tipoDocDDValue == 1) {
                    // Set Tipo Documento = rnc
                    setState(() {
                      _model.currentTipoDoc = TipoDocumentoIdentidad.rnc;
                      _model.currentValueTipoDoc = _model.tipoDocDDValue;
                    });
                  } else if (_model.tipoDocDDValue == 2) {
                    // Set Tipo Documento = pasaporte
                    setState(() {
                      _model.currentTipoDoc = TipoDocumentoIdentidad.pasaporte;
                      _model.currentValueTipoDoc = _model.tipoDocDDValue;
                    });
                  } else {
                    // Tipo Documento identidad invalido
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tipo de documento invalido',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  }
                },
                width: 120.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Tipo',
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFFB3B3B3),
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryImputBorder,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 2.0,
                borderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isOverButton: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.currentTipoDoc ==
                          TipoDocumentoIdentidad.cedula) {
                        return TextFormField(
                          controller: _model.cedulaTxtController,
                          focusNode: _model.cedulaTxtFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Cédula',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Inserte el documento',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                            fillColor: FlutterFlowTheme.of(context)
                                .primaryImputBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.cedulaTxtControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.cedulaTxtMask],
                        );
                      } else if (_model.currentTipoDoc ==
                          TipoDocumentoIdentidad.rnc) {
                        return TextFormField(
                          controller: _model.rncTxtController,
                          focusNode: _model.rncTxtFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'RNC',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Inserte el documento',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                            fillColor: FlutterFlowTheme.of(context)
                                .primaryImputBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.rncTxtControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.rncTxtMask],
                        );
                      } else if (_model.currentTipoDoc ==
                          TipoDocumentoIdentidad.pasaporte) {
                        return TextFormField(
                          controller: _model.pasaporteTxtController,
                          focusNode: _model.pasaporteTxtFocusNode,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Pasaporte',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Inserte el documento',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                            fillColor: FlutterFlowTheme.of(context)
                                .primaryImputBackground,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.pasaporteTxtControllerValidator
                              .asValidator(context),
                        );
                      } else {
                        return Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Seleccione tipo documento...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
