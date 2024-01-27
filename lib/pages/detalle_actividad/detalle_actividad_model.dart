import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'detalle_actividad_widget.dart' show DetalleActividadWidget;
import 'package:flutter/material.dart';

class DetalleActividadModel extends FlutterFlowModel<DetalleActividadWidget> {
  ///  Local state fields for this page.

  List<String> customTabs = [''];
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
  List<String>? accessChipsValues;
  FormFieldController<List<String>>? accessChipsValueController;
  // State field(s) for customTabs widget.
  String? customTabsValue;
  FormFieldController<List<String>>? customTabsValueController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DateAsistenciaChips widget.
  String? dateAsistenciaChipsValue;
  FormFieldController<List<String>>? dateAsistenciaChipsValueController;
  Completer<List<AsistenciaRecord>>? firestoreRequestCompleter1;
  // State field(s) for searchAsistencia widget.
  FocusNode? searchAsistenciaFocusNode;
  TextEditingController? searchAsistenciaController;
  String? Function(BuildContext, String?)? searchAsistenciaControllerValidator;
  List<AsistenciaRecord> simpleSearchResults = [];
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
  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  GrupoUsuarioRecord? editFilterFindGrupoUsuarioResponse;
  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  UsuariosRecord? editFilterFindUserInfoResponse;
  // Stores action output result for [Backend Call - Read Document] action in SlidableActionWidget widget.
  TipoUsuarioRecord? editFilterfindTipoUsuarioResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ActividadObjetoAEntregarRecord>? editFilterFindObjetosAEntregarResponsee;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ObjetoEntregadoRecord>? editFilterFindObjetosEntregados;
  // Stores action output result for [Firestore Query - Query a collection] action in SlidableActionWidget widget.
  List<ObjetoEntregadoRecord>? deleteFilterObjetosEntregados;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel1;
  // State field(s) for DateNotasChips widget.
  String? dateNotasChipsValue;
  FormFieldController<List<String>>? dateNotasChipsValueController;
  Completer<List<ActividadComentarioRecord>>? firestoreRequestCompleter2;
  // Stores action output result for [Backend Call - Read Document] action in ListTile widget.
  GrupoUsuarioRecord? grupoUsuarioNotaResponse;
  // Stores action output result for [Backend Call - Read Document] action in ListTile widget.
  UsuariosRecord? usuarioNotaResponse;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel2;
  var scanResponse = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GrupoUsuarioRecord? findGrupoUsuarioQrResponse;
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
    emptyListModel1 = createModel(context, () => EmptyListModel());
    emptyListModel2 = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchAsistenciaFocusNode?.dispose();
    searchAsistenciaController?.dispose();

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
