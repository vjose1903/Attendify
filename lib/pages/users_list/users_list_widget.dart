import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/actions_document/actions_document_widget.dart';
import '/components/delete_modal/delete_modal_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/forms/form_user/form_user_widget.dart';
import '/components/qr_modal/qr_modal_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'users_list_model.dart';
export 'users_list_model.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  late UsersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersListModel());
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
        floatingActionButton: Visibility(
          visible: false,
          child: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
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
                        child: FormUserWidget(
                          action: FormAction.create,
                          reloadChip: () async {
                            setState(() {
                              _model.selectedChip =
                                  _model.chipsTipoUsuarioValue!;
                            });
                            setState(() {
                              _model.chipsTipoUsuarioValueController?.reset();
                            });
                            setState(() {
                              _model.chipsTipoUsuarioValueController?.value = [
                                _model.selectedChip
                              ];
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Usuarios',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Todos'),
                            ChipData('Miembros Activos'),
                            ChipData('Miembros'),
                            ChipData('Usuarios Regulares'),
                            ChipData('Administradores')
                          ],
                          onChanged: (val) async {
                            setState(() =>
                                _model.chipsTipoUsuarioValue = val?.first);
                            if (_model.chipsTipoUsuarioValue == 'Todos') {
                              // Clear current tIpo
                              setState(() {
                                _model.currentTipoUsuario = null;
                              });
                            } else {
                              _model.findTipoUsuario =
                                  await actions.getTipoUsuarioByDescripcion(
                                valueOrDefault<String>(
                                  () {
                                    if (_model.chipsTipoUsuarioValue ==
                                        'Miembros Activos') {
                                      return 'Miembro activo';
                                    } else if (_model.chipsTipoUsuarioValue ==
                                        'Miembros') {
                                      return 'Miembro';
                                    } else if (_model.chipsTipoUsuarioValue ==
                                        'Usuarios Regulares') {
                                      return 'Usuario regular';
                                    } else {
                                      return 'Administrador';
                                    }
                                  }(),
                                  'Administrador',
                                ),
                              );
                              // Set current Tipo
                              setState(() {
                                _model.currentTipoUsuario =
                                    _model.findTipoUsuario;
                              });
                            }

                            setState(() {});
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context).titleMedium,
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                9.0, 7.0, 9.0, 7.0),
                            elevation: 4.0,
                            borderColor: FlutterFlowTheme.of(context).accent1,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).noSelectedOption,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            iconColor: FlutterFlowTheme.of(context).alternate,
                            iconSize: 18.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                9.0, 7.0, 9.0, 7.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          chipSpacing: 8.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          initialized: _model.chipsTipoUsuarioValue != null,
                          alignment: WrapAlignment.start,
                          controller: _model.chipsTipoUsuarioValueController ??=
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 0.0, 0.0),
                          child: FutureBuilder<int>(
                            future: queryGrupoUsuarioRecordCount(
                              queryBuilder: (grupoUsuarioRecord) =>
                                  grupoUsuarioRecord
                                      .where(
                                        'tipo_usuario',
                                        isEqualTo: _model
                                            .currentTipoUsuario?.reference,
                                      )
                                      .where(
                                        'grupo',
                                        isEqualTo:
                                            FFAppState().grupoSeleccionado,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 60.0,
                                    ),
                                  ),
                                );
                              }
                              int cantUsersAllCount = snapshot.data!;
                              return Text(
                                'Cantidad de usuarios: ${formatNumber(
                                  cantUsersAllCount,
                                  formatType: FormatType.compact,
                                )}',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: PagedListView<DocumentSnapshot<Object?>?,
                              GrupoUsuarioRecord>(
                            pagingController: _model.setListViewController(
                              GrupoUsuarioRecord.collection
                                  .where(
                                    'grupo',
                                    isEqualTo: FFAppState().grupoSeleccionado,
                                  )
                                  .where(
                                    'tipo_usuario',
                                    isEqualTo:
                                        _model.currentTipoUsuario?.reference,
                                  ),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              150.0,
                            ),
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<GrupoUsuarioRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 60.0,
                                  height: 60.0,
                                  child: SpinKitChasingDots(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 60.0,
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 60.0,
                                  height: 60.0,
                                  child: SpinKitChasingDots(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 60.0,
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.7,
                                  child: EmptyListWidget(
                                    title: 'No hay Usuarios',
                                    msg:
                                        'Parece que no se han registrado usuarios de este tipo',
                                    icon: FaIcon(
                                      FontAwesomeIcons.userFriends,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryImputBackground,
                                      size: 70.0,
                                    ),
                                  ),
                                ),
                              ),
                              itemBuilder: (context, _, listViewIndex) {
                                final listViewGrupoUsuarioRecord = _model
                                    .listViewPagingController!
                                    .itemList![listViewIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: StreamBuilder<List<UsuariosRecord>>(
                                    stream: queryUsuariosRecord(
                                      queryBuilder: (usuariosRecord) =>
                                          usuariosRecord.where(
                                        'uid',
                                        isEqualTo: listViewGrupoUsuarioRecord
                                            .usuario?.id,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 60.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsuariosRecord>
                                          containerUsuariosRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerUsuariosRecord =
                                          containerUsuariosRecordList.isNotEmpty
                                              ? containerUsuariosRecordList
                                                  .first
                                              : null;
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x320E151B),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: StreamBuilder<
                                                  TipoUsuarioRecord>(
                                                stream: TipoUsuarioRecord
                                                    .getDocument(
                                                        listViewGrupoUsuarioRecord
                                                            .tipoUsuario!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        child:
                                                            SpinKitChasingDots(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 60.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowTipoUsuarioRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.4,
                                                                child:
                                                                    ActionsDocumentWidget(
                                                                  showQrBtn:
                                                                      true,
                                                                  editAction:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      isDismissible:
                                                                          false,
                                                                      enableDrag:
                                                                          false,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                SizedBox(
                                                                              height: MediaQuery.sizeOf(context).height * 0.7,
                                                                              child: FormUserWidget(
                                                                                user: containerUsuariosRecord,
                                                                                action: FormAction.edit,
                                                                                grupoUsuario: listViewGrupoUsuarioRecord.reference,
                                                                                tipoUsuarioDescript: rowTipoUsuarioRecord.descripcion,
                                                                                reloadChip: () async {
                                                                                  setState(() {
                                                                                    _model.selectedChip = _model.chipsTipoUsuarioValue!;
                                                                                  });
                                                                                  setState(() {
                                                                                    _model.chipsTipoUsuarioValueController?.reset();
                                                                                  });
                                                                                  setState(() {
                                                                                    _model.chipsTipoUsuarioValueController?.value = [
                                                                                      _model.selectedChip
                                                                                    ];
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  deleteAction:
                                                                      () async {
                                                                    // Show delete modal
                                                                    await showDialog(
                                                                      barrierDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                DeleteModalWidget(
                                                                              deleteMsg: 'Esta acción borrará definitivamente al usuario:  ${valueOrDefault<String>(
                                                                                containerUsuariosRecord?.displayName,
                                                                                'Nombre no definido',
                                                                              )}, del grupo, ¿Desea Continuar?',
                                                                              title: 'Eliminar Usuario',
                                                                              deleteAction: () async {
                                                                                await listViewGrupoUsuarioRecord.reference.delete();
                                                                                // Show success Msg
                                                                                ScaffoldMessenger.of(context).clearSnackBars();
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Usuario eliminado correctamente.',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 4500),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                  ),
                                                                                );
                                                                                setState(() {
                                                                                  _model.selectedChip = _model.chipsTipoUsuarioValue!;
                                                                                });
                                                                                setState(() {
                                                                                  _model.chipsTipoUsuarioValueController?.reset();
                                                                                });
                                                                                setState(() {
                                                                                  _model.chipsTipoUsuarioValueController?.value = [
                                                                                    _model.selectedChip
                                                                                  ];
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  showQRAction:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                SizedBox(
                                                                              height: double.infinity,
                                                                              width: double.infinity,
                                                                              child: QrModalWidget(
                                                                                user: containerUsuariosRecord!,
                                                                                grupoUsuario: listViewGrupoUsuarioRecord,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  pasarAsistencia:
                                                                      () async {},
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerUsuariosRecord
                                                                    ?.photoUrl,
                                                                'https://firebasestorage.googleapis.com/v0/b/carnaval-d2054.appspot.com/o/assets%2Fuser.png?alt=media&token=765cad05-627d-4fdd-8621-d333ecf3271a',
                                                              ),
                                                              width: 80.0,
                                                              height: 80.0,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsuariosRecord
                                                                            ?.displayName,
                                                                        'No definido',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                      minFontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  rowTipoUsuarioRecord
                                                                      .descripcion,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                              ],
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
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
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
    );
  }
}
