import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  bool isOptionsExpanded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in homeScreen widget.
  List<GrupoUsuarioRecord>? finUserGruposSeguidos;
  // Stores action output result for [Backend Call - Read Document] action in homeScreen widget.
  GrupoRecord? findGrupoSelectedResult;
  // Stores action output result for [Firestore Query - Query a collection] action in homeScreen widget.
  GrupoUsuarioRecord? grupoUsuarioResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
