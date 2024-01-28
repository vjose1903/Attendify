import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_snack_bar/custom_snack_bar_widget.dart';
import '/components/forms/form_documento_identidad/form_documento_identidad_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'form_user_model.dart';
export 'form_user_model.dart';

class FormUserWidget extends StatefulWidget {
  const FormUserWidget({
    super.key,
    this.user,
    required this.reloadChip,
    required this.action,
    this.grupoUsuario,
    this.tipoUsuario,
  });

  final UsuariosRecord? user;
  final Future Function()? reloadChip;
  final FormAction? action;
  final DocumentReference? grupoUsuario;
  final TipoUsuarioRecord? tipoUsuario;

  @override
  State<FormUserWidget> createState() => _FormUserWidgetState();
}

class _FormUserWidgetState extends State<FormUserWidget> {
  late FormUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormUserModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // set state
      setState(() {
        _model.tipoUsuarioSelected = widget.tipoUsuario?.reference;
      });
    });

    _model.displayNameTxtController ??=
        TextEditingController(text: widget.user?.displayName);
    _model.displayNameTxtFocusNode ??= FocusNode();

    _model.emailTxtController ??=
        TextEditingController(text: widget.user?.email);
    _model.emailTxtFocusNode ??= FocusNode();

    _model.phoneTxtController ??=
        TextEditingController(text: widget.user?.phoneNumber);
    _model.phoneTxtFocusNode ??= FocusNode();
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
                        ? 'Modificar usuario'
                        : 'Crear usuario',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Control de Acceso: Gestión de Usuarios del Grupo',
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
                    ],
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
                            child: FutureBuilder<List<TipoUsuarioRecord>>(
                              future: queryTipoUsuarioRecordOnce(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: SpinKitChasingDots(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 60.0,
                                      ),
                                    ),
                                  );
                                }
                                List<TipoUsuarioRecord>
                                    tipoUsuarioDDTipoUsuarioRecordList =
                                    snapshot.data!;
                                return FlutterFlowDropDown<String>(
                                  controller:
                                      _model.tipoUsuarioDDValueController ??=
                                          FormFieldController<String>(
                                    _model.tipoUsuarioDDValue ??=
                                        widget.tipoUsuario?.descripcion,
                                  ),
                                  options: tipoUsuarioDDTipoUsuarioRecordList
                                      .map((e) => e.descripcion)
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() => _model.tipoUsuarioDDValue =
                                        val); // Find Tipo Usuario
                                    _model.findTipoUsuarioResult = await actions
                                        .getTipoUsuarioByDescripcion(
                                      _model.tipoUsuarioDDValue!,
                                    );
                                    // set state
                                    setState(() {
                                      _model.tipoUsuarioSelected = _model
                                          .findTipoUsuarioResult?.reference;
                                    });

                                    setState(() {});
                                  },
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Tipo Usuario',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryImputBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryImputBorder,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.displayNameTxtController,
                              focusNode: _model.displayNameTxtFocusNode,
                              textCapitalization: TextCapitalization.words,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nombre',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Introduzca el Nombre',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
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
                              validator: _model
                                  .displayNameTxtControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child:
                                  FutureBuilder<List<DocumentoIdentidadRecord>>(
                                future: queryDocumentoIdentidadRecordOnce(
                                  queryBuilder: (documentoIdentidadRecord) =>
                                      documentoIdentidadRecord.where(
                                    'usuarioReference',
                                    isEqualTo: widget.user?.reference,
                                    isNull: (widget.user?.reference) == null,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 60.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DocumentoIdentidadRecord>
                                      formDocumentoIdentidadDocumentoIdentidadRecordList =
                                      snapshot.data!;
                                  final formDocumentoIdentidadDocumentoIdentidadRecord =
                                      formDocumentoIdentidadDocumentoIdentidadRecordList
                                              .isNotEmpty
                                          ? formDocumentoIdentidadDocumentoIdentidadRecordList
                                              .first
                                          : null;
                                  return wrapWithModel(
                                    model: _model.formDocumentoIdentidadModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: FormDocumentoIdentidadWidget(
                                      documentoIdentidad:
                                          formDocumentoIdentidadDocumentoIdentidadRecord,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.emailTxtController,
                              focusNode: _model.emailTxtFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Introduzca el email',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
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
                              validator: _model.emailTxtControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.phoneTxtController,
                              focusNode: _model.phoneTxtFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Telefono',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Introduzca el telefono',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
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
                              maxLength: 14,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              keyboardType: TextInputType.phone,
                              validator: _model.phoneTxtControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.phoneTxtMask],
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
                      // Hide Bottom Sheet
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
                        var shouldSetState = false;
                        // Validate Form
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        await actions.consoleLog(
                          null,
                          'form valid',
                          null,
                        );
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
                          if (widget.action == FormAction.edit) {
                            // Update User Data

                            await widget.user!.reference
                                .update(createUsuariosRecordData(
                              email: _model.emailTxtController.text,
                              displayName: _model.displayNameTxtController.text,
                              phoneNumber: _model.phoneTxtController.text,
                            ));
                            // Update Grupo Usuario

                            await widget.grupoUsuario!
                                .update(createGrupoUsuarioRecordData(
                              tipoUsuario: _model.tipoUsuarioSelected,
                            ));
                          }
                          if (_model.formDocumentoIdentidadModel
                                  .documentoIdentidadParam !=
                              null) {
                            // Update  documento Edit user

                            await _model.formDocumentoIdentidadModel
                                .documentoIdentidadParam!
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
                              usuarioReference: widget.user?.reference,
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
                                      usuarioReference: widget.user?.reference,
                                    ),
                                    documentoIdentidadRecordReference);
                            shouldSetState = true;
                          }

                          // Hide Bottom Sheet
                          Navigator.pop(context);
                          // Reload chips
                          await widget.reloadChip?.call();
                          if (shouldSetState) setState(() {});
                          return;
                        } else {
                          await actions.consoleLog(
                            null,
                            'no doc',
                            null,
                          );
                          // Show required Tipo Document
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
                      text: widget.action == FormAction.edit
                          ? 'Editar usuario'
                          : 'Guardar usuario',
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
