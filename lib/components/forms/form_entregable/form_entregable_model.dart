import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'form_entregable_widget.dart' show FormEntregableWidget;
import 'package:flutter/material.dart';

class FormEntregableModel extends FlutterFlowModel<FormEntregableWidget> {
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

  // Stores action output result for [Backend Call - Create Document] action in addEntregable widget.
  ObjetoAEntregarRecord? createEntregableResponse;
  Completer<List<ObjetoAEntregarRecord>>? firestoreRequestCompleter;

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

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
