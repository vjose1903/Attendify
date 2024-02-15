import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_snack_bar/custom_snack_bar_widget.dart';
import '/components/forms/form_documento_identidad/form_documento_identidad_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_doc_identidad_model.dart';
export 'form_doc_identidad_model.dart';

class FormDocIdentidadWidget extends StatefulWidget {
  const FormDocIdentidadWidget({
    super.key,
    this.documentoIdentidad,
  });

  final DocumentoIdentidadRecord? documentoIdentidad;

  @override
  State<FormDocIdentidadWidget> createState() => _FormDocIdentidadWidgetState();
}

class _FormDocIdentidadWidgetState extends State<FormDocIdentidadWidget> {
  late FormDocIdentidadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormDocIdentidadModel());
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
                    'Documento de identidad',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Mantén tu Información Actualizada',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.formDocumentoIdentidadModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: FormDocumentoIdentidadWidget(
                                  documentoIdentidad: widget.documentoIdentidad,
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
                          'FORM_DOC_IDENTIDAD_CANCELAR_BTN_ON_TAP');
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
                        logFirebaseEvent(
                            'FORM_DOC_IDENTIDAD_MODIFICAR_BTN_ON_TAP');
                        var shouldSetState = false;
                        if ((_model.formDocumentoIdentidadModel
                                    .tipoDocDDValue !=
                                null) &&
                            valueOrDefault<bool>(
                              () {
                                if ((_model.formDocumentoIdentidadModel
                                            .tipoDocDDValue ==
                                        0) &&
                                    (_model.formDocumentoIdentidadModel
                                                .cedulaTxtController.text !=
                                            '')) {
                                  return true;
                                } else if ((_model.formDocumentoIdentidadModel
                                            .tipoDocDDValue ==
                                        1) &&
                                    (_model.formDocumentoIdentidadModel
                                                .rncTxtController.text !=
                                            '')) {
                                  return true;
                                } else if ((_model.formDocumentoIdentidadModel
                                            .tipoDocDDValue ==
                                        2) &&
                                    (_model.formDocumentoIdentidadModel
                                                .pasaporteTxtController.text !=
                                            '')) {
                                  return true;
                                } else {
                                  return false;
                                }
                              }(),
                              false,
                            )) {
                          if (widget.documentoIdentidad != null) {
                            // Update  documento Edit user
                            logFirebaseEvent('Button_UpdatedocumentoEdituser');

                            await widget.documentoIdentidad!.reference
                                .update(createDocumentoIdentidadRecordData(
                              tipo: _model
                                  .formDocumentoIdentidadModel.currentTipoDoc,
                              valor: () {
                                if (_model.formDocumentoIdentidadModel
                                        .tipoDocDDValue ==
                                    0) {
                                  return _model.formDocumentoIdentidadModel
                                      .cedulaTxtController.text;
                                } else if (_model.formDocumentoIdentidadModel
                                        .tipoDocDDValue ==
                                    1) {
                                  return _model.formDocumentoIdentidadModel
                                      .rncTxtController.text;
                                } else {
                                  return _model.formDocumentoIdentidadModel
                                      .pasaporteTxtController.text;
                                }
                              }(),
                            ));
                          } else {
                            // Create  documento
                            logFirebaseEvent('Button_Createdocumento');

                            var documentoIdentidadRecordReference =
                                DocumentoIdentidadRecord.collection.doc();
                            await documentoIdentidadRecordReference
                                .set(createDocumentoIdentidadRecordData(
                              tipo: _model
                                  .formDocumentoIdentidadModel.currentTipoDoc,
                              valor: () {
                                if (_model.formDocumentoIdentidadModel
                                        .tipoDocDDValue ==
                                    0) {
                                  return _model.formDocumentoIdentidadModel
                                      .cedulaTxtController.text;
                                } else if (_model.formDocumentoIdentidadModel
                                        .tipoDocDDValue ==
                                    1) {
                                  return _model.formDocumentoIdentidadModel
                                      .rncTxtController.text;
                                } else {
                                  return _model.formDocumentoIdentidadModel
                                      .pasaporteTxtController.text;
                                }
                              }(),
                              usuarioReference: currentUserReference,
                            ));
                            _model.createDocumentResult =
                                DocumentoIdentidadRecord.getDocumentFromData(
                                    createDocumentoIdentidadRecordData(
                                      tipo: _model.formDocumentoIdentidadModel
                                          .currentTipoDoc,
                                      valor: () {
                                        if (_model.formDocumentoIdentidadModel
                                                .tipoDocDDValue ==
                                            0) {
                                          return _model
                                              .formDocumentoIdentidadModel
                                              .cedulaTxtController
                                              .text;
                                        } else if (_model
                                                .formDocumentoIdentidadModel
                                                .tipoDocDDValue ==
                                            1) {
                                          return _model
                                              .formDocumentoIdentidadModel
                                              .rncTxtController
                                              .text;
                                        } else {
                                          return _model
                                              .formDocumentoIdentidadModel
                                              .pasaporteTxtController
                                              .text;
                                        }
                                      }(),
                                      usuarioReference: currentUserReference,
                                    ),
                                    documentoIdentidadRecordReference);
                            shouldSetState = true;
                          }

                          // Hide Bottom Sheet
                          logFirebaseEvent('Button_HideBottomSheet');
                          Navigator.pop(context);
                          if (shouldSetState) setState(() {});
                          return;
                        } else {
                          // Show required Tipo Document
                          logFirebaseEvent('Button_ShowrequiredTipoDocument');
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
                                        'Debe registrar un documento de identidad',
                                    type: ToastType.error,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          if (shouldSetState) setState(() {});
                          return;
                        }

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Modificar',
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
