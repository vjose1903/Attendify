import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  bool isProcessing = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'EL email introducido es invalido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  Future loginAction(BuildContext context) async {
    AuthResponseStruct? loginResponseCopy;

    // change IsProcesing
    logFirebaseEvent('loginAction_changeIsProcesing');
    isProcessing = true;
    // loginCall
    logFirebaseEvent('loginAction_loginCall');
    loginResponseCopy = await actions.loginWithEmail(
      emailAddressController.text,
      passwordController.text,
    );
    // change IsProcesing
    logFirebaseEvent('loginAction_changeIsProcesing');
    isProcessing = false;
    if (loginResponseCopy.error == true) {
      // Show Error MSG
      logFirebaseEvent('loginAction_ShowErrorMSG');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            loginResponseCopy.message,
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    } else {
      // Go to Login
      logFirebaseEvent('loginAction_GotoLogin');

      context.goNamed(
        'homeScreen',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 500),
          ),
        },
      );
    }
  }

  /// Additional helper methods are added here.
}
