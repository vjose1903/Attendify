import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_activity_widget.dart' show FormActivityWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormActivityModel extends FlutterFlowModel<FormActivityWidget> {
  ///  Local state fields for this component.

  bool datePickerShow = false;

  List<dynamic> objetosAEntregarSelected = [];
  void addToObjetosAEntregarSelected(dynamic item) =>
      objetosAEntregarSelected.add(item);
  void removeFromObjetosAEntregarSelected(dynamic item) =>
      objetosAEntregarSelected.remove(item);
  void removeAtIndexFromObjetosAEntregarSelected(int index) =>
      objetosAEntregarSelected.removeAt(index);
  void insertAtIndexInObjetosAEntregarSelected(int index, dynamic item) =>
      objetosAEntregarSelected.insert(index, item);
  void updateObjetosAEntregarSelectedAtIndex(
          int index, Function(dynamic) updateFn) =>
      objetosAEntregarSelected[index] =
          updateFn(objetosAEntregarSelected[index]);

  List<dynamic> objetosAEntregarToRemove = [];
  void addToObjetosAEntregarToRemove(dynamic item) =>
      objetosAEntregarToRemove.add(item);
  void removeFromObjetosAEntregarToRemove(dynamic item) =>
      objetosAEntregarToRemove.remove(item);
  void removeAtIndexFromObjetosAEntregarToRemove(int index) =>
      objetosAEntregarToRemove.removeAt(index);
  void insertAtIndexInObjetosAEntregarToRemove(int index, dynamic item) =>
      objetosAEntregarToRemove.insert(index, item);
  void updateObjetosAEntregarToRemoveAtIndex(
          int index, Function(dynamic) updateFn) =>
      objetosAEntregarToRemove[index] =
          updateFn(objetosAEntregarToRemove[index]);

  List<DocumentReference> gruposParaLaActividad = [];
  void addToGruposParaLaActividad(DocumentReference item) =>
      gruposParaLaActividad.add(item);
  void removeFromGruposParaLaActividad(DocumentReference item) =>
      gruposParaLaActividad.remove(item);
  void removeAtIndexFromGruposParaLaActividad(int index) =>
      gruposParaLaActividad.removeAt(index);
  void insertAtIndexInGruposParaLaActividad(
          int index, DocumentReference item) =>
      gruposParaLaActividad.insert(index, item);
  void updateGruposParaLaActividadAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      gruposParaLaActividad[index] = updateFn(gruposParaLaActividad[index]);

  List<dynamic> imgsToSave = [];
  void addToImgsToSave(dynamic item) => imgsToSave.add(item);
  void removeFromImgsToSave(dynamic item) => imgsToSave.remove(item);
  void removeAtIndexFromImgsToSave(int index) => imgsToSave.removeAt(index);
  void insertAtIndexInImgsToSave(int index, dynamic item) =>
      imgsToSave.insert(index, item);
  void updateImgsToSaveAtIndex(int index, Function(dynamic) updateFn) =>
      imgsToSave[index] = updateFn(imgsToSave[index]);

  List<dynamic> imgsToRemove = [];
  void addToImgsToRemove(dynamic item) => imgsToRemove.add(item);
  void removeFromImgsToRemove(dynamic item) => imgsToRemove.remove(item);
  void removeAtIndexFromImgsToRemove(int index) => imgsToRemove.removeAt(index);
  void insertAtIndexInImgsToRemove(int index, dynamic item) =>
      imgsToRemove.insert(index, item);
  void updateImgsToRemoveAtIndex(int index, Function(dynamic) updateFn) =>
      imgsToRemove[index] = updateFn(imgsToRemove[index]);

  bool uploadingIMG = false;

  bool processingImgs = false;

  bool processingDeliverITems = false;

  List<String> accessToSave = [''];
  void addToAccessToSave(String item) => accessToSave.add(item);
  void removeFromAccessToSave(String item) => accessToSave.remove(item);
  void removeAtIndexFromAccessToSave(int index) => accessToSave.removeAt(index);
  void insertAtIndexInAccessToSave(int index, String item) =>
      accessToSave.insert(index, item);
  void updateAccessToSaveAtIndex(int index, Function(String) updateFn) =>
      accessToSave[index] = updateFn(accessToSave[index]);

  bool processingAccess = false;

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in FormActivity widget.
  List<TipoUsuarioRecord>? allTipoUsuarioResponse;
  // State field(s) for scrollColumn widget.
  ScrollController? scrollColumn;
  // State field(s) for RowChips widget.
  ScrollController? rowChips;
  // State field(s) for ChipsAcceso widget.
  FormFieldController<List<String>>? chipsAccesoValueController;
  List<String>? get chipsAccesoValues => chipsAccesoValueController?.value;
  set chipsAccesoValues(List<String>? val) =>
      chipsAccesoValueController?.value = val;
  // State field(s) for NombreTxt widget.
  FocusNode? nombreTxtFocusNode;
  TextEditingController? nombreTxtController;
  String? Function(BuildContext, String?)? nombreTxtControllerValidator;
  String? _nombreTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 5) {
      return 'Minimo de caracteres: 5.';
    }

    return null;
  }

  // State field(s) for DescripcionTxt widget.
  FocusNode? descripcionTxtFocusNode;
  TextEditingController? descripcionTxtController;
  String? Function(BuildContext, String?)? descripcionTxtControllerValidator;
  String? _descripcionTxtControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 7) {
      return 'Minimo de caracteres: 7.';
    }

    return null;
  }

  // State field(s) for OneDaySwitch widget.
  bool? oneDaySwitchValue;
  // State field(s) for fechaTxt widget.
  FocusNode? fechaTxtFocusNode;
  TextEditingController? fechaTxtController;
  final fechaTxtMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? fechaTxtControllerValidator;
  String? _fechaTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for hastaTxt widget.
  FocusNode? hastaTxtFocusNode;
  TextEditingController? hastaTxtController;
  final hastaTxtMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? hastaTxtControllerValidator;
  String? _hastaTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for freeSwitch widget.
  bool? freeSwitchValue;
  // State field(s) for CostoTxt widget.
  FocusNode? costoTxtFocusNode;
  TextEditingController? costoTxtController;
  String? Function(BuildContext, String?)? costoTxtControllerValidator;
  String? _costoTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    return null;
  }

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for CheckboxPortada widget.

  Map<dynamic, bool> checkboxPortadaValueMap = {};
  List<dynamic> get checkboxPortadaCheckedItems =>
      checkboxPortadaValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Custom Action - filterByKey] action in DeliverContainer widget.
  List<dynamic>? objetosAEntregarWithReference;
  // State field(s) for deliverSwitch widget.
  bool? deliverSwitchValue;
  // Stores action output result for [Custom Action - filterByKey] action in deliverSwitch widget.
  List<dynamic>? objetosAEntregarWithReferenceSwitch;
  // State field(s) for DeliverTipoUsuarioDD widget.
  String? deliverTipoUsuarioDDValue;
  FormFieldController<String>? deliverTipoUsuarioDDValueController;
  // Stores action output result for [Custom Action - arrayObjAEntregarHasTipoUsuario] action in DeliverTipoUsuarioDD widget.
  bool? isObjAlreadyIncluded;
  // Stores action output result for [Custom Action - getTipoUsuarioByDescripcion] action in DeliverTipoUsuarioDD widget.
  TipoUsuarioRecord? findTipoUsuarioResult;
  // State field(s) for DeliverCantTxt widget.
  FocusNode? deliverCantTxtFocusNode;
  TextEditingController? deliverCantTxtController;
  String? Function(BuildContext, String?)? deliverCantTxtControllerValidator;
  String? _deliverCantTxtControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '   ';
    }

    if (val.isEmpty) {
      return '    ';
    }

    return null;
  }

  // State field(s) for DeliverItemDD widget.
  String? deliverItemDDValue;
  FormFieldController<String>? deliverItemDDValueController;
  // Stores action output result for [Custom Action - getObjetoAEntregarByDescripcion] action in DeliverItemDD widget.
  ObjetoAEntregarRecord? findObjetoAEntregarResult;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Stores action output result for [Custom Action - filterByKey] action in Button widget.
  List<dynamic>? imgWithoutRefence;
  // Stores action output result for [Custom Action - createActivity] action in Button widget.
  FirestoreDefaultResponseStruct? activityCreatedResult;
  // Stores action output result for [Custom Action - editActivity] action in Button widget.
  FirestoreDefaultResponseStruct? editActivityResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    scrollColumn = ScrollController();
    rowChips = ScrollController();
    nombreTxtControllerValidator = _nombreTxtControllerValidator;
    descripcionTxtControllerValidator = _descripcionTxtControllerValidator;
    fechaTxtControllerValidator = _fechaTxtControllerValidator;
    hastaTxtControllerValidator = _hastaTxtControllerValidator;
    costoTxtControllerValidator = _costoTxtControllerValidator;
    listViewController1 = ScrollController();
    deliverCantTxtControllerValidator = _deliverCantTxtControllerValidator;
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    scrollColumn?.dispose();
    rowChips?.dispose();
    nombreTxtFocusNode?.dispose();
    nombreTxtController?.dispose();

    descripcionTxtFocusNode?.dispose();
    descripcionTxtController?.dispose();

    fechaTxtFocusNode?.dispose();
    fechaTxtController?.dispose();

    hastaTxtFocusNode?.dispose();
    hastaTxtController?.dispose();

    costoTxtFocusNode?.dispose();
    costoTxtController?.dispose();

    listViewController1?.dispose();
    deliverCantTxtFocusNode?.dispose();
    deliverCantTxtController?.dispose();

    listViewController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
