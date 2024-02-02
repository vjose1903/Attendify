import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asistencia_list_view_widget.dart' show AsistenciaListViewWidget;
import 'package:flutter/material.dart';

class AsistenciaListViewModel
    extends FlutterFlowModel<AsistenciaListViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ListTile widget.
  List<ObjetoEntregadoRecord>? findViewObjetosEntregados;
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
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ObjetoEntregadoRecord>? deleteObjetosEntregados;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
