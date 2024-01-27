import '/flutter_flow/flutter_flow_util.dart';
import 'asistencia_objeto_a_entregar_widget.dart'
    show AsistenciaObjetoAEntregarWidget;
import 'package:flutter/material.dart';

class AsistenciaObjetoAEntregarModel
    extends FlutterFlowModel<AsistenciaObjetoAEntregarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CantidadTxt widget.
  FocusNode? cantidadTxtFocusNode;
  TextEditingController? cantidadTxtController;
  String? Function(BuildContext, String?)? cantidadTxtControllerValidator;
  // State field(s) for ObjetoTxt widget.
  FocusNode? objetoTxtFocusNode;
  TextEditingController? objetoTxtController;
  String? Function(BuildContext, String?)? objetoTxtControllerValidator;
  // Stores action output result for [Custom Action - updateObjetoAEntregarJson] action in addButton widget.
  dynamic addResponse;
  // Stores action output result for [Custom Action - updateObjetoAEntregarJson] action in reduceButton widget.
  dynamic reduceResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cantidadTxtFocusNode?.dispose();
    cantidadTxtController?.dispose();

    objetoTxtFocusNode?.dispose();
    objetoTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
