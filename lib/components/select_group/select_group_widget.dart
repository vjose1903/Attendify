import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/grupo_option/grupo_option_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'select_group_model.dart';
export 'select_group_model.dart';

class SelectGroupWidget extends StatefulWidget {
  const SelectGroupWidget({super.key});

  @override
  State<SelectGroupWidget> createState() => _SelectGroupWidgetState();
}

class _SelectGroupWidgetState extends State<SelectGroupWidget>
    with TickerProviderStateMixin {
  late SelectGroupModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 70.ms),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 70.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 70.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectGroupModel());

    _model.yourNameController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height * 0.7,
            maxWidth: 670.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x1E000000),
                offset: Offset(0.0, 5.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
                    child: Text(
                      'Seleccione un grupo.',
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'Para ver las actividades pautadas',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.yourNameController,
                              focusNode: _model.yourNameFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Filtrar',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 24.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.yourNameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.search_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 505.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
                    child: StreamBuilder<List<GrupoRecord>>(
                      stream: queryGrupoRecord(),
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
                        List<GrupoRecord> gridViewGrupoRecordList =
                            snapshot.data!;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewGrupoRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewGrupoRecord =
                                gridViewGrupoRecordList[gridViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // FInd grupo usuario
                                _model.grupoUsuaruiResponse =
                                    await queryGrupoUsuarioRecordOnce(
                                  queryBuilder: (grupoUsuarioRecord) =>
                                      grupoUsuarioRecord
                                          .where(
                                            'grupo',
                                            isEqualTo:
                                                gridViewGrupoRecord.reference,
                                          )
                                          .where(
                                            'usuario',
                                            isEqualTo: currentUserReference,
                                          ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                // update app state
                                setState(() {
                                  FFAppState().tipoUsuarioLoged =
                                      _model.grupoUsuaruiResponse?.tipoUsuario;
                                  FFAppState().grupoUsuarioLoged =
                                      _model.grupoUsuaruiResponse?.reference;
                                  FFAppState().grupoSeleccionado =
                                      gridViewGrupoRecord.reference;
                                  FFAppState().grupoSeleccionadoName =
                                      gridViewGrupoRecord.nombre;
                                  FFAppState().selectedGroupImg =
                                      gridViewGrupoRecord.logo;
                                });
                                // start Loading
                                setState(() {
                                  FFAppState().loadingActividades = true;
                                });
                                // get proximas actividades
                                _model.getProximasActividadesResponse =
                                    await actions.getProximasActividades(
                                  FFAppState().tipoUsuarioLoged!,
                                  FFAppState().grupoSeleccionado!,
                                );
                                // End Loading
                                setState(() {
                                  FFAppState().loadingActividades = false;
                                  FFAppState()
                                      .proximasActividades = (getJsonField(
                                    _model.getProximasActividadesResponse,
                                    r'''$.primeras5Actividades''',
                                    true,
                                  )!
                                              .toList()
                                              .map<GrupoActividadHomeStruct?>(
                                                  GrupoActividadHomeStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<
                                              GrupoActividadHomeStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<GrupoActividadHomeStruct>();
                                  FFAppState().restoActividades = (getJsonField(
                                    _model.getProximasActividadesResponse,
                                    r'''$.todasLasActividades''',
                                    true,
                                  )!
                                              .toList()
                                              .map<GrupoActividadHomeStruct?>(
                                                  GrupoActividadHomeStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<
                                              GrupoActividadHomeStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<GrupoActividadHomeStruct>();
                                });
                                // Clase Bottom Sheet
                                Navigator.pop(context);

                                setState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.grupoOptionModels.getModel(
                                  gridViewGrupoRecord.reference.id,
                                  gridViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: GrupoOptionWidget(
                                  key: Key(
                                    'Keyzbn_${gridViewGrupoRecord.reference.id}',
                                  ),
                                  grupoOption: gridViewGrupoRecord.reference,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
