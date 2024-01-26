import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'users_list_widget.dart' show UsersListWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersListModel extends FlutterFlowModel<UsersListWidget> {
  ///  Local state fields for this page.

  String selectedChip = '';

  TipoUsuarioRecord? currentTipoUsuario;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChipsTipoUsuario widget.
  String? chipsTipoUsuarioValue;
  FormFieldController<List<String>>? chipsTipoUsuarioValueController;
  // Stores action output result for [Custom Action - getTipoUsuarioByDescripcion] action in ChipsTipoUsuario widget.
  TipoUsuarioRecord? findTipoUsuario;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, GrupoUsuarioRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  Future reloadTipoUsuario(BuildContext context) async {}

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, GrupoUsuarioRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, GrupoUsuarioRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, GrupoUsuarioRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGrupoUsuarioRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
