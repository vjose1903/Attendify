import '/flutter_flow/flutter_flow_util.dart';
import 'confirmate_user_widget.dart' show ConfirmateUserWidget;
import 'package:flutter/material.dart';

class ConfirmateUserModel extends FlutterFlowModel<ConfirmateUserWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for passowrdTxt widget.
  FocusNode? passowrdTxtFocusNode;
  TextEditingController? passowrdTxtController;
  late bool passowrdTxtVisibility;
  String? Function(BuildContext, String?)? passowrdTxtControllerValidator;
  String? _passowrdTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passowrdTxtVisibility = false;
    passowrdTxtControllerValidator = _passowrdTxtControllerValidator;
  }

  @override
  void dispose() {
    passowrdTxtFocusNode?.dispose();
    passowrdTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
