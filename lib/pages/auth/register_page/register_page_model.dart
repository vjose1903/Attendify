import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  Local state fields for this page.

  bool isProcessing = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Formato invalido.';
    }
    return null;
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  String? _passwordConfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo es requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailAddressCreateControllerValidator =
        _emailAddressCreateControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmControllerValidator = _passwordConfirmControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  Future register(BuildContext context) async {
    AuthResponseStruct? resgiterResponse;

    // Init Processing
    isProcessing = true;
    // Register Call
    resgiterResponse = await actions.registerWithEmail(
      emailAddressCreateController.text,
      passwordCreateController.text,
      passwordConfirmController.text,
    );
    if (resgiterResponse.error == true) {
      // change IsProcesing
      isProcessing = false;
      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            resgiterResponse.message,
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
      // Go to continue Register

      context.goNamed(
        'continueRegister',
        queryParameters: {
          'userUid': serializeParam(
            resgiterResponse.userUid,
            ParamType.String,
          ),
          'email': serializeParam(
            emailAddressCreateController.text,
            ParamType.String,
          ),
        }.withoutNulls,
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
