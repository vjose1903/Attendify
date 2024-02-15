import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'continue_register_model.dart';
export 'continue_register_model.dart';

class ContinueRegisterWidget extends StatefulWidget {
  const ContinueRegisterWidget({
    super.key,
    required this.userUid,
    required this.email,
  });

  final String? userUid;
  final String? email;

  @override
  State<ContinueRegisterWidget> createState() => _ContinueRegisterWidgetState();
}

class _ContinueRegisterWidgetState extends State<ContinueRegisterWidget>
    with TickerProviderStateMixin {
  late ContinueRegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3.0, 3.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 30.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 30.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContinueRegisterModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'continueRegister'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTINUE_REGISTER_continueRegister_ON_IN');
      // Complete registration
      logFirebaseEvent('continueRegister_Completeregistration');
      _model.registrationResult = await actions.continueRegisterWithEmail(
        widget.userUid!,
        widget.email!,
      );
      if (_model.registrationResult == true) {
        // Some wait
        logFirebaseEvent('continueRegister_Somewait');
        await Future.delayed(const Duration(milliseconds: 1500));
        // Complete state
        logFirebaseEvent('continueRegister_Completestate');
        setState(() {
          _model.completed = true;
        });
        // Some wait for show animation
        logFirebaseEvent('continueRegister_Somewaitforshowanimatio');
        await Future.delayed(const Duration(milliseconds: 3000));
        // Clear followed Groups
        logFirebaseEvent('continueRegister_ClearfollowedGroups');
        FFAppState().update(() {
          FFAppState().gruposSeguidos = [];
        });
        // Go to follow
        logFirebaseEvent('continueRegister_Gotofollow');

        context.goNamed(
          'followGroup',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 500),
            ),
          },
        );
      } else {
        // Change State Error
        logFirebaseEvent('continueRegister_ChangeStateError');
        setState(() {
          _model.error = true;
        });
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primaryBackground,
                        FlutterFlowTheme.of(context).secondaryBackground,
                        FlutterFlowTheme.of(context).primary
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      begin: const AlignmentDirectional(-1.0, -1.0),
                      end: const AlignmentDirectional(1.0, 1.0),
                    ),
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00FFFFFF),
                          FlutterFlowTheme.of(context).secondaryBackground
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Procesando registro',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 8.0, 44.0, 0.0),
                          child: Text(
                            'Un Momento, Estamos Configurando Tu Cuenta...',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (_model.completed == true) {
                                  return Lottie.asset(
                                    'assets/lottie_animations/complete_animation.json',
                                    width: 150.0,
                                    height: 130.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  );
                                } else {
                                  return Lottie.asset(
                                    'assets/lottie_animations/configuring.json',
                                    width: 150.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.5,
                                    fit: BoxFit.cover,
                                    animate: true,
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
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
