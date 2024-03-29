import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'actions_document_model.dart';
export 'actions_document_model.dart';

class ActionsDocumentWidget extends StatefulWidget {
  const ActionsDocumentWidget({
    super.key,
    required this.editAction,
    required this.deleteAction,
    this.showQRAction,
    bool? showQrBtn,
  }) : showQrBtn = showQrBtn ?? false;

  final Future Function()? editAction;
  final Future Function()? deleteAction;
  final Future Function()? showQRAction;
  final bool showQrBtn;

  @override
  State<ActionsDocumentWidget> createState() => _ActionsDocumentWidgetState();
}

class _ActionsDocumentWidgetState extends State<ActionsDocumentWidget> {
  late ActionsDocumentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsDocumentModel());
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ACTIONS_DOCUMENT_COMP_EDITAR_BTN_ON_TAP');
                // Close bottom sheet
                logFirebaseEvent('Button_Closebottomsheet');
                Navigator.pop(context);
                // Execute Edit action
                logFirebaseEvent('Button_ExecuteEditaction');
                unawaited(
                  () async {
                    await widget.editAction?.call();
                  }(),
                );
              },
              text: 'Editar',
              icon: const Icon(
                Icons.mode_edit,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ACTIONS_DOCUMENT_ELIMINAR_BTN_ON_TAP');
                  // Close bottom sheet
                  logFirebaseEvent('Button_Closebottomsheet');
                  Navigator.pop(context);
                  // Execute Edit action
                  logFirebaseEvent('Button_ExecuteEditaction');
                  unawaited(
                    () async {
                      await widget.deleteAction?.call();
                    }(),
                  );
                },
                text: 'Eliminar',
                icon: const FaIcon(
                  FontAwesomeIcons.trashAlt,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge,
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            if (widget.showQrBtn)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ACTIONS_DOCUMENT_COMP_QR_BTN_ON_TAP');
                    // Close bottom sheet
                    logFirebaseEvent('Button_Closebottomsheet');
                    Navigator.pop(context);
                    // Execute Qr action
                    logFirebaseEvent('Button_ExecuteQraction');
                    unawaited(
                      () async {
                        await widget.showQRAction?.call();
                      }(),
                    );
                  },
                  text: 'QR',
                  icon: const Icon(
                    Icons.qr_code_2_outlined,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryImputBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge,
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ACTIONS_DOCUMENT_CANCELAR_BTN_ON_TAP');
                  logFirebaseEvent('Button_bottom_sheet');
                  Navigator.pop(context);
                },
                text: 'Cancelar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
