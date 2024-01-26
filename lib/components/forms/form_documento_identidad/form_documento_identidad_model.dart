import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_documento_identidad_widget.dart' show FormDocumentoIdentidadWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormDocumentoIdentidadModel
    extends FlutterFlowModel<FormDocumentoIdentidadWidget> {
  ///  Local state fields for this component.

  TipoDocumentoIdentidad? currentTipoDoc;

  int? currentValueTipoDoc;

  DocumentReference? documentoIdentidadParam;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TipoDocDD widget.
  int? tipoDocDDValue;
  FormFieldController<int>? tipoDocDDValueController;
  // State field(s) for CedulaTxt widget.
  FocusNode? cedulaTxtFocusNode;
  TextEditingController? cedulaTxtController;
  final cedulaTxtMask = MaskTextInputFormatter(mask: '###-#######-#');
  String? Function(BuildContext, String?)? cedulaTxtControllerValidator;
  // State field(s) for RncTxt widget.
  FocusNode? rncTxtFocusNode;
  TextEditingController? rncTxtController;
  final rncTxtMask = MaskTextInputFormatter(mask: '###-######-#');
  String? Function(BuildContext, String?)? rncTxtControllerValidator;
  // State field(s) for PasaporteTxt widget.
  FocusNode? pasaporteTxtFocusNode;
  TextEditingController? pasaporteTxtController;
  String? Function(BuildContext, String?)? pasaporteTxtControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cedulaTxtFocusNode?.dispose();
    cedulaTxtController?.dispose();

    rncTxtFocusNode?.dispose();
    rncTxtController?.dispose();

    pasaporteTxtFocusNode?.dispose();
    pasaporteTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
