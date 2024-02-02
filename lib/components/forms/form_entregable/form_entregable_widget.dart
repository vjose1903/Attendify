import '/backend/backend.dart';
import '/components/forms/update_entregable/update_entregable_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'form_entregable_model.dart';
export 'form_entregable_model.dart';

class FormEntregableWidget extends StatefulWidget {
  const FormEntregableWidget({super.key});

  @override
  State<FormEntregableWidget> createState() => _FormEntregableWidgetState();
}

class _FormEntregableWidgetState extends State<FormEntregableWidget> {
  late FormEntregableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormEntregableModel());

    _model.entregableTxtController ??= TextEditingController();
    _model.entregableTxtFocusNode ??= FocusNode();
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                'Entregables',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
              child: Text(
                'Control de Entregables: Detalles de los Objetos Entregables',
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 30.0, 15.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.entregableTxtController,
                                    focusNode: _model.entregableTxtFocusNode,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Descripción',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintText: 'Entregable',
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
                                    validator: _model
                                        .entregableTxtControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 35.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                // Validate form
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                // Create entregable

                                var objetoAEntregarRecordReference =
                                    ObjetoAEntregarRecord.collection.doc();
                                await objetoAEntregarRecordReference
                                    .set(createObjetoAEntregarRecordData(
                                  descripcion:
                                      _model.entregableTxtController.text,
                                  grupo: FFAppState().grupoSeleccionado,
                                  estado: 'activo',
                                ));
                                _model.createEntregableResponse =
                                    ObjetoAEntregarRecord.getDocumentFromData(
                                        createObjetoAEntregarRecordData(
                                          descripcion: _model
                                              .entregableTxtController.text,
                                          grupo: FFAppState().grupoSeleccionado,
                                          estado: 'activo',
                                        ),
                                        objetoAEntregarRecordReference);
                                // Reload list
                                setState(() =>
                                    _model.firestoreRequestCompleter = null);
                                await _model.waitForFirestoreRequestCompleted(
                                    minWait: 2000, maxWait: 8000);

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: FutureBuilder<List<ObjetoAEntregarRecord>>(
                          future: (_model.firestoreRequestCompleter ??=
                                  Completer<List<ObjetoAEntregarRecord>>()
                                    ..complete(queryObjetoAEntregarRecordOnce(
                                      queryBuilder: (objetoAEntregarRecord) =>
                                          objetoAEntregarRecord.where(
                                        'grupo',
                                        isEqualTo:
                                            FFAppState().grupoSeleccionado,
                                      ),
                                    )))
                              .future,
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
                            List<ObjetoAEntregarRecord>
                                listViewEntregableObjetoAEntregarRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  listViewEntregableObjetoAEntregarRecordList
                                      .length,
                              itemBuilder: (context, listViewEntregableIndex) {
                                final listViewEntregableObjetoAEntregarRecord =
                                    listViewEntregableObjetoAEntregarRecordList[
                                        listViewEntregableIndex];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 0.25,
                                    children: [
                                      Builder(
                                        builder: (context) => SlidableAction(
                                          label: 'Editar',
                                          backgroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          icon: FontAwesomeIcons.pencilAlt,
                                          onPressed: (_) async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: SizedBox(
                                                    height: 300.0,
                                                    width: double.infinity,
                                                    child:
                                                        UpdateEntregableWidget(
                                                      entregable:
                                                          listViewEntregableObjetoAEntregarRecord,
                                                      reloadList: () async {
                                                        // ReloadList
                                                        setState(() => _model
                                                                .firestoreRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForFirestoreRequestCompleted(
                                                                minWait: 2000,
                                                                maxWait: 8000);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      '●  ${listViewEntregableObjetoAEntregarRecord.descripcion}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
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
                      // Hide Form
                      Navigator.pop(context);
                    },
                    text: 'Cerrar',
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
              ].divide(const SizedBox(width: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
