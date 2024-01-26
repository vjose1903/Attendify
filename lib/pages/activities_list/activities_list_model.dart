import '/backend/backend.dart';
import '/components/activity_filters/activity_filters_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'activities_list_widget.dart' show ActivitiesListWidget;
import 'package:flutter/material.dart';

class ActivitiesListModel extends FlutterFlowModel<ActivitiesListWidget> {
  ///  Local state fields for this page.

  DocumentReference? actividadSelected;

  bool processing = false;

  List<dynamic> accessList = [];
  void addToAccessList(dynamic item) => accessList.add(item);
  void removeFromAccessList(dynamic item) => accessList.remove(item);
  void removeAtIndexFromAccessList(int index) => accessList.removeAt(index);
  void insertAtIndexInAccessList(int index, dynamic item) =>
      accessList.insert(index, item);
  void updateAccessListAtIndex(int index, Function(dynamic) updateFn) =>
      accessList[index] = updateFn(accessList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
  // Model for ActivityFilters component.
  late ActivityFiltersModel activityFiltersModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    activityFiltersModel = createModel(context, () => ActivityFiltersModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    activityFiltersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
