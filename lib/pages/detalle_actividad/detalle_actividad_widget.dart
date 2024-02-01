import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/alert_modal/alert_modal_widget.dart';
import '/components/asistencia_list_view_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/forms/asistencia/form_asistencia/form_asistencia_widget.dart';
import '/components/forms/form_nota/form_nota_widget.dart';
import '/components/info_modal/info_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'detalle_actividad_model.dart';
export 'detalle_actividad_model.dart';

class DetalleActividadWidget extends StatefulWidget {
  const DetalleActividadWidget({
    super.key,
    required this.actividad,
    required this.grupoActividad,
    required this.portada,
    this.grupoActividadDetalles,
    required this.portadaBlurHash,
    bool? hasImagenes,
  }) : hasImagenes = hasImagenes ?? false;

  final ActividadRecord? actividad;
  final GrupoActividadRecord? grupoActividad;
  final String? portada;
  final List<GrupoActividadDetalleRecord>? grupoActividadDetalles;
  final String? portadaBlurHash;
  final bool hasImagenes;

  @override
  State<DetalleActividadWidget> createState() => _DetalleActividadWidgetState();
}

class _DetalleActividadWidgetState extends State<DetalleActividadWidget>
    with TickerProviderStateMixin {
  late DetalleActividadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(-10.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'choiceChipsOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 80.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'choiceChipsOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'choiceChipsOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(-20.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 90.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalleActividadModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().tipoUsuarioLoged == FFAppState().TAdministrador) {
        // Add Asistecia
        _model.addToCustomTabs('Asistencia');
        // Add Notas
        setState(() {
          _model.addToCustomTabs('Notas');
        });
      }
      if (functions.toInitDayHour(getCurrentTimestamp) <
          widget.actividad!.fechaInicio!) {
        // Actividad aun no iniciada
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Actividad aun no iniciada',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).warning,
          ),
        );
      }
      // wait
      await Future.delayed(const Duration(milliseconds: 250));
      // end searching imgs
      setState(() {});
    });

    _model.searchAsistenciaController ??= TextEditingController();
    _model.searchAsistenciaFocusNode ??= FocusNode();
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
        body: Stack(
          alignment: const AlignmentDirectional(0.0, -1.0),
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0x17202529),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      widget.portadaBlurHash!,
                                    ),
                                    image: NetworkImage(
                                      widget.portada!,
                                    ),
                                    fit: BoxFit.contain,
                                    alignment: const Alignment(0.0, -1.0),
                                  ),
                                  allowRotation: false,
                                  tag: widget.portada!,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: widget.portada!,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: OctoImage(
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  widget.portadaBlurHash!,
                                ),
                                image: NetworkImage(
                                  widget.portada!,
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fitWidth,
                                alignment: const Alignment(0.0, -1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 50.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).darkT70,
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.actividad?.nombre,
                        'Nombre',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.w600,
                              ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation1']!),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      widget.actividad?.fechaInicio ==
                              widget.actividad?.fechaFin
                          ? dateTimeFormat(
                              'dd/MM/yyyy',
                              widget.actividad!.fechaInicio!,
                              locale: FFLocalizations.of(context).languageCode,
                            )
                          : '${dateTimeFormat(
                              'dd/MM/yyyy',
                              widget.actividad?.fechaInicio,
                              locale: FFLocalizations.of(context).languageCode,
                            )} - ${dateTimeFormat(
                              'dd/MM/yyyy',
                              widget.actividad?.fechaFin,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation2']!),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.actividad?.descripcion,
                        'descripcion',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation3']!),
                  ),
                  if (FFAppState().TAdministrador ==
                      FFAppState().tipoUsuarioLoged)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<AccesoRecord>>(
                          future: queryAccesoRecordOnce(
                            parent: widget.grupoActividadDetalles
                                ?.where((e) =>
                                    dateTimeFormat(
                                      'dd/MM/yyyy',
                                      e.fecha,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ) ==
                                    ((functions.toInitDayHour(
                                                    getCurrentTimestamp) <
                                                widget
                                                    .actividad!.fechaInicio!) ||
                                            (functions.toInitDayHour(
                                                    getCurrentTimestamp) >
                                                widget.actividad!.fechaFin!)
                                        ? dateTimeFormat(
                                            'dd/MM/yyyy',
                                            widget.actividad?.fechaInicio,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                        : dateTimeFormat(
                                            'dd/MM/yyyy',
                                            functions.toInitDayHour(
                                                getCurrentTimestamp),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )))
                                .toList()
                                .first
                                .reference,
                            queryBuilder: (accesoRecord) => accesoRecord.where(
                              'grupo',
                              isEqualTo: FFAppState().grupoSeleccionado,
                            ),
                          ),
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
                            List<AccesoRecord> accessChipsAccesoRecordList =
                                snapshot.data!;
                            return FlutterFlowChoiceChips(
                              options: accessChipsAccesoRecordList
                                  .map((e) => e.tipoUsuarioLabel)
                                  .toList()
                                  .map((label) => ChipData(label))
                                  .toList(),
                              onChanged: true
                                  ? null
                                  : (val) => setState(
                                      () => _model.accessChipsValues = val),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 5.0,
                              rowSpacing: 5.0,
                              multiselect: true,
                              initialized: _model.accessChipsValues != null,
                              alignment: WrapAlignment.start,
                              controller: _model.accessChipsValueController ??=
                                  FormFieldController<List<String>>(
                                accessChipsAccesoRecordList
                                    .map((e) => e.tipoUsuarioLabel)
                                    .toList(),
                              ),
                              wrapped: true,
                            ).animateOnPageLoad(animationsMap[
                                'choiceChipsOnPageLoadAnimation1']!);
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        10.0,
                        0.0,
                        valueOrDefault<double>(
                          FFAppState().tipoUsuarioLoged ==
                                  FFAppState().TAdministrador
                              ? 85.0
                              : 0.0,
                          0.0,
                        )),
                    child: Container(
                      width: double.infinity,
                      height: 550.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FlutterFlowChoiceChips(
                                  options: _model.customTabs
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) => setState(() =>
                                      _model.customTabsValue = val?.first),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.transparent,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 18.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                    elevation: 0.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: const Color(0x00000000),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 8.0, 10.0, 8.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  chipSpacing: 10.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.customTabsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.customTabsValueController ??=
                                          FormFieldController<List<String>>(
                                    ['Detalles'],
                                  ),
                                  wrapped: false,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 440.0,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.customTabsValue == 'Detalles') {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 490.0,
                                          decoration: const BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Container(
                                                    height: 350.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryImputBackground,
                                                        elevation: 0.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        20.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ActividadImagenesRecord>>(
                                                              stream:
                                                                  queryActividadImagenesRecord(
                                                                queryBuilder:
                                                                    (actividadImagenesRecord) =>
                                                                        actividadImagenesRecord
                                                                            .where(
                                                                              'actividad',
                                                                              isEqualTo: widget.actividad?.reference,
                                                                            )
                                                                            .where(
                                                                              'isPortada',
                                                                              isEqualTo: false,
                                                                            ),
                                                              ),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            60.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ActividadImagenesRecord>
                                                                    pageViewActividadImagenesRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                if (pageViewActividadImagenesRecordList
                                                                    .isEmpty) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          300.0,
                                                                      child:
                                                                          EmptyListWidget(
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .list,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryImputBorder,
                                                                          size:
                                                                              70.0,
                                                                        ),
                                                                        title:
                                                                            'Sin detalles para mostrar',
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                return SizedBox(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            40.0),
                                                                        child: PageView
                                                                            .builder(
                                                                          controller: _model.pageViewController ??=
                                                                              PageController(initialPage: min(0, pageViewActividadImagenesRecordList.length - 1)),
                                                                          onPageChanged: (_) =>
                                                                              setState(() {}),
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          itemCount:
                                                                              pageViewActividadImagenesRecordList.length,
                                                                          itemBuilder:
                                                                              (context, pageViewIndex) {
                                                                            final pageViewActividadImagenesRecord =
                                                                                pageViewActividadImagenesRecordList[pageViewIndex];
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: OctoImage(
                                                                                        placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                          pageViewActividadImagenesRecord.imgBlurPath,
                                                                                        ),
                                                                                        image: NetworkImage(
                                                                                          pageViewActividadImagenesRecord.imgPath != '' ? pageViewActividadImagenesRecord.imgPath : FFAppConstants.noImgUrl,
                                                                                        ),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: false,
                                                                                      tag: pageViewActividadImagenesRecord.imgPath != '' ? pageViewActividadImagenesRecord.imgPath : FFAppConstants.noImgUrl,
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: pageViewActividadImagenesRecord.imgPath != '' ? pageViewActividadImagenesRecord.imgPath : FFAppConstants.noImgUrl,
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: OctoImage(
                                                                                    placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                      pageViewActividadImagenesRecord.imgBlurPath,
                                                                                    ),
                                                                                    image: NetworkImage(
                                                                                      pageViewActividadImagenesRecord.imgPath != '' ? pageViewActividadImagenesRecord.imgPath : FFAppConstants.noImgUrl,
                                                                                    ),
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    fit: BoxFit.fitWidth,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
                                                                              smooth_page_indicator.SmoothPageIndicator(
                                                                            controller: _model.pageViewController ??=
                                                                                PageController(initialPage: min(0, pageViewActividadImagenesRecordList.length - 1)),
                                                                            count:
                                                                                pageViewActividadImagenesRecordList.length,
                                                                            axisDirection:
                                                                                Axis.horizontal,
                                                                            onDotClicked:
                                                                                (i) async {
                                                                              await _model.pageViewController!.animateToPage(
                                                                                i,
                                                                                duration: const Duration(milliseconds: 500),
                                                                                curve: Curves.ease,
                                                                              );
                                                                            },
                                                                            effect:
                                                                                smooth_page_indicator.ExpandingDotsEffect(
                                                                              expansionFactor: 3.0,
                                                                              spacing: 8.0,
                                                                              radius: 16.0,
                                                                              dotWidth: 10.0,
                                                                              dotHeight: 8.0,
                                                                              dotColor: FlutterFlowTheme.of(context).accent1,
                                                                              activeDotColor: FlutterFlowTheme.of(context).primary,
                                                                              paintStyle: PaintingStyle.fill,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
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
                                        ),
                                      );
                                    } else if (_model.customTabsValue ==
                                        'Asistencia') {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 490.0,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: const BoxDecoration(),
                                                child: FlutterFlowChoiceChips(
                                                  options: widget
                                                      .grupoActividadDetalles!
                                                      .map(
                                                          (e) => dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                e.fecha,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ))
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .dateAsistenciaChipsValue =
                                                        val?.first); // Reload List Asistencia
                                                    setState(() => _model
                                                            .firestoreRequestCompleter1 =
                                                        null);
                                                    await _model
                                                        .waitForFirestoreRequestCompleted1(
                                                            minWait: 2000,
                                                            maxWait: 10000);
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryImputBorder,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 19.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lightT10,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 5.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .dateAsistenciaChipsValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .dateAsistenciaChipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [
                                                      (functions.toInitDayHour(
                                                                      getCurrentTimestamp) <
                                                                  widget
                                                                      .actividad!
                                                                      .fechaInicio!) ||
                                                              (functions.toInitDayHour(
                                                                      getCurrentTimestamp) >
                                                                  widget
                                                                      .actividad!
                                                                      .fechaFin!)
                                                          ? dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              widget
                                                                  .grupoActividadDetalles!
                                                                  .first
                                                                  .fecha!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )
                                                          : dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              widget
                                                                  .grupoActividadDetalles!
                                                                  .where((e) =>
                                                                      e.fecha ==
                                                                      functions
                                                                          .toInitDayHour(
                                                                              getCurrentTimestamp))
                                                                  .toList()
                                                                  .first
                                                                  .fecha!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )
                                                    ],
                                                  ),
                                                  wrapped: false,
                                                ).animateOnPageLoad(animationsMap[
                                                    'choiceChipsOnPageLoadAnimation2']!),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if ((_model.dateAsistenciaChipsValue !=
                                                                  null &&
                                                              _model.dateAsistenciaChipsValue !=
                                                                  '') &&
                                                          (functions.parseDateStringToDateTime(
                                                                  _model
                                                                      .dateAsistenciaChipsValue)! <=
                                                              functions
                                                                  .toInitDayHour(
                                                                      getCurrentTimestamp))) {
                                                        return FutureBuilder<
                                                            List<
                                                                AsistenciaRecord>>(
                                                          future: (_model
                                                                      .firestoreRequestCompleter1 ??=
                                                                  Completer<
                                                                      List<
                                                                          AsistenciaRecord>>()
                                                                    ..complete(
                                                                        queryAsistenciaRecordOnce(
                                                                      parent: widget
                                                                          .grupoActividadDetalles
                                                                          ?.where((e) =>
                                                                              dateTimeFormat(
                                                                                'dd/MM/yyyy',
                                                                                e.fecha,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ) ==
                                                                              _model.dateAsistenciaChipsValue)
                                                                          .toList()
                                                                          .first
                                                                          .reference,
                                                                      queryBuilder:
                                                                          (asistenciaRecord) =>
                                                                              asistenciaRecord.where(
                                                                        'grupo',
                                                                        isEqualTo:
                                                                            FFAppState().grupoSeleccionado,
                                                                      ),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 60.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AsistenciaRecord>
                                                                containerAsistenciaAsistenciaRecordList =
                                                                snapshot.data!;
                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryImputBackground,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(0.0, 1.0),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(40.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.search_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: SizedBox(
                                                                                  width: double.infinity,
                                                                                  child: TextFormField(
                                                                                    controller: _model.searchAsistenciaController,
                                                                                    focusNode: _model.searchAsistenciaFocusNode,
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      '_model.searchAsistenciaController',
                                                                                      const Duration(milliseconds: 500),
                                                                                      () async {
                                                                                        if (_model.searchAsistenciaController.text != '') {
                                                                                          // filter asistencia
                                                                                          safeSetState(() {
                                                                                            _model.simpleSearchResults = TextSearch(
                                                                                              containerAsistenciaAsistenciaRecordList
                                                                                                  .map(
                                                                                                    (record) => TextSearchItem.fromTerms(record, [record.usuarioName]),
                                                                                                  )
                                                                                                  .toList(),
                                                                                            ).search(_model.searchAsistenciaController.text).map((r) => r.object).toList();
                                                                                          });
                                                                                          // change To Filter list
                                                                                          setState(() {
                                                                                            _model.showFullAsistenciaList = false;
                                                                                          });
                                                                                        } else {
                                                                                          // change To Full list
                                                                                          setState(() {
                                                                                            _model.showFullAsistenciaList = true;
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Busqueda...',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                      enabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      errorBorder: InputBorder.none,
                                                                                      focusedErrorBorder: InputBorder.none,
                                                                                      filled: true,
                                                                                      suffixIcon: _model.searchAsistenciaController!.text.isNotEmpty
                                                                                          ? InkWell(
                                                                                              onTap: () async {
                                                                                                _model.searchAsistenciaController?.clear();
                                                                                                if (_model.searchAsistenciaController.text != '') {
                                                                                                  // filter asistencia
                                                                                                  safeSetState(() {
                                                                                                    _model.simpleSearchResults = TextSearch(
                                                                                                      containerAsistenciaAsistenciaRecordList
                                                                                                          .map(
                                                                                                            (record) => TextSearchItem.fromTerms(record, [record.usuarioName]),
                                                                                                          )
                                                                                                          .toList(),
                                                                                                    ).search(_model.searchAsistenciaController.text).map((r) => r.object).toList();
                                                                                                  });
                                                                                                  // change To Filter list
                                                                                                  setState(() {
                                                                                                    _model.showFullAsistenciaList = false;
                                                                                                  });
                                                                                                } else {
                                                                                                  // change To Full list
                                                                                                  setState(() {
                                                                                                    _model.showFullAsistenciaList = true;
                                                                                                  });
                                                                                                }

                                                                                                setState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.clear,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                            )
                                                                                          : null,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                    validator: _model.searchAsistenciaControllerValidator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          30.0),
                                                                      child:
                                                                          Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryImputBackground,
                                                                        elevation:
                                                                            0.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (_model.showFullAsistenciaList == true) {
                                                                                return wrapWithModel(
                                                                                  model: _model.fullAsistenciaListViewModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: AsistenciaListViewWidget(
                                                                                    currentSelectedStringDate: _model.dateAsistenciaChipsValue!,
                                                                                    asistenciaList: containerAsistenciaAsistenciaRecordList,
                                                                                    grupoActividad: widget.grupoActividad!.reference,
                                                                                    grupoActividadDetalle: widget.grupoActividadDetalles!
                                                                                        .where((e) =>
                                                                                            dateTimeFormat(
                                                                                              'dd/MM/yyyy',
                                                                                              e.fecha,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ) ==
                                                                                            _model.dateAsistenciaChipsValue)
                                                                                        .toList()
                                                                                        .first,
                                                                                    reloadAction: () async {
                                                                                      // Reload List Asistencia
                                                                                      setState(() => _model.firestoreRequestCompleter1 = null);
                                                                                      await _model.waitForFirestoreRequestCompleted1(minWait: 2000, maxWait: 10000);
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return wrapWithModel(
                                                                                  model: _model.filterAsistenciaListViewModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  updateOnChange: true,
                                                                                  child: AsistenciaListViewWidget(
                                                                                    currentSelectedStringDate: _model.dateAsistenciaChipsValue!,
                                                                                    asistenciaList: _model.simpleSearchResults,
                                                                                    grupoActividad: widget.grupoActividad!.reference,
                                                                                    grupoActividadDetalle: widget.grupoActividadDetalles!
                                                                                        .where((e) =>
                                                                                            dateTimeFormat(
                                                                                              'dd/MM/yyyy',
                                                                                              e.fecha,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ) ==
                                                                                            _model.dateAsistenciaChipsValue)
                                                                                        .toList()
                                                                                        .first,
                                                                                    reloadAction: () async {
                                                                                      // Reload List Asistencia
                                                                                      setState(() => _model.firestoreRequestCompleter1 = null);
                                                                                      await _model.waitForFirestoreRequestCompleted1(minWait: 2000, maxWait: 10000);
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        65.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 290.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryImputBackground,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .emptyListModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          EmptyListWidget(
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_month_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryImputBorder,
                                                                          size:
                                                                              75.0,
                                                                        ),
                                                                        title:
                                                                            'Solo se puede pasar asistencia en una actividad vigente',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
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
                                        ),
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 490.0,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: const BoxDecoration(),
                                                child: FlutterFlowChoiceChips(
                                                  options: widget
                                                      .grupoActividadDetalles!
                                                      .map(
                                                          (e) => dateTimeFormat(
                                                                'dd/MM/yyyy',
                                                                e.fecha,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ))
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .dateNotasChipsValue =
                                                          val?.first),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryImputBorder,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 19.0,
                                                    elevation: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lightT10,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  chipSpacing: 5.0,
                                                  rowSpacing: 5.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .dateNotasChipsValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .dateNotasChipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [
                                                      (functions.toInitDayHour(
                                                                      getCurrentTimestamp) <
                                                                  widget
                                                                      .actividad!
                                                                      .fechaInicio!) ||
                                                              (functions.toInitDayHour(
                                                                      getCurrentTimestamp) >
                                                                  widget
                                                                      .actividad!
                                                                      .fechaFin!)
                                                          ? dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              widget
                                                                  .grupoActividadDetalles!
                                                                  .first
                                                                  .fecha!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )
                                                          : dateTimeFormat(
                                                              'dd/MM/yyyy',
                                                              widget
                                                                  .grupoActividadDetalles!
                                                                  .where((e) =>
                                                                      e.fecha ==
                                                                      functions
                                                                          .toInitDayHour(
                                                                              getCurrentTimestamp))
                                                                  .toList()
                                                                  .first
                                                                  .fecha!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )
                                                    ],
                                                  ),
                                                  wrapped: false,
                                                ).animateOnPageLoad(animationsMap[
                                                    'choiceChipsOnPageLoadAnimation3']!),
                                              ),
                                              Expanded(
                                                child: ClipRRect(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: const BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if ((_model.dateNotasChipsValue !=
                                                                    null &&
                                                                _model.dateNotasChipsValue !=
                                                                    '') &&
                                                            (functions.parseDateStringToDateTime(
                                                                    _model
                                                                        .dateNotasChipsValue)! <=
                                                                functions
                                                                    .toInitDayHour(
                                                                        getCurrentTimestamp))) {
                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              35.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          disabledColor:
                                                                              FlutterFlowTheme.of(context).disablePrimaryColor,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed: ((_model.dateNotasChipsValue == null || _model.dateNotasChipsValue == '') ||
                                                                                  (_model.dateNotasChipsValue !=
                                                                                      dateTimeFormat(
                                                                                        'dd/MM/yyyy',
                                                                                        getCurrentTimestamp,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )))
                                                                              ? null
                                                                              : () async {
                                                                                  // show form
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    isDismissible: false,
                                                                                    enableDrag: false,
                                                                                    useSafeArea: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: SizedBox(
                                                                                            height: 400.0,
                                                                                            child: FormNotaWidget(
                                                                                              grupoActividadDetalle: widget.grupoActividadDetalles
                                                                                                  ?.where((e) =>
                                                                                                      dateTimeFormat(
                                                                                                        'dd/MM/yyyy',
                                                                                                        e.fecha,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ) ==
                                                                                                      _model.dateNotasChipsValue)
                                                                                                  .toList()
                                                                                                  .first,
                                                                                              action: FormAction.create,
                                                                                              reloadAction: () async {
                                                                                                // Refresh request
                                                                                                setState(() => _model.firestoreRequestCompleter2 = null);
                                                                                                await _model.waitForFirestoreRequestCompleted2(minWait: 2000, maxWait: 7000);
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            30.0),
                                                                    child: Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryImputBackground,
                                                                      elevation:
                                                                          0.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child: FutureBuilder<
                                                                            List<ActividadComentarioRecord>>(
                                                                          future: (_model.firestoreRequestCompleter2 ??= Completer<List<ActividadComentarioRecord>>()
                                                                                ..complete(queryActividadComentarioRecordOnce(
                                                                                  parent: widget.grupoActividadDetalles
                                                                                      ?.where((e) =>
                                                                                          dateTimeFormat(
                                                                                            'dd/MM/yyyy',
                                                                                            e.fecha,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ) ==
                                                                                          _model.dateNotasChipsValue)
                                                                                      .toList()
                                                                                      .first
                                                                                      .reference,
                                                                                  queryBuilder: (actividadComentarioRecord) => actividadComentarioRecord
                                                                                      .where(
                                                                                        'grupo',
                                                                                        isEqualTo: FFAppState().grupoSeleccionado,
                                                                                      )
                                                                                      .orderBy('createdAt', descending: true),
                                                                                )))
                                                                              .future,
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
                                                                            List<ActividadComentarioRecord>
                                                                                listViewNotasActividadComentarioRecordList =
                                                                                snapshot.data!;
                                                                            if (listViewNotasActividadComentarioRecordList.isEmpty) {
                                                                              return SizedBox(
                                                                                width: double.infinity,
                                                                                height: 290.0,
                                                                                child: EmptyListWidget(
                                                                                  icon: Icon(
                                                                                    Icons.note_alt_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryImputBorder,
                                                                                    size: 70.0,
                                                                                  ),
                                                                                  title: 'Sin notas para mostrar',
                                                                                ),
                                                                              );
                                                                            }
                                                                            return RefreshIndicator(
                                                                              key: const Key('RefreshIndicator_zyfe49fz'),
                                                                              onRefresh: () async {
                                                                                // Refresh request
                                                                                setState(() => _model.firestoreRequestCompleter2 = null);
                                                                                await _model.waitForFirestoreRequestCompleted2(maxWait: 7000);
                                                                              },
                                                                              child: ListView.separated(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewNotasActividadComentarioRecordList.length,
                                                                                separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                                                                                itemBuilder: (context, listViewNotasIndex) {
                                                                                  final listViewNotasActividadComentarioRecord = listViewNotasActividadComentarioRecordList[listViewNotasIndex];
                                                                                  return Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        // Get grupo usuario
                                                                                        _model.grupoUsuarioNotaResponse = await GrupoUsuarioRecord.getDocumentOnce(listViewNotasActividadComentarioRecord.createdBy!);
                                                                                        // Get usuario
                                                                                        _model.usuarioNotaResponse = await UsuariosRecord.getDocumentOnce(_model.grupoUsuarioNotaResponse!.usuario!);
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: GestureDetector(
                                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                child: SizedBox(
                                                                                                  height: double.infinity,
                                                                                                  width: double.infinity,
                                                                                                  child: InfoModalWidget(
                                                                                                    title: 'Nota',
                                                                                                    message: listViewNotasActividadComentarioRecord.comentario,
                                                                                                    subTitle: '${valueOrDefault<String>(
                                                                                                      _model.usuarioNotaResponse?.displayName,
                                                                                                      'No Definido',
                                                                                                    )}  ${dateTimeFormat(
                                                                                                      'relative',
                                                                                                      listViewNotasActividadComentarioRecord.createdAt,
                                                                                                      locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                    )}',
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));

                                                                                        setState(() {});
                                                                                      },
                                                                                      child: Slidable(
                                                                                        endActionPane: ActionPane(
                                                                                          motion: const ScrollMotion(),
                                                                                          extentRatio: 0.5,
                                                                                          children: [
                                                                                            SlidableAction(
                                                                                              label: 'Editar',
                                                                                              backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                              icon: FontAwesomeIcons.pencilAlt,
                                                                                              onPressed: (_) async {
                                                                                                if (dateTimeFormat(
                                                                                                      'dd/MM/yyyy',
                                                                                                      functions.toInitDayHour(getCurrentTimestamp),
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ) ==
                                                                                                    _model.dateNotasChipsValue) {
                                                                                                  // open form
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    isDismissible: false,
                                                                                                    enableDrag: false,
                                                                                                    useSafeArea: true,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                          child: SizedBox(
                                                                                                            height: 400.0,
                                                                                                            child: FormNotaWidget(
                                                                                                              grupoActividadDetalle: widget.grupoActividadDetalles
                                                                                                                  ?.where((e) =>
                                                                                                                      dateTimeFormat(
                                                                                                                        'dd/MM/yyyy',
                                                                                                                        e.fecha,
                                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                                      ) ==
                                                                                                                      _model.dateNotasChipsValue)
                                                                                                                  .toList()
                                                                                                                  .first,
                                                                                                              comentario: listViewNotasActividadComentarioRecord,
                                                                                                              action: FormAction.edit,
                                                                                                              reloadAction: () async {
                                                                                                                // Refresh request
                                                                                                                setState(() => _model.firestoreRequestCompleter2 = null);
                                                                                                                await _model.waitForFirestoreRequestCompleted2(minWait: 2000, maxWait: 7000);
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                } else {
                                                                                                  // show msg error
                                                                                                  ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'Solo puede editar notas del dia actual',
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
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => SlidableAction(
                                                                                                label: 'Eliminar',
                                                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                                icon: FontAwesomeIcons.solidTrashAlt,
                                                                                                onPressed: (_) async {
                                                                                                  if (dateTimeFormat(
                                                                                                        'dd/MM/yyyy',
                                                                                                        functions.toInitDayHour(getCurrentTimestamp),
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ) ==
                                                                                                      _model.dateNotasChipsValue) {
                                                                                                    // show delete modal
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: SizedBox(
                                                                                                              height: double.infinity,
                                                                                                              width: double.infinity,
                                                                                                              child: DeleteModalWidget(
                                                                                                                deleteMsg: '',
                                                                                                                title: 'Confirmación',
                                                                                                                deleteAction: () async {
                                                                                                                  // Delete Note
                                                                                                                  await listViewNotasActividadComentarioRecord.reference.delete();
                                                                                                                  // Refresh request
                                                                                                                  setState(() => _model.firestoreRequestCompleter2 = null);
                                                                                                                  await _model.waitForFirestoreRequestCompleted2(minWait: 2000, maxWait: 7000);
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  } else {
                                                                                                    // show msg error
                                                                                                    ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'Solo puede eliminar notas del dia actual',
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
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        child: ListTile(
                                                                                          title: Text(
                                                                                            listViewNotasActividadComentarioRecord.comentario,
                                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  fontSize: 16.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          subtitle: Text(
                                                                                            dateTimeFormat(
                                                                                              'relative',
                                                                                              listViewNotasActividadComentarioRecord.createdAt!,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  lineHeight: 1.2,
                                                                                                ),
                                                                                          ),
                                                                                          trailing: Icon(
                                                                                            Icons.arrow_forward_ios,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          dense: false,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          65.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 290.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryImputBackground,
                                                                    elevation:
                                                                        0.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .emptyListModel2,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            EmptyListWidget(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.calendar_month_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryImputBorder,
                                                                            size:
                                                                                75.0,
                                                                          ),
                                                                          title:
                                                                              'Solo se puede agregar notas en una actividad vigente',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                ],
              ),
            ),
            if (FFAppState().tipoUsuarioLoged?.id ==
                FFAppState().TAdministrador?.id)
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: ((functions.toInitDayHour(
                                              getCurrentTimestamp) <
                                          widget.actividad!.fechaInicio!) ||
                                      (functions.toInitDayHour(
                                              getCurrentTimestamp) >
                                          widget.actividad!.fechaFin!))
                                  ? null
                                  : () async {
                                      var shouldSetState = false;
                                      // scan QR
                                      _model.scanResponse =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        'Cancelar', // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.QR,
                                      );

                                      shouldSetState = true;
                                      if (_model.scanResponse != '-1') {
                                        if (functions.stringInclude(
                                            _model.scanResponse,
                                            FFAppConstants.qrIncludeValidation
                                                .toList())) {
                                          // Find Grupo usuario
                                          _model.findGrupoUsuarioQrResponse =
                                              await queryGrupoUsuarioRecordOnce(
                                            queryBuilder:
                                                (grupoUsuarioRecord) =>
                                                    grupoUsuarioRecord.where(
                                              'qr',
                                              isEqualTo: _model.scanResponse,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          shouldSetState = true;
                                          // User is present
                                          _model.qrFindUserIsPresent =
                                              await queryAsistenciaRecordOnce(
                                            parent: widget
                                                .grupoActividadDetalles
                                                ?.where((e) =>
                                                    e.fecha ==
                                                    functions.toInitDayHour(
                                                        getCurrentTimestamp))
                                                .toList()
                                                .first
                                                .reference,
                                            queryBuilder: (asistenciaRecord) =>
                                                asistenciaRecord.where(
                                              'grupo_usuario',
                                              isEqualTo: _model
                                                  .findGrupoUsuarioQrResponse
                                                  ?.reference,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          shouldSetState = true;
                                          if (_model.qrFindUserIsPresent
                                                      ?.grupoName !=
                                                  null &&
                                              _model.qrFindUserIsPresent
                                                      ?.grupoName !=
                                                  '') {
                                            // Show user is already present
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
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: SizedBox(
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: AlertModalWidget(
                                                        message:
                                                            'El usuario escaneado ya ingresó a la actividad',
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .userTag,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 90.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            if (_model
                                                    .findGrupoUsuarioQrResponse !=
                                                null) {
                                              // Get Detalle Access
                                              _model.detalleAccessResponse =
                                                  await queryAccesoRecordOnce(
                                                parent: widget
                                                    .grupoActividadDetalles
                                                    ?.where((e) =>
                                                        e.fecha ==
                                                        functions.toInitDayHour(
                                                            getCurrentTimestamp))
                                                    .toList()
                                                    .first
                                                    .reference,
                                                queryBuilder: (accesoRecord) =>
                                                    accesoRecord.where(
                                                  'grupo',
                                                  isEqualTo: FFAppState()
                                                      .grupoSeleccionado,
                                                ),
                                              );
                                              shouldSetState = true;
                                              if (functions
                                                  .activityAccessIncludeUser(
                                                      _model
                                                          .findGrupoUsuarioQrResponse!
                                                          .tipoUsuario!,
                                                      _model
                                                          .detalleAccessResponse!
                                                          .map((e) =>
                                                              e.tipoUsuario)
                                                          .withoutNulls
                                                          .toList())) {
                                                // find user info
                                                _model.qrfindUserInfoResponse =
                                                    await UsuariosRecord
                                                        .getDocumentOnce(_model
                                                            .findGrupoUsuarioQrResponse!
                                                            .usuario!);
                                                shouldSetState = true;
                                                // Find tipo usuario
                                                _model.qrfindTipoUsuarioResponse =
                                                    await TipoUsuarioRecord
                                                        .getDocumentOnce(_model
                                                            .findGrupoUsuarioQrResponse!
                                                            .tipoUsuario!);
                                                shouldSetState = true;
                                                // find objetos a entregar
                                                _model.qrfindObjetosAEntregarResponsee =
                                                    await queryActividadObjetoAEntregarRecordOnce(
                                                  parent: widget
                                                      .grupoActividadDetalles
                                                      ?.where((e) =>
                                                          e.fecha ==
                                                          functions.toInitDayHour(
                                                              getCurrentTimestamp))
                                                      .toList()
                                                      .first
                                                      .reference,
                                                  queryBuilder:
                                                      (actividadObjetoAEntregarRecord) =>
                                                          actividadObjetoAEntregarRecord
                                                              .where(
                                                                'grupo',
                                                                isEqualTo:
                                                                    FFAppState()
                                                                        .grupoSeleccionado,
                                                              )
                                                              .where(
                                                                'tipo_usuario',
                                                                isEqualTo: _model
                                                                    .findGrupoUsuarioQrResponse
                                                                    ?.tipoUsuario,
                                                              )
                                                              .where(
                                                                'grupo_actividad',
                                                                isEqualTo: widget
                                                                    .grupoActividad
                                                                    ?.reference,
                                                              ),
                                                );
                                                shouldSetState = true;
                                                // open form asistencia
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.55,
                                                          child:
                                                              FormAsistenciaWidget(
                                                            user: _model
                                                                .qrfindUserInfoResponse,
                                                            action: FormAction
                                                                .create,
                                                            grupoUsuario: _model
                                                                .findGrupoUsuarioQrResponse,
                                                            tipoUsuario: _model
                                                                .qrfindTipoUsuarioResponse!,
                                                            actividadObjetosAEntregar:
                                                                _model
                                                                    .qrfindObjetosAEntregarResponsee,
                                                            grupoActividadDetalle: widget
                                                                .grupoActividadDetalles!
                                                                .where((e) =>
                                                                    e.fecha ==
                                                                    functions
                                                                        .toInitDayHour(
                                                                            getCurrentTimestamp))
                                                                .toList()
                                                                .first,
                                                            reloadChip:
                                                                () async {
                                                              // Reload List Asistencia
                                                              setState(() =>
                                                                  _model.firestoreRequestCompleter1 =
                                                                      null);
                                                              await _model
                                                                  .waitForFirestoreRequestCompleted1(
                                                                      minWait:
                                                                          2000,
                                                                      maxWait:
                                                                          10000);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                // Show user not access QR msg
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: SizedBox(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              AlertModalWidget(
                                                            message:
                                                                'El usuario no tiene acceso permitido.',
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .userTimes,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 90.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                            } else {
                                              // Show user not follow the group QR msg
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: SizedBox(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        child: AlertModalWidget(
                                                          message:
                                                              'El usuario escaneado no pertenece al grupo',
                                                          icon: Icon(
                                                            Icons
                                                                .person_off_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 90.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            }
                                          }
                                        } else {
                                          // Show bad QR msg
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: SizedBox(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: AlertModalWidget(
                                                      message:
                                                          'El QR escaneado no es valido',
                                                      icon: Icon(
                                                        Icons.qr_code_scanner,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 90.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                              text: 'Tomar asistencia',
                              icon: const Icon(
                                Icons.hail_sharp,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                disabledColor: FlutterFlowTheme.of(context)
                                    .disablePrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
          ],
        ),
      ),
    );
  }
}
