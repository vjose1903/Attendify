import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'actividad_item_widget.dart' show ActividadItemWidget;
import 'package:flutter/material.dart';

class ActividadItemModel extends FlutterFlowModel<ActividadItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<GrupoActividadDetalleRecord>? doubleGrupoActividadDetalleResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? doubleImagenesActividadResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<GrupoActividadDetalleRecord>? longGrupoActividadDetalleResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ActividadImagenesRecord>? longImgResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ActividadObjetoAEntregarRecord>? longObjetosAEntregarResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<AccesoRecord>? longAccessResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
