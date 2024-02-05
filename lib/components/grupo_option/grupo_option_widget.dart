import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'grupo_option_model.dart';
export 'grupo_option_model.dart';

class GrupoOptionWidget extends StatefulWidget {
  const GrupoOptionWidget({
    super.key,
    required this.grupoOption,
  });

  final DocumentReference? grupoOption;

  @override
  State<GrupoOptionWidget> createState() => _GrupoOptionWidgetState();
}

class _GrupoOptionWidgetState extends State<GrupoOptionWidget> {
  late GrupoOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrupoOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<GrupoRecord>(
        stream: GrupoRecord.getDocument(widget.grupoOption!),
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
          final containerGrupoRecord = snapshot.data!;
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  FFAppState().grupoSeleccionado == widget.grupoOption
                      ? FlutterFlowTheme.of(context).selectedOption
                      : FlutterFlowTheme.of(context).noSelectedOption,
                  FlutterFlowTheme.of(context).noSelectedOption,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: MouseRegion(
                opaque: false,
                cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                onEnter: ((event) async {
                  setState(() => _model.mouseRegionHovered = true);
                }),
                onExit: ((event) async {
                  setState(() => _model.mouseRegionHovered = false);
                }),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: OctoImage(
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              valueOrDefault<String>(
                                containerGrupoRecord.logoBlurHash,
                                'https://firebasestorage.googleapis.com/v0/b/carnaval-d2054.appspot.com/o/assets%2Fno_img_es_2.png?alt=media&token=5bf4ad9f-66fb-4272-83d2-73fef986362d',
                              ),
                            ),
                            image: NetworkImage(
                              valueOrDefault<String>(
                                containerGrupoRecord.logo,
                                'https://firebasestorage.googleapis.com/v0/b/carnaval-d2054.appspot.com/o/assets%2Fno_img_es_2.png?alt=media&token=5bf4ad9f-66fb-4272-83d2-73fef986362d',
                              ),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0x440F0F0F),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              containerGrupoRecord.nombre,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
