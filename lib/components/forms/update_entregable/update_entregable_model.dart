import '/flutter_flow/flutter_flow_util.dart';
import 'update_entregable_widget.dart' show UpdateEntregableWidget;
import 'package:flutter/material.dart';

class UpdateEntregableModel extends FlutterFlowModel<UpdateEntregableWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for entregableTxt widget.
  FocusNode? entregableTxtFocusNode;
  TextEditingController? entregableTxtController;
  String? Function(BuildContext, String?)? entregableTxtControllerValidator;
  String? _entregableTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    entregableTxtControllerValidator = _entregableTxtControllerValidator;
  }

  @override
  void dispose() {
    entregableTxtFocusNode?.dispose();
    entregableTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
