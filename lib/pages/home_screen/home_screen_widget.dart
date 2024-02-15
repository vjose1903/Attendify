import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/qr_modal/qr_modal_widget.dart';
import '/components/select_group/select_group_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flip_card/flip_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
    with TickerProviderStateMixin {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(300.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.375,
        ),
      ],
    ),
    'iconOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.375,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homeScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('HOME_SCREEN_homeScreen_ON_INIT_STATE');
      // start Loading
      logFirebaseEvent('homeScreen_startLoading');
      setState(() {
        FFAppState().loadingActividades = true;
      });
      // Buscar los grupos que sigue el usuario
      logFirebaseEvent('homeScreen_Buscarlosgruposquesigueelusua');
      _model.finUserGruposSeguidos = await queryGrupoUsuarioRecordOnce(
        queryBuilder: (grupoUsuarioRecord) => grupoUsuarioRecord.where(
          'usuario',
          isEqualTo: currentUserReference,
        ),
      );
      if (_model.finUserGruposSeguidos.isEmpty) {
        // Ir a seguir Grupo
        logFirebaseEvent('homeScreen_IraseguirGrupo');

        context.goNamed(
          'followGroup',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        // clean appStage
        logFirebaseEvent('homeScreen_cleanappStage');
        setState(() {
          FFAppState().gruposSeguidos = [];
          FFAppState().grupoSeleccionado = null;
        });
        return;
      } else {
        // Set grupos followed
        logFirebaseEvent('homeScreen_Setgruposfollowed');
        setState(() {
          FFAppState().gruposSeguidos = _model.finUserGruposSeguidos!
              .map((e) => e.grupo)
              .withoutNulls
              .toList()
              .toList()
              .cast<DocumentReference>();
        });
        if (FFAppState().gruposSeguidos.isNotEmpty) {
          if (FFAppState().gruposSeguidos.length == 1) {
            // Find Group
            logFirebaseEvent('homeScreen_FindGroup');
            _model.findGrupoSelectedResult = await GrupoRecord.getDocumentOnce(
                FFAppState().gruposSeguidos.first);
            // find Grupo Usuario
            logFirebaseEvent('homeScreen_findGrupoUsuario');
            _model.grupoUsuarioResponse = await queryGrupoUsuarioRecordOnce(
              queryBuilder: (grupoUsuarioRecord) => grupoUsuarioRecord
                  .where(
                    'grupo',
                    isEqualTo: _model.findGrupoSelectedResult?.reference,
                  )
                  .where(
                    'usuario',
                    isEqualTo: currentUserReference,
                  ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            // Select First Group
            logFirebaseEvent('homeScreen_SelectFirstGroup');
            setState(() {
              FFAppState().grupoSeleccionado =
                  _model.findGrupoSelectedResult?.reference;
              FFAppState().grupoUsuarioLoged =
                  _model.grupoUsuarioResponse?.reference;
              FFAppState().tipoUsuarioLoged =
                  _model.grupoUsuarioResponse?.tipoUsuario;
              FFAppState().grupoSeleccionadoName =
                  _model.findGrupoSelectedResult!.nombre;
              FFAppState().selectedGroupImg =
                  _model.findGrupoSelectedResult!.logo;
              FFAppState().selectedGroupImgBlur =
                  _model.findGrupoSelectedResult!.logoBlurHash;
              FFAppState().gruposSeguidos = _model.finUserGruposSeguidos!
                  .map((e) => e.grupo)
                  .withoutNulls
                  .toList()
                  .toList()
                  .cast<DocumentReference>();
            });
            // start Loading
            logFirebaseEvent('homeScreen_startLoading');
            setState(() {
              FFAppState().loadingActividades = true;
            });
            // get proximas actividades
            logFirebaseEvent('homeScreen_getproximasactividades');
            _model.getProximasActividadesResponse =
                await actions.getProximasActividades(
              FFAppState().tipoUsuarioLoged!,
              FFAppState().grupoSeleccionado!,
            );
            // End Loading
            logFirebaseEvent('homeScreen_EndLoading');
            setState(() {
              FFAppState().loadingActividades = false;
              FFAppState().proximasActividades = (getJsonField(
                _model.getProximasActividadesResponse,
                r'''$.primeras5Actividades''',
                true,
              )!
                      .toList()
                      .map<GrupoActividadHomeStruct?>(
                          GrupoActividadHomeStruct.maybeFromMap)
                      .toList() as Iterable<GrupoActividadHomeStruct?>)
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
                          GrupoActividadHomeStruct.maybeFromMap)
                      .toList() as Iterable<GrupoActividadHomeStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<GrupoActividadHomeStruct>();
            });
          } else {
            if (!(FFAppState().grupoSeleccionado != null)) {
              // Open Bottom sheet
              logFirebaseEvent('homeScreen_OpenBottomsheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: const SelectGroupWidget(),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }
          }
        } else {
          // Go to Follow Group
          logFirebaseEvent('homeScreen_GotoFollowGroup');

          context.goNamed(
            'followGroup',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          // clean appStage
          logFirebaseEvent('homeScreen_cleanappStage');
          setState(() {
            FFAppState().gruposSeguidos = [];
            FFAppState().grupoSeleccionado = null;
          });
          return;
        }
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('HOME_SCREEN_Container_ow30k9p1_ON_TAP');
                  logFirebaseEvent('Container_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            child: const SelectGroupWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).lightT10,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Hero(
                        tag: FFAppState().selectedGroupImg != ''
                            ? FFAppState().selectedGroupImg
                            : FFAppConstants.noUserImgUrl,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: OctoImage(
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              FFAppState().selectedGroupImgBlur != ''
                                  ? FFAppState().selectedGroupImgBlur
                                  : FFAppConstants.noUserUrlBlurHash,
                            ),
                            image: NetworkImage(
                              FFAppState().selectedGroupImg != ''
                                  ? FFAppState().selectedGroupImg
                                  : FFAppConstants.noUserImgUrl,
                            ),
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            FFAppState().grupoSeleccionadoName,
                            'Seleccione Grupo',
                          ).maybeHandleOverflow(
                            maxChars: 22,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                          minFontSize: 15.0,
                        ),
                      ),
                    ].divide(const SizedBox(width: 5.0)),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('HOME_SCREEN_Container_tlm4zvja_ON_TAP');
                  // go to profile
                  logFirebaseEvent('Container_gotoprofile');

                  context.pushNamed(
                    'profile',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                      ),
                    },
                  );
                },
                child: ClipOval(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).selectedOption,
                        width: 1.0,
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Hero(
                        tag: currentUserPhoto != ''
                            ? currentUserPhoto
                            : FFAppConstants.noUserImgUrl,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: OctoImage(
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              currentUserPhoto != ''
                                  ? valueOrDefault(
                                      currentUserDocument?.photoBlurUrl, '')
                                  : FFAppConstants.noUserUrlBlurHash,
                            ),
                            image: NetworkImage(
                              currentUserPhoto != ''
                                  ? currentUserPhoto
                                  : FFAppConstants.noUserImgUrl,
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 5.0)),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(1.0, 1.0),
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: double.infinity,
                              height: 350.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (FFAppState().grupoSeleccionado?.id != null &&
                                  FFAppState().grupoSeleccionado?.id != '') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 250.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 15.0),
                                              child: Text(
                                                'Actividades: Próximos 7 dias',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lightT50,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (!FFAppState()
                                                    .loadingActividades) {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 180.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final proximasActividadesList =
                                                              FFAppState()
                                                                  .proximasActividades
                                                                  .toList();
                                                          if (proximasActividadesList
                                                              .isEmpty) {
                                                            return EmptyListWidget(
                                                              icon: Icon(
                                                                Icons
                                                                    .local_activity_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryImputBorder,
                                                                size: 70.0,
                                                              ),
                                                              title:
                                                                  'No actividades en esta semana',
                                                            );
                                                          }
                                                          return SizedBox(
                                                            width:
                                                                double.infinity,
                                                            height: 180.0,
                                                            child:
                                                                CarouselSlider
                                                                    .builder(
                                                              itemCount:
                                                                  proximasActividadesList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  proximasActividadesListIndex,
                                                                  _) {
                                                                final proximasActividadesListItem =
                                                                    proximasActividadesList[
                                                                        proximasActividadesListIndex];
                                                                return StreamBuilder<
                                                                    ActividadRecord>(
                                                                  stream: ActividadRecord
                                                                      .getDocument(
                                                                          proximasActividadesListItem
                                                                              .actividad!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          child:
                                                                              SpinKitChasingDots(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                60.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final containerActividadRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).lightT10,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<ActividadImagenesRecord>>(
                                                                            stream:
                                                                                queryActividadImagenesRecord(
                                                                              queryBuilder: (actividadImagenesRecord) => actividadImagenesRecord
                                                                                  .where(
                                                                                    'actividad',
                                                                                    isEqualTo: containerActividadRecord.reference,
                                                                                  )
                                                                                  .where(
                                                                                    'isPortada',
                                                                                    isEqualTo: true,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<ActividadImagenesRecord> containerActividadImagenesRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerActividadImagenesRecord = containerActividadImagenesRecordList.isNotEmpty ? containerActividadImagenesRecordList.first : null;
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                decoration: const BoxDecoration(),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('HOME_SCREEN_PAGE_Column_q8s4brgp_ON_TAP');
                                                                                    // find grupo actividad
                                                                                    logFirebaseEvent('Column_findgrupoactividad');
                                                                                    _model.findGrupoActividad = await queryGrupoActividadRecordOnce(
                                                                                      queryBuilder: (grupoActividadRecord) => grupoActividadRecord
                                                                                          .where(
                                                                                            'actividad',
                                                                                            isEqualTo: containerActividadRecord.reference,
                                                                                          )
                                                                                          .where(
                                                                                            'grupos',
                                                                                            arrayContains: FFAppState().grupoSeleccionado,
                                                                                          ),
                                                                                      singleRecord: true,
                                                                                    ).then((s) => s.firstOrNull);
                                                                                    // find grupo actividad detalle
                                                                                    logFirebaseEvent('Column_findgrupoactividaddetalle');
                                                                                    _model.findGrupoActividadDetalle = await queryGrupoActividadDetalleRecordOnce(
                                                                                      queryBuilder: (grupoActividadDetalleRecord) => grupoActividadDetalleRecord
                                                                                          .where(
                                                                                            'grupo_actividad',
                                                                                            isEqualTo: _model.findGrupoActividad?.reference,
                                                                                          )
                                                                                          .where(
                                                                                            'grupo',
                                                                                            isEqualTo: FFAppState().grupoSeleccionado,
                                                                                          )
                                                                                          .orderBy('fecha'),
                                                                                    );
                                                                                    // Count imgs
                                                                                    logFirebaseEvent('Column_Countimgs');
                                                                                    _model.imagenesActividadResponse = await queryActividadImagenesRecordCount(
                                                                                      queryBuilder: (actividadImagenesRecord) => actividadImagenesRecord
                                                                                          .where(
                                                                                            'isPortada',
                                                                                            isEqualTo: false,
                                                                                          )
                                                                                          .where(
                                                                                            'actividad',
                                                                                            isEqualTo: containerActividadRecord.reference,
                                                                                          ),
                                                                                    );
                                                                                    logFirebaseEvent('Column_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'DetalleActividad',
                                                                                      queryParameters: {
                                                                                        'actividad': serializeParam(
                                                                                          containerActividadRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'grupoActividad': serializeParam(
                                                                                          _model.findGrupoActividad,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                        'portada': serializeParam(
                                                                                          containerActividadImagenesRecord.imgPath,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'grupoActividadDetalles': serializeParam(
                                                                                          _model.findGrupoActividadDetalle,
                                                                                          ParamType.Document,
                                                                                          true,
                                                                                        ),
                                                                                        'portadaBlurHash': serializeParam(
                                                                                          containerActividadImagenesRecord.imgBlurPath,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'hasImagenes': serializeParam(
                                                                                          _model.imagenesActividadResponse! > 0,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'actividad': containerActividadRecord,
                                                                                        'grupoActividad': _model.findGrupoActividad,
                                                                                        'grupoActividadDetalles': _model.findGrupoActividadDetalle,
                                                                                        kTransitionInfoKey: const TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                          duration: Duration(milliseconds: 500),
                                                                                        ),
                                                                                      },
                                                                                    );

                                                                                    setState(() {});
                                                                                  },
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: const AlignmentDirectional(0.0, -1.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: const BoxDecoration(),
                                                                                          child: Hero(
                                                                                            tag: containerActividadImagenesRecord!.imgPath,
                                                                                            transitionOnUserGestures: true,
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                              child: OctoImage(
                                                                                                placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                                  containerActividadImagenesRecord.imgBlurPath,
                                                                                                ),
                                                                                                image: NetworkImage(
                                                                                                  containerActividadImagenesRecord.imgPath,
                                                                                                ),
                                                                                                width: double.infinity,
                                                                                                height: 140.0,
                                                                                                fit: BoxFit.cover,
                                                                                                alignment: const Alignment(0.0, -1.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              containerActividadRecord.nombre,
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 5.0),
                                                                                              child: Text(
                                                                                                containerActividadRecord.fechaInicio == containerActividadRecord.fechaFin
                                                                                                    ? dateTimeFormat(
                                                                                                        'dd/MM/yyyy',
                                                                                                        containerActividadRecord.fechaInicio!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )
                                                                                                    : '${dateTimeFormat(
                                                                                                        'dd/MM/yyyy',
                                                                                                        containerActividadRecord.fechaInicio,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )} - ${dateTimeFormat(
                                                                                                        'dd/MM/yyyy',
                                                                                                        containerActividadRecord.fechaFin,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )}',
                                                                                                textAlign: TextAlign.center,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                              child: Text(
                                                                                                '${proximasActividadesListItem.index.toString()}/${FFAppState().proximasActividades.length.toString()}',
                                                                                                textAlign: TextAlign.center,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).lightT50,
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              carouselController:
                                                                  _model.carouselController ??=
                                                                      CarouselController(),
                                                              options:
                                                                  CarouselOptions(
                                                                initialPage: min(
                                                                    0,
                                                                    proximasActividadesList
                                                                            .length -
                                                                        1),
                                                                viewportFraction:
                                                                    0.5,
                                                                disableCenter:
                                                                    true,
                                                                enlargeCenterPage:
                                                                    true,
                                                                enlargeFactor:
                                                                    0.25,
                                                                enableInfiniteScroll:
                                                                    false,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                autoPlay: false,
                                                                onPageChanged: (index,
                                                                        _) =>
                                                                    _model.carouselCurrentIndex =
                                                                        index,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    width: double.infinity,
                                                    height: 180.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Lottie.asset(
                                                        'assets/lottie_animations/Animation_-_1705844841203.json',
                                                        width: 200.0,
                                                        height: 130.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Text(
                                                'Más Allá de lo Inmediato: Explora Más',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lightT50,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (!FFAppState()
                                                  .loadingActividades) {
                                                return Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(
                                                    minHeight: 300.0,
                                                  ),
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final restoActividadesList =
                                                          FFAppState()
                                                              .restoActividades
                                                              .toList();
                                                      if (restoActividadesList
                                                          .isEmpty) {
                                                        return SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 300.0,
                                                          child:
                                                              EmptyListWidget(
                                                            icon: Icon(
                                                              Icons
                                                                  .local_activity,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lightT30,
                                                              size: 70.0,
                                                            ),
                                                            title:
                                                                'No actividades programadas',
                                                            msg:
                                                                '¡Lo sentimos! Actualmente no hay actividades programadas después de la próxima semana. ¡Mantente atento a futuras actualizaciones y eventos emocionantes!',
                                                          ),
                                                        );
                                                      }
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            restoActividadesList
                                                                .length,
                                                            (restoActividadesListIndex) {
                                                          final restoActividadesListItem =
                                                              restoActividadesList[
                                                                  restoActividadesListIndex];
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 120.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    ActividadRecord>(
                                                                  stream: ActividadRecord
                                                                      .getDocument(
                                                                          restoActividadesListItem
                                                                              .actividad!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          child:
                                                                              SpinKitChasingDots(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                60.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final flippableCardActividadRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return FlipCard(
                                                                      fill: Fill
                                                                          .fillBack,
                                                                      direction:
                                                                          FlipDirection
                                                                              .VERTICAL,
                                                                      speed:
                                                                          500,
                                                                      front:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightT30,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StreamBuilder<List<ActividadImagenesRecord>>(
                                                                              stream: queryActividadImagenesRecord(
                                                                                queryBuilder: (actividadImagenesRecord) => actividadImagenesRecord
                                                                                    .where(
                                                                                      'actividad',
                                                                                      isEqualTo: flippableCardActividadRecord.reference,
                                                                                    )
                                                                                    .where(
                                                                                      'isPortada',
                                                                                      isEqualTo: true,
                                                                                    ),
                                                                                singleRecord: true,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                                      child: SizedBox(
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        child: SpinKitChasingDots(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 60.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ActividadImagenesRecord> containerActividadImagenesRecordList = snapshot.data!;
                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final containerActividadImagenesRecord = containerActividadImagenesRecordList.isNotEmpty ? containerActividadImagenesRecordList.first : null;
                                                                                return Container(
                                                                                  width: 120.0,
                                                                                  height: 120.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                    child: OctoImage(
                                                                                      placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                        containerActividadImagenesRecord!.imgBlurPath,
                                                                                      ),
                                                                                      image: NetworkImage(
                                                                                        containerActividadImagenesRecord.imgPath,
                                                                                      ),
                                                                                      width: 120.0,
                                                                                      height: 120.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          flippableCardActividadRecord.nombre,
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                      child: Text(
                                                                                        flippableCardActividadRecord.fechaInicio == flippableCardActividadRecord.fechaFin
                                                                                            ? dateTimeFormat(
                                                                                                'dd/MM/yyyy',
                                                                                                flippableCardActividadRecord.fechaInicio!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )
                                                                                            : '${dateTimeFormat(
                                                                                                'dd/MM/yyyy',
                                                                                                flippableCardActividadRecord.fechaInicio,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )} - ${dateTimeFormat(
                                                                                                'dd/MM/yyyy',
                                                                                                flippableCardActividadRecord.fechaFin,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )}',
                                                                                        textAlign: TextAlign.center,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 13.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      back:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lightT70,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Text(
                                                                              flippableCardActividadRecord.descripcion,
                                                                              textAlign: TextAlign.justify,
                                                                              maxLines: 4,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(const SizedBox(
                                                            height: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Lottie.asset(
                                                          'assets/lottie_animations/Animation_-_1705844841203.json',
                                                          width: 150.0,
                                                          height: 130.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Lottie.asset(
                                                          'assets/lottie_animations/Animation_-_1705844841203.json',
                                                          width: 150.0,
                                                          height: 130.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Lottie.asset(
                                                          'assets/lottie_animations/Animation_-_1705844841203.json',
                                                          width: 150.0,
                                                          height: 130.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: 350.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.emptyListModel,
                                    updateCallback: () => setState(() {}),
                                    child: EmptyListWidget(
                                      icon: Icon(
                                        Icons.groups_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 90.0,
                                      ),
                                      title: 'Debe seleccionar un grupo',
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if ((FFAppState().tipoUsuarioLoged?.id != null &&
                      FFAppState().tipoUsuarioLoged?.id != '') &&
                  (FFAppState().tipoUsuarioLoged?.id ==
                      FFAppState().TAdministrador?.id))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_SCREEN_PAGE_QrOption_ON_TAP');
                                      // Find current user
                                      logFirebaseEvent(
                                          'QrOption_Findcurrentuser');
                                      _model.findAdminCurrenUserLogged =
                                          await UsuariosRecord.getDocumentOnce(
                                              currentUserReference!);
                                      // Find grupo usuario logged
                                      logFirebaseEvent(
                                          'QrOption_Findgrupousuariologged');
                                      _model.findAdminGrupoUsarioLogged =
                                          await GrupoUsuarioRecord
                                              .getDocumentOnce(FFAppState()
                                                  .grupoUsuarioLoged!);
                                      // Show QR
                                      logFirebaseEvent('QrOption_ShowQR');
                                      showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: QrModalWidget(
                                                  user: _model
                                                      .findAdminCurrenUserLogged!,
                                                  grupoUsuario: _model
                                                      .findAdminGrupoUsarioLogged!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      // Hide Members option
                                      logFirebaseEvent(
                                          'QrOption_HideMembersoption');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation5'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation5']!
                                            .controller
                                            .reverse();
                                      }
                                      // Hide Group option
                                      logFirebaseEvent(
                                          'QrOption_HideGroupoption');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation4'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation4']!
                                            .controller
                                            .reverse();
                                      }
                                      // Hide Activities option
                                      logFirebaseEvent(
                                          'QrOption_HideActivitiesoption');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation3'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation3']!
                                            .controller
                                            .reverse();
                                      }
                                      // Hide Qr option
                                      logFirebaseEvent('QrOption_HideQroption');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      // Hide menu
                                      logFirebaseEvent('QrOption_Hidemenu');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      // Revert  button icon
                                      logFirebaseEvent(
                                          'QrOption_Revertbuttonicon');
                                      if (animationsMap[
                                              'iconOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'iconOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                      // Turn off expanded variable
                                      logFirebaseEvent(
                                          'QrOption_Turnoffexpandedvariable');
                                      setState(() {
                                        _model.isOptionsExpanded = false;
                                      });

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.qr_code_2_rounded,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Mi QR',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation2']!,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_SCREEN_PAGE_ActivitiesOption_ON_TAP');
                                    logFirebaseEvent(
                                        'ActivitiesOption_navigate_to');

                                    context.pushNamed(
                                      'ActivitiesList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      },
                                    );

                                    // Hide Members option
                                    logFirebaseEvent(
                                        'ActivitiesOption_HideMembersoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation5'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation5']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Group option
                                    logFirebaseEvent(
                                        'ActivitiesOption_HideGroupoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Activities option
                                    logFirebaseEvent(
                                        'ActivitiesOption_HideActivitiesoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Qr option
                                    logFirebaseEvent(
                                        'ActivitiesOption_HideQroption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide menu
                                    logFirebaseEvent(
                                        'ActivitiesOption_Hidemenu');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Revert  button icon
                                    logFirebaseEvent(
                                        'ActivitiesOption_Revertbuttonicon');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'iconOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Turn off expanded variable
                                    logFirebaseEvent(
                                        'ActivitiesOption_Turnoffexpandedvariable');
                                    setState(() {
                                      _model.isOptionsExpanded = false;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Icon(
                                            Icons.ballot_outlined,
                                            color: Colors.white,
                                            size: 26.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ACTIVIDADES',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation3']!,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_SCREEN_PAGE_GroupOption_ON_TAP');
                                    // Go to grupo profile
                                    logFirebaseEvent(
                                        'GroupOption_Gotogrupoprofile');

                                    context.pushNamed(
                                      'GrupoProfile',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      },
                                    );

                                    // Hide Members option
                                    logFirebaseEvent(
                                        'GroupOption_HideMembersoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation5'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation5']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Group option
                                    logFirebaseEvent(
                                        'GroupOption_HideGroupoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Activities option
                                    logFirebaseEvent(
                                        'GroupOption_HideActivitiesoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Qr option
                                    logFirebaseEvent(
                                        'GroupOption_HideQroption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide menu
                                    logFirebaseEvent('GroupOption_Hidemenu');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Revert  button icon
                                    logFirebaseEvent(
                                        'GroupOption_Revertbuttonicon');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'iconOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Turn off expanded variable
                                    logFirebaseEvent(
                                        'GroupOption_Turnoffexpandedvariable');
                                    setState(() {
                                      _model.isOptionsExpanded = false;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.houseUser,
                                            color: Colors.white,
                                            size: 26.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'GRUPO',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation4']!,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_SCREEN_PAGE_MembersOption_ON_TAP');
                                    logFirebaseEvent(
                                        'MembersOption_navigate_to');

                                    context.pushNamed(
                                      'UsersList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      },
                                    );

                                    // Hide Members option
                                    logFirebaseEvent(
                                        'MembersOption_HideMembersoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation5'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation5']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Group option
                                    logFirebaseEvent(
                                        'MembersOption_HideGroupoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation4'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation4']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Activities option
                                    logFirebaseEvent(
                                        'MembersOption_HideActivitiesoption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide Qr option
                                    logFirebaseEvent(
                                        'MembersOption_HideQroption');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                    // Hide menu
                                    logFirebaseEvent('MembersOption_Hidemenu');
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Revert  button icon
                                    logFirebaseEvent(
                                        'MembersOption_Revertbuttonicon');
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'iconOnActionTriggerAnimation1']!
                                          .controller
                                          .reverse();
                                    }
                                    // Turn off expanded variable
                                    logFirebaseEvent(
                                        'MembersOption_Turnoffexpandedvariable');
                                    setState(() {
                                      _model.isOptionsExpanded = false;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Icon(
                                            Icons.people_alt_rounded,
                                            color: Colors.white,
                                            size: 26.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'MIEMBROS',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation5']!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_SCREEN_PAGE_ExpandableFAB_ON_TAP');
                            if (_model.isOptionsExpanded) {
                              // Hide Members option
                              logFirebaseEvent(
                                  'ExpandableFAB_HideMembersoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation5'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation5']!
                                    .controller
                                    .reverse();
                              }
                              // Hide Group option
                              logFirebaseEvent('ExpandableFAB_HideGroupoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation4'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation4']!
                                    .controller
                                    .reverse();
                              }
                              // Hide Activities option
                              logFirebaseEvent(
                                  'ExpandableFAB_HideActivitiesoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation3'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation3']!
                                    .controller
                                    .reverse();
                              }
                              // Hide Qr option
                              logFirebaseEvent('ExpandableFAB_HideQroption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation2'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation2']!
                                    .controller
                                    .reverse();
                              }
                              // Hide menu
                              logFirebaseEvent('ExpandableFAB_Hidemenu');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation1'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation1']!
                                    .controller
                                    .reverse();
                              }
                              // Revert  button icon
                              logFirebaseEvent(
                                  'ExpandableFAB_Revertbuttonicon');
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation1'] !=
                                  null) {
                                animationsMap['iconOnActionTriggerAnimation1']!
                                    .controller
                                    .reverse();
                              }
                              // Turn off expanded variable
                              logFirebaseEvent(
                                  'ExpandableFAB_Turnoffexpandedvariable');
                              setState(() {
                                _model.isOptionsExpanded = false;
                              });
                            } else {
                              // Show menu
                              logFirebaseEvent('ExpandableFAB_Showmenu');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation1'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation1']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // show Qr option
                              logFirebaseEvent('ExpandableFAB_showQroption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation2'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation2']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // Show Activities option
                              logFirebaseEvent(
                                  'ExpandableFAB_ShowActivitiesoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation3'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation3']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // Show Group option
                              logFirebaseEvent('ExpandableFAB_ShowGroupoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation4'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation4']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // Show Members option
                              logFirebaseEvent(
                                  'ExpandableFAB_ShowMembersoption');
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation5'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation5']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // animate button icon
                              logFirebaseEvent(
                                  'ExpandableFAB_animatebuttonicon');
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation1'] !=
                                  null) {
                                animationsMap['iconOnActionTriggerAnimation1']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              // Turn on expanded variable
                              logFirebaseEvent(
                                  'ExpandableFAB_Turnonexpandedvariable');
                              setState(() {
                                _model.isOptionsExpanded = true;
                              });
                            }
                          },
                          child: ClipOval(
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Transform.rotate(
                                  angle: 0.7854,
                                  child: const Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                    size: 24.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation1']!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if ((FFAppState().tipoUsuarioLoged?.id != null &&
                      FFAppState().tipoUsuarioLoged?.id != '') &&
                  (FFAppState().tipoUsuarioLoged?.id !=
                      FFAppState().TAdministrador?.id))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_SCREEN_PAGE_QrButton_ON_TAP');
                              // Find current user
                              logFirebaseEvent('QrButton_Findcurrentuser');
                              _model.findCurrenUserLogged =
                                  await UsuariosRecord.getDocumentOnce(
                                      currentUserReference!);
                              // Find grupo usuario logged
                              logFirebaseEvent(
                                  'QrButton_Findgrupousuariologged');
                              _model.findGrupoUsarioLogged =
                                  await GrupoUsuarioRecord.getDocumentOnce(
                                      FFAppState().grupoUsuarioLoged!);
                              // Show QR
                              logFirebaseEvent('QrButton_ShowQR');
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: QrModalWidget(
                                          user: _model.findCurrenUserLogged!,
                                          grupoUsuario:
                                              _model.findGrupoUsarioLogged!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              setState(() {});
                            },
                            child: ClipOval(
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.qr_code_2_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation2']!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
