import '/backend/backend.dart';
import '/components/asistencia_list_view/asistencia_list_view_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'detalle_actividad_widget.dart' show DetalleActividadWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DetalleActividadModel extends FlutterFlowModel<DetalleActividadWidget> {
  ///  Local state fields for this page.

  List<String> customTabs = ['Detalles'];
  void addToCustomTabs(String item) => customTabs.add(item);
  void removeFromCustomTabs(String item) => customTabs.remove(item);
  void removeAtIndexFromCustomTabs(int index) => customTabs.removeAt(index);
  void insertAtIndexInCustomTabs(int index, String item) =>
      customTabs.insert(index, item);
  void updateCustomTabsAtIndex(int index, Function(String) updateFn) =>
      customTabs[index] = updateFn(customTabs[index]);

  bool showFullAsistenciaList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for accessChips widget.
  FormFieldController<List<String>>? accessChipsValueController;
  List<String>? get accessChipsValues => accessChipsValueController?.value;
  set accessChipsValues(List<String>? val) =>
      accessChipsValueController?.value = val;
  // State field(s) for customTabs widget.
  FormFieldController<List<String>>? customTabsValueController;
  String? get customTabsValue => customTabsValueController?.value?.firstOrNull;
  set customTabsValue(String? val) =>
      customTabsValueController?.value = val != null ? [val] : [];
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DateAsistenciaChips widget.
  FormFieldController<List<String>>? dateAsistenciaChipsValueController;
  String? get dateAsistenciaChipsValue =>
      dateAsistenciaChipsValueController?.value?.firstOrNull;
  set dateAsistenciaChipsValue(String? val) =>
      dateAsistenciaChipsValueController?.value = val != null ? [val] : [];
  Completer<List<AsistenciaRecord>>? firestoreRequestCompleter1;
  // State field(s) for searchAsistencia widget.
  FocusNode? searchAsistenciaFocusNode;
  TextEditingController? searchAsistenciaController;
  String? Function(BuildContext, String?)? searchAsistenciaControllerValidator;
  List<AsistenciaRecord> simpleSearchResults = [];
  // Model for fullAsistenciaListView.
  late AsistenciaListViewModel fullAsistenciaListViewModel;
  // Model for filterAsistenciaListView.
  late AsistenciaListViewModel filterAsistenciaListViewModel;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel1;
  // State field(s) for DateNotasChips widget.
  FormFieldController<List<String>>? dateNotasChipsValueController;
  String? get dateNotasChipsValue =>
      dateNotasChipsValueController?.value?.firstOrNull;
  set dateNotasChipsValue(String? val) =>
      dateNotasChipsValueController?.value = val != null ? [val] : [];
  Completer<List<ActividadComentarioRecord>>? firestoreRequestCompleter2;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel2;
  var scanResponse = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GrupoUsuarioRecord? findGrupoUsuarioQrResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AsistenciaRecord? qrFindUserIsPresent;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<AccesoRecord>? detalleAccessResponse;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsuariosRecord? qrfindUserInfoResponse;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TipoUsuarioRecord? qrfindTipoUsuarioResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ActividadObjetoAEntregarRecord>? qrfindObjetosAEntregarResponsee;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fullAsistenciaListViewModel =
        createModel(context, () => AsistenciaListViewModel());
    filterAsistenciaListViewModel =
        createModel(context, () => AsistenciaListViewModel());
    emptyListModel1 = createModel(context, () => EmptyListModel());
    emptyListModel2 = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchAsistenciaFocusNode?.dispose();
    searchAsistenciaController?.dispose();

    fullAsistenciaListViewModel.dispose();
    filterAsistenciaListViewModel.dispose();
    emptyListModel1.dispose();
    emptyListModel2.dispose();
  }

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

  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
