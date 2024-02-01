import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asistencia_list_view_widget.dart' show AsistenciaListViewWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AsistenciaListViewModel
    extends FlutterFlowModel<AsistenciaListViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  GrupoUsuarioRecord? editFindGrupoUsuarioResponse;
  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  UsuariosRecord? editFindUserInfoResponse;
  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  TipoUsuarioRecord? editFindTipoUsuarioResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ActividadObjetoAEntregarRecord>? editFindObjetosAEntregarResponsee;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ObjetoEntregadoRecord>? editFindObjetosEntregados;
  Completer<List<AsistenciaRecord>>? firestoreRequestCompleter1;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ObjetoEntregadoRecord>? deleteObjetosEntregados;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
