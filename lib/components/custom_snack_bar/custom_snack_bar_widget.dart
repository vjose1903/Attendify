import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'custom_snack_bar_model.dart';
export 'custom_snack_bar_model.dart';

class CustomSnackBarWidget extends StatefulWidget {
  const CustomSnackBarWidget({
    super.key,
    required this.msg,
    required this.type,
    bool? automaticHide,
  }) : automaticHide = automaticHide ?? true;

  final String? msg;
  final ToastType? type;
  final bool automaticHide;

  @override
  State<CustomSnackBarWidget> createState() => _CustomSnackBarWidgetState();
}

class _CustomSnackBarWidgetState extends State<CustomSnackBarWidget>
    with TickerProviderStateMixin {
  late CustomSnackBarModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, 0.0),
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
    _model = createModel(context, () => CustomSnackBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CUSTOM_SNACK_BAR_customSnackBar_ON_INIT_');
      // show custom snack bar
      logFirebaseEvent('customSnackBar_showcustomsnackbar');
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward();
      }
      if (widget.automaticHide) {
        logFirebaseEvent('customSnackBar_wait__delay');
        await Future.delayed(const Duration(milliseconds: 2000));
        // hide custom snack bar
        logFirebaseEvent('customSnackBar_hidecustomsnackbar');
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .reverse();
        }
        // Close Dialog
        logFirebaseEvent('customSnackBar_CloseDialog');
        await actions.tryDissmissModal(
          context,
        );
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                () {
                  if (widget.type == ToastType.error) {
                    return FlutterFlowTheme.of(context).error;
                  } else if (widget.type == ToastType.success) {
                    return FlutterFlowTheme.of(context).success;
                  } else if (widget.type == ToastType.info) {
                    return FlutterFlowTheme.of(context).secondary;
                  } else if (widget.type == ToastType.warning) {
                    return const Color(0xFFFFF88A);
                  } else if (widget.type == ToastType.none) {
                    return FlutterFlowTheme.of(context).primaryImputBackground;
                  } else {
                    return FlutterFlowTheme.of(context).primary;
                  }
                }(),
                FlutterFlowTheme.of(context).primary,
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 5.0),
                )
              ],
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.msg,
                      'Esta acción borrará el registro definitivamente, ¿Desea Continuar?',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.type == ToastType.error) {
                                return FlutterFlowTheme.of(context).primaryText;
                              } else if (widget.type == ToastType.success) {
                                return FlutterFlowTheme.of(context).primaryText;
                              } else if (widget.type == ToastType.info) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              } else if (widget.type == ToastType.warning) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              } else if (widget.type == ToastType.none) {
                                return FlutterFlowTheme.of(context).info;
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
        ),
      ],
    );
  }
}
