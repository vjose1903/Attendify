import '/backend/backend.dart';
import '/components/forms/asistencia/asistencia_objeto_a_entregar/asistencia_objeto_a_entregar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_asistencia_widget.dart' show FormAsistenciaWidget;
import 'package:flutter/material.dart';

class FormAsistenciaModel extends FlutterFlowModel<FormAsistenciaWidget> {
  ///  Local state fields for this component.

  List<dynamic> objetosEntregados = [];
  void addToObjetosEntregados(dynamic item) => objetosEntregados.add(item);
  void removeFromObjetosEntregados(dynamic item) =>
      objetosEntregados.remove(item);
  void removeAtIndexFromObjetosEntregados(int index) =>
      objetosEntregados.removeAt(index);
  void insertAtIndexInObjetosEntregados(int index, dynamic item) =>
      objetosEntregados.insert(index, item);
  void updateObjetosEntregadosAtIndex(int index, Function(dynamic) updateFn) =>
      objetosEntregados[index] = updateFn(objetosEntregados[index]);

  ///  State fields for stateful widgets in this component.

  // Models for AsistenciaObjetoAEntregar dynamic component.
  late FlutterFlowDynamicModels<AsistenciaObjetoAEntregarModel>
      asistenciaObjetoAEntregarModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AsistenciaRecord? createAsistenciaResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ObjetoEntregadoRecord? createObjetoEntregadoResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    asistenciaObjetoAEntregarModels =
        FlutterFlowDynamicModels(() => AsistenciaObjetoAEntregarModel());
  }

  @override
  void dispose() {
    asistenciaObjetoAEntregarModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
