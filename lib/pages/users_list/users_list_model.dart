import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'users_list_widget.dart' show UsersListWidget;
import 'package:flutter/material.dart';

class UsersListModel extends FlutterFlowModel<UsersListWidget> {
  ///  Local state fields for this page.

  String selectedChip = '';

  TipoUsuarioRecord? currentTipoUsuario;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChipsTipoUsuario widget.
  String? chipsTipoUsuarioValue;
  FormFieldController<List<String>>? chipsTipoUsuarioValueController;
  // Stores action output result for [Custom Action - getTipoUsuarioByDescripcion] action in ChipsTipoUsuario widget.
  TipoUsuarioRecord? findTipoUsuario;
  Completer<List<GrupoUsuarioRecord>>? firestoreRequestCompleter;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future reloadTipoUsuario(BuildContext context) async {}

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
