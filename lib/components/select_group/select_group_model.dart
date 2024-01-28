import '/backend/backend.dart';
import '/components/grupo_option/grupo_option_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_group_widget.dart' show SelectGroupWidget;
import 'package:flutter/material.dart';

class SelectGroupModel extends FlutterFlowModel<SelectGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // Models for GrupoOption dynamic component.
  late FlutterFlowDynamicModels<GrupoOptionModel> grupoOptionModels;
  // Stores action output result for [Firestore Query - Query a collection] action in GrupoOption widget.
  GrupoUsuarioRecord? grupoUsuaruiResponse;
  // Stores action output result for [Custom Action - getProximasActividades] action in GrupoOption widget.
  dynamic getProximasActividadesResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    grupoOptionModels = FlutterFlowDynamicModels(() => GrupoOptionModel());
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    grupoOptionModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
