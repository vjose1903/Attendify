import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_nota_model.dart';
export 'form_nota_model.dart';

class FormNotaWidget extends StatefulWidget {
  const FormNotaWidget({
    super.key,
    this.grupoActividadDetalle,
    this.comentario,
    required this.action,
    required this.reloadAction,
  });

  final GrupoActividadDetalleRecord? grupoActividadDetalle;
  final ActividadComentarioRecord? comentario;
  final FormAction? action;
  final Future Function()? reloadAction;

  @override
  State<FormNotaWidget> createState() => _FormNotaWidgetState();
}

class _FormNotaWidgetState extends State<FormNotaWidget> {
  late FormNotaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormNotaModel());

    _model.notaTxtController ??=
        TextEditingController(text: widget.comentario?.comentario);
    _model.notaTxtFocusNode ??= FocusNode();
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
                widget.action == FormAction.edit
                    ? 'Modificar Nota'
                    : 'Crear Nota',
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
              child: Text(
                'Información Adicional: Notas para la Actividad',
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 40.0),
                                child: TextFormField(
                                  controller: _model.notaTxtController,
                                  focusNode: _model.notaTxtFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nota',
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
                                  maxLines: 10,
                                  minLines: 10,
                                  validator: _model.notaTxtControllerValidator
                                      .asValidator(context),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      // Validate Form
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if (widget.action == FormAction.create) {
                        // Create Note

                        var actividadComentarioRecordReference =
                            ActividadComentarioRecord.createDoc(
                                widget.grupoActividadDetalle!.reference);
                        await actividadComentarioRecordReference
                            .set(createActividadComentarioRecordData(
                          comentario: _model.notaTxtController.text,
                          createdAt: getCurrentTimestamp,
                          grupo: FFAppState().grupoSeleccionado,
                          createdBy: FFAppState().grupoUsuarioLoged,
                        ));
                        _model.createNotaResponse =
                            ActividadComentarioRecord.getDocumentFromData(
                                createActividadComentarioRecordData(
                                  comentario: _model.notaTxtController.text,
                                  createdAt: getCurrentTimestamp,
                                  grupo: FFAppState().grupoSeleccionado,
                                  createdBy: FFAppState().grupoUsuarioLoged,
                                ),
                                actividadComentarioRecordReference);
                        shouldSetState = true;
                        if (_model.createNotaResponse?.comentario != null &&
                            _model.createNotaResponse?.comentario != '') {
                          // success msg
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nota creada correctamente',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).success,
                            ),
                          );
                        } else {
                          // error msg
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Error creando nota intente nuevamente',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (shouldSetState) setState(() {});
                          return;
                        }
                      } else {
                        // Edit note

                        await widget.comentario!.reference
                            .update(createActividadComentarioRecordData(
                          comentario: _model.notaTxtController.text,
                        ));
                        // success msg
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Nota editada correctamente',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );
                      }

                      // close form
                      Navigator.pop(context);
                      // Reload data
                      await widget.reloadAction?.call();
                      if (shouldSetState) setState(() {});
                    },
                    text: widget.action == FormAction.edit
                        ? 'Editar nota'
                        : 'Guardar nota',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
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
              ].divide(const SizedBox(width: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
