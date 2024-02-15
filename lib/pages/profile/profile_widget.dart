import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/forms/confirmate_user/confirmate_user_widget.dart';
import '/components/forms/form_doc_identidad/form_doc_identidad_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 730.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 730.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PAGE_profile_ON_INIT_STATE');
      // Find doc identidad
      logFirebaseEvent('profile_Finddocidentidad');
      _model.findDocIdentidad = await queryDocumentoIdentidadRecordOnce(
        queryBuilder: (documentoIdentidadRecord) =>
            documentoIdentidadRecord.where(
          'usuarioReference',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.findDocIdentidad?.reference != null) {
        // Set document initial values
        logFirebaseEvent('profile_Setdocumentinitialvalues');
        _model.initialValueDoc = _model.findDocIdentidad?.valor;
        _model.initialRefDoc = _model.findDocIdentidad?.reference;
        _model.initialTipoDoc = _model.findDocIdentidad?.tipo;
      }
    });

    _model.textController1 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: currentPhoneNumber);
    _model.textFieldFocusNode2 ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('PROFILE_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'PROFILE_PAGE_Image_grfd53z2_ON_TAP');
                                logFirebaseEvent('Image_expand_image');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: OctoImage(
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                          currentUserPhoto != ''
                                              ? valueOrDefault(
                                                  currentUserDocument
                                                      ?.photoBlurUrl,
                                                  '')
                                              : FFAppConstants
                                                  .noUserUrlBlurHash,
                                        ),
                                        image: NetworkImage(
                                          currentUserPhoto != ''
                                              ? currentUserPhoto
                                              : FFAppConstants.noUserImgUrl,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: currentUserPhoto != ''
                                          ? currentUserPhoto
                                          : FFAppConstants.noUserImgUrl,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: currentUserPhoto != ''
                                    ? currentUserPhoto
                                    : FFAppConstants.noUserImgUrl,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: OctoImage(
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      currentUserPhoto != ''
                                          ? valueOrDefault(
                                              currentUserDocument?.photoBlurUrl,
                                              '')
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
                        if (_model.isEditing == true)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PROFILE_PAGE_ChangePhoto_ON_TAP');
                              // Req. permission galery
                              logFirebaseEvent(
                                  'ChangePhoto_Req.permissiongalery');
                              await requestPermission(photoLibraryPermission);
                              // Req. permission camara
                              logFirebaseEvent(
                                  'ChangePhoto_Req.permissioncamara');
                              await requestPermission(cameraPermission);
                              logFirebaseEvent(
                                  'ChangePhoto_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                imageQuality: 60,
                                allowPhoto: true,
                                includeBlurHash: true,
                                pickerFontFamily: 'Open Sans',
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: const BoxDecoration(
                                color: Color(0x79797D8B),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Color(0xCFFFFFFF),
                                size: 50.0,
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
                children: [
                  if (_model.isEditing == false)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          valueOrDefault<String>(
                            currentUserDisplayName,
                            'Agrega tu nombre',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).info,
                              ),
                        ),
                      ),
                    ),
                  if (_model.isEditing == true)
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 50.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              alignLabelWithHint: false,
                              hintText: 'Ingrese Nombre',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryImputBorder,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 20.0,
                                ),
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                currentUserEmail,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 32.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                            disabledIconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              Icons.group_add,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: (_model.isEditing == true)
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'PROFILE_PAGE_group_add_ICN_ON_TAP');
                                    // go to login
                                    logFirebaseEvent('IconButton_gotologin');

                                    context.pushNamed(
                                      'followGroup',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.scale,
                                          alignment: Alignment.bottomCenter,
                                          duration: Duration(milliseconds: 800),
                                        ),
                                      },
                                    );
                                  },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'Unirme a Grupo',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 10.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                            disabledIconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            icon: Icon(
                              Icons.login_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: (_model.isEditing == true)
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'PROFILE_PAGE_login_sharp_ICN_ON_TAP');
                                    // logout
                                    logFirebaseEvent('IconButton_logout');
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    // go to login
                                    logFirebaseEvent('IconButton_gotologin');

                                    context.goNamedAuth(
                                      'loginPage',
                                      context.mounted,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      },
                                    );
                                  },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'Cerrar sesión',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 10.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, -1.0),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Información',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).selectedOption,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.settings_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryImputBorder,
                                  size: 22.0,
                                ),
                                onPressed: (_model.isEditing == true)
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'PROFILE_PAGE_settings_sharp_ICN_ON_TAP');
                                        // Change is Editing
                                        logFirebaseEvent(
                                            'IconButton_ChangeisEditing');
                                        setState(() {
                                          _model.isEditing = true;
                                        });
                                        // Show btns
                                        logFirebaseEvent('IconButton_Showbtns');
                                        if (animationsMap[
                                                'rowOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'rowOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 16.0, 8.0),
                                          child: Icon(
                                            Icons.phone_android,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Número telefono',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (_model.isEditing == false)
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      currentPhoneNumber,
                                                      '-',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  ),
                                                ),
                                              if (_model.isEditing == true)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .textController2,
                                                        focusNode: _model
                                                            .textFieldFocusNode2,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          hintText:
                                                              'Ingresar teléfono',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        maxLength: 14,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .none,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            TextInputType.phone,
                                                        validator: _model
                                                            .textController2Validator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model.textFieldMask2
                                                        ],
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: StreamBuilder<
                                        List<DocumentoIdentidadRecord>>(
                                      stream: queryDocumentoIdentidadRecord(
                                        queryBuilder:
                                            (documentoIdentidadRecord) =>
                                                documentoIdentidadRecord.where(
                                          'usuarioReference',
                                          isEqualTo: currentUserReference,
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
                                        List<DocumentoIdentidadRecord>
                                            documentoIdentidadDocumentoIdentidadRecordList =
                                            snapshot.data!;
                                        final documentoIdentidadDocumentoIdentidadRecord =
                                            documentoIdentidadDocumentoIdentidadRecordList
                                                    .isNotEmpty
                                                ? documentoIdentidadDocumentoIdentidadRecordList
                                                    .first
                                                : null;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 16.0, 8.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.idCardAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      'Doc. identidad',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  if (documentoIdentidadDocumentoIdentidadRecord !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          () {
                                                            if (documentoIdentidadDocumentoIdentidadRecord
                                                                    .tipo ==
                                                                TipoDocumentoIdentidad
                                                                    .cedula) {
                                                              return 'Cédula';
                                                            } else if (documentoIdentidadDocumentoIdentidadRecord
                                                                    .tipo ==
                                                                TipoDocumentoIdentidad
                                                                    .pasaporte) {
                                                              return 'Pasaporte';
                                                            } else if (documentoIdentidadDocumentoIdentidadRecord
                                                                    .tipo ==
                                                                TipoDocumentoIdentidad
                                                                    .rnc) {
                                                              return 'RNC';
                                                            } else {
                                                              return '-';
                                                            }
                                                          }(),
                                                          '-',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (_model.isEditing == false)
                                                    Text(
                                                      valueOrDefault<String>(
                                                        documentoIdentidadDocumentoIdentidadRecord !=
                                                                null
                                                            ? documentoIdentidadDocumentoIdentidadRecord
                                                                .valor
                                                            : 'No definido',
                                                        'No definido',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                  if (_model.isEditing == true)
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PROFILE_PAGE_CAMBIAR_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
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
                                                                child:
                                                                    SizedBox(
                                                                  height: 300.0,
                                                                  child:
                                                                      FormDocIdentidadWidget(
                                                                    documentoIdentidad:
                                                                        documentoIdentidadDocumentoIdentidadRecord,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: 'Cambiar',
                                                      options: FFButtonOptions(
                                                        height: 30.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  if (false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 16.0, 8.0),
                                            child: Icon(
                                              Icons.notifications_active,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                'Configuración de notificaciónes',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PROFILE_PAGE_deleteAccount_ON_TAP');
                                          var shouldSetState = false;
                                          // Set delete user ref
                                          logFirebaseEvent(
                                              'deleteAccount_Setdeleteuserref');
                                          _model.deleteUserRef =
                                              currentUserReference;
                                          // Find grupos usuario
                                          logFirebaseEvent(
                                              'deleteAccount_Findgruposusuario');
                                          _model.gruposSeguidos =
                                              await queryGrupoUsuarioRecordOnce(
                                            queryBuilder:
                                                (grupoUsuarioRecord) =>
                                                    grupoUsuarioRecord.where(
                                              'usuario',
                                              isEqualTo: _model.deleteUserRef,
                                            ),
                                          );
                                          shouldSetState = true;
                                          // Delete modal
                                          logFirebaseEvent(
                                              'deleteAccount_Deletemodal');
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
                                                    height: 350.0,
                                                    width: double.infinity,
                                                    child: ConfirmateUserWidget(
                                                      title: 'Confirmación',
                                                      colorBtn:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      labelBtn: 'Eliminar',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.passwordConfirm = value));

                                          shouldSetState = true;
                                          if (_model.passwordConfirm != null &&
                                              _model.passwordConfirm != '') {
                                            // Delete Auth User
                                            logFirebaseEvent(
                                                'deleteAccount_DeleteAuthUser');
                                            _model.deleteAuthResponse =
                                                await actions.deleteAccount(
                                              currentUserEmail,
                                              _model.passwordConfirm!,
                                            );
                                            shouldSetState = true;
                                            if (_model
                                                .deleteAuthResponse!.error) {
                                              logFirebaseEvent(
                                                  'deleteAccount_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    _model.deleteAuthResponse!
                                                        .message,
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                              return;
                                            } else {
                                              // Delete user record
                                              logFirebaseEvent(
                                                  'deleteAccount_Deleteuserrecord');
                                              await _model.deleteUserRef!
                                                  .delete();
                                              if (FFAppState()
                                                  .gruposSeguidos
                                                  .isNotEmpty) {
                                                while (FFAppState().contador <
                                                    _model.gruposSeguidos!
                                                        .length) {
                                                  // Delete grupo usuario
                                                  logFirebaseEvent(
                                                      'deleteAccount_Deletegrupousuario');
                                                  await _model
                                                      .gruposSeguidos![
                                                          FFAppState().contador]
                                                      .reference
                                                      .delete();
                                                  // Increment Contador
                                                  logFirebaseEvent(
                                                      'deleteAccount_IncrementContador');
                                                  FFAppState().contador =
                                                      FFAppState().contador + 1;
                                                }
                                                logFirebaseEvent(
                                                    'deleteAccount_update_app_state');
                                                FFAppState().contador = 0;
                                              }
                                            }
                                          } else {
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 16.0, 8.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.solidTrashAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      3.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                'Eliminar Cuenta',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_PAGE_CancelBtn_ON_TAP');
                                if (_model.uploadedFileUrl != '') {
                                  // Delete previous photo
                                  logFirebaseEvent(
                                      'CancelBtn_Deletepreviousphoto');
                                  await FirebaseStorage.instance
                                      .refFromURL(_model.uploadedFileUrl)
                                      .delete();
                                  // Clear photo data
                                  logFirebaseEvent('CancelBtn_Clearphotodata');
                                  setState(() {
                                    _model.isDataUploading = false;
                                    _model.uploadedLocalFile = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl = '';
                                  });
                                }
                                // Find doc identidad
                                logFirebaseEvent('CancelBtn_Finddocidentidad');
                                _model.findDocIdentidadCancel =
                                    await queryDocumentoIdentidadRecordOnce(
                                  queryBuilder: (documentoIdentidadRecord) =>
                                      documentoIdentidadRecord.where(
                                    'usuarioReference',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.findDocIdentidadCancel != null) {
                                  if (_model.initialRefDoc?.id != null &&
                                      _model.initialRefDoc?.id != '') {
                                    if ((_model.initialValueDoc !=
                                            _model.findDocIdentidadCancel
                                                ?.valor) ||
                                        (_model.findDocIdentidadCancel?.tipo !=
                                            _model.initialTipoDoc)) {
                                      // Return initial doc values
                                      logFirebaseEvent(
                                          'CancelBtn_Returninitialdocvalues');

                                      await _model.initialRefDoc!.update(
                                          createDocumentoIdentidadRecordData(
                                        tipo: _model.initialTipoDoc,
                                        valor: _model.initialValueDoc,
                                      ));
                                    }
                                  } else {
                                    // delete new documento
                                    logFirebaseEvent(
                                        'CancelBtn_deletenewdocumento');
                                    await _model
                                        .findDocIdentidadCancel!.reference
                                        .delete();
                                  }
                                }
                                // Hide btns
                                logFirebaseEvent('CancelBtn_Hidebtns');
                                if (animationsMap[
                                        'rowOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['rowOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                                // Change is Editing
                                logFirebaseEvent('CancelBtn_ChangeisEditing');
                                setState(() {
                                  _model.isEditing = false;
                                });

                                setState(() {});
                              },
                              text: 'Cancelar',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryImputBorder,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('PROFILE_PAGE_SaveBtn_ON_TAP');
                                // Editar perfil
                                logFirebaseEvent('SaveBtn_Editarperfil');

                                await currentUserReference!
                                    .update(createUsuariosRecordData(
                                  displayName: _model.textController1.text,
                                  phoneNumber: _model.textController2.text,
                                ));
                                if (_model.uploadedFileUrl != '') {
                                  if (currentUserPhoto != '') {
                                    // Delete previous photo
                                    logFirebaseEvent(
                                        'SaveBtn_Deletepreviousphoto');
                                    await FirebaseStorage.instance
                                        .refFromURL(currentUserPhoto)
                                        .delete();
                                  }
                                  // update next photo
                                  logFirebaseEvent('SaveBtn_updatenextphoto');

                                  await currentUserReference!
                                      .update(createUsuariosRecordData(
                                    photoUrl: _model.uploadedFileUrl,
                                    photoBlurUrl:
                                        _model.uploadedLocalFile.blurHash,
                                  ));
                                  // Clear photo data
                                  logFirebaseEvent('SaveBtn_Clearphotodata');
                                  setState(() {
                                    _model.isDataUploading = false;
                                    _model.uploadedLocalFile = FFUploadedFile(
                                        bytes: Uint8List.fromList([]));
                                    _model.uploadedFileUrl = '';
                                  });
                                }
                                // Find doc identidad
                                logFirebaseEvent('SaveBtn_Finddocidentidad');
                                _model.findDocIdentidadAceptar =
                                    await queryDocumentoIdentidadRecordOnce(
                                  queryBuilder: (documentoIdentidadRecord) =>
                                      documentoIdentidadRecord.where(
                                    'usuarioReference',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.findDocIdentidadAceptar?.reference
                                            .id !=
                                        null &&
                                    _model.findDocIdentidadAceptar?.reference
                                            .id !=
                                        '') {
                                  // update doc state
                                  logFirebaseEvent('SaveBtn_updatedocstate');
                                  setState(() {
                                    _model.initialTipoDoc =
                                        _model.findDocIdentidadAceptar?.tipo;
                                    _model.initialValueDoc =
                                        _model.findDocIdentidadAceptar?.valor;
                                    _model.initialRefDoc =
                                        _model.initialRefDoc?.id != null &&
                                                _model.initialRefDoc?.id != ''
                                            ? _model.initialRefDoc
                                            : _model.findDocIdentidadAceptar
                                                ?.reference;
                                  });
                                }
                                // Hide btns
                                logFirebaseEvent('SaveBtn_Hidebtns');
                                if (animationsMap[
                                        'rowOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap['rowOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                                // Change is Editing
                                logFirebaseEvent('SaveBtn_ChangeisEditing');
                                setState(() {
                                  _model.isEditing = false;
                                });

                                setState(() {});
                              },
                              text: 'Guardar',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ).animateOnActionTrigger(
                          animationsMap['rowOnActionTriggerAnimation']!,
                        ),
                      ],
                    ),
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
