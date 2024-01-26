import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'activity_filters_model.dart';
export 'activity_filters_model.dart';

class ActivityFiltersWidget extends StatefulWidget {
  const ActivityFiltersWidget({super.key});

  @override
  State<ActivityFiltersWidget> createState() => _ActivityFiltersWidgetState();
}

class _ActivityFiltersWidgetState extends State<ActivityFiltersWidget> {
  late ActivityFiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityFiltersModel());

    _model.desdeTxtController ??= TextEditingController();
    _model.desdeTxtFocusNode ??= FocusNode();

    _model.hastaTxtController ??= TextEditingController();
    _model.hastaTxtFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 15.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          // Close filter
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Filtros',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Restablecer',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 8.0,
                              ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 5.0),
                      child: Text(
                        'Estado',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .primaryImputBorder,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: const [
                                  ChipData('Todos'),
                                  ChipData('Sin iniciar'),
                                  ChipData('Iniciadas'),
                                  ChipData('finalizadas')
                                ],
                                onChanged: (val) => setState(
                                    () => _model.chipsEstadosValues = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 18.0,
                                  labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 1.0, 5.0, 1.0),
                                  elevation: 4.0,
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .noSelectedOption,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 13.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  iconSize: 18.0,
                                  labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 1.0, 5.0, 1.0),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 12.0,
                                multiselect: true,
                                initialized: _model.chipsEstadosValues != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.chipsEstadosValueController ??=
                                        FormFieldController<List<String>>(
                                  ['Todos'],
                                ),
                                wrapped: false,
                              ),
                            ),
                          ]
                              .addToStart(const SizedBox(width: 10.0))
                              .addToEnd(const SizedBox(width: 20.0)),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                      child: Text(
                        'Fechas',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .primaryImputBorder,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.desdeTxtController,
                                focusNode: _model.desdeTxtFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.desdeTxtController',
                                  const Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Desde',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                  suffixIcon: _model
                                          .desdeTxtController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.desdeTxtController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryImputBorder,
                                            size: 10.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.datetime,
                                validator: _model.desdeTxtControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.desdeTxtMask],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '-',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: TextFormField(
                                controller: _model.hastaTxtController,
                                focusNode: _model.hastaTxtFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.hastaTxtController',
                                  const Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Hasta',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                  suffixIcon: _model
                                          .hastaTxtController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.hastaTxtController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryImputBorder,
                                            size: 10.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.datetime,
                                validator: _model.hastaTxtControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.hastaTxtMask],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 15.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Mostrar Resultados',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
