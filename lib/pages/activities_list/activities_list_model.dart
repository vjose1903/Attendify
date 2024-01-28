import '/backend/backend.dart';
import '/components/actividad_item/actividad_item_widget.dart';
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

  bool showFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchActividades widget.
  FocusNode? searchActividadesFocusNode;
  TextEditingController? searchActividadesController;
  String? Function(BuildContext, String?)? searchActividadesControllerValidator;
  List<GrupoActividadRecord> simpleSearchResults = [];
  // Models for actividadItem dynamic component.
  late FlutterFlowDynamicModels<ActividadItemModel> actividadItemModels1;
  // Models for actividadItem dynamic component.
  late FlutterFlowDynamicModels<ActividadItemModel> actividadItemModels2;
  // Model for ActivityFilters component.
  late ActivityFiltersModel activityFiltersModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    actividadItemModels1 = FlutterFlowDynamicModels(() => ActividadItemModel());
    actividadItemModels2 = FlutterFlowDynamicModels(() => ActividadItemModel());
    activityFiltersModel = createModel(context, () => ActivityFiltersModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchActividadesFocusNode?.dispose();
    searchActividadesController?.dispose();

    actividadItemModels1.dispose();
    actividadItemModels2.dispose();
    activityFiltersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
