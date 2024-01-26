import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_nota_widget.dart' show FormNotaWidget;
import 'package:flutter/material.dart';

class FormNotaModel extends FlutterFlowModel<FormNotaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NotaTxt widget.
  FocusNode? notaTxtFocusNode;
  TextEditingController? notaTxtController;
  String? Function(BuildContext, String?)? notaTxtControllerValidator;
  String? _notaTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 7) {
      return 'Minimo de caracteres: 7.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActividadComentarioRecord? createNotaResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    notaTxtControllerValidator = _notaTxtControllerValidator;
  }

  @override
  void dispose() {
    notaTxtFocusNode?.dispose();
    notaTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
