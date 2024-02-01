import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:carousel_slider/carousel_slider.dart';
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
  // Stores action output result for [Custom Action - getProximasActividades] action in homeScreen widget.
  dynamic getProximasActividadesResponse;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  GrupoActividadRecord? findGrupoActividad;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<GrupoActividadDetalleRecord>? findGrupoActividadDetalle;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  int? imagenesActividadResponse;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;
  // Stores action output result for [Backend Call - Read Document] action in QrOption widget.
  UsuariosRecord? findAdminCurrenUserLogged;
  // Stores action output result for [Backend Call - Read Document] action in QrOption widget.
  GrupoUsuarioRecord? findAdminGrupoUsarioLogged;
  // Stores action output result for [Backend Call - Read Document] action in QrButton widget.
  UsuariosRecord? findCurrenUserLogged;
  // Stores action output result for [Backend Call - Read Document] action in QrButton widget.
  GrupoUsuarioRecord? findGrupoUsarioLogged;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emptyListModel = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
