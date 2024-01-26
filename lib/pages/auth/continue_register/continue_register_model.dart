import '/flutter_flow/flutter_flow_util.dart';
import 'continue_register_widget.dart' show ContinueRegisterWidget;
import 'package:flutter/material.dart';

class ContinueRegisterModel extends FlutterFlowModel<ContinueRegisterWidget> {
  ///  Local state fields for this page.

  bool completed = false;

  bool error = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - continueRegisterWithEmail] action in continueRegister widget.
  bool? registrationResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
