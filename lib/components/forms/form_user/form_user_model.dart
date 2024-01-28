import '/backend/backend.dart';
import '/components/forms/form_documento_identidad/form_documento_identidad_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_user_widget.dart' show FormUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormUserModel extends FlutterFlowModel<FormUserWidget> {
  ///  Local state fields for this component.

  DocumentReference? tipoUsuarioSelected;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TipoUsuarioDD widget.
  String? tipoUsuarioDDValue;
  FormFieldController<String>? tipoUsuarioDDValueController;
  // Stores action output result for [Custom Action - getTipoUsuarioByDescripcion] action in TipoUsuarioDD widget.
  TipoUsuarioRecord? findTipoUsuarioResult;
  // State field(s) for DisplayNameTxt widget.
  FocusNode? displayNameTxtFocusNode;
  TextEditingController? displayNameTxtController;
  String? Function(BuildContext, String?)? displayNameTxtControllerValidator;
  String? _displayNameTxtControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (val.length < 3) {
      return 'Cantidad minima de caracrteres 2.';
    }

    return null;
  }

  // Model for formDocumentoIdentidad component.
  late FormDocumentoIdentidadModel formDocumentoIdentidadModel;
  // State field(s) for EmailTxt widget.
  FocusNode? emailTxtFocusNode;
  TextEditingController? emailTxtController;
  String? Function(BuildContext, String?)? emailTxtControllerValidator;
  String? _emailTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Formato de email invalido.';
    }
    return null;
  }

  // State field(s) for PhoneTxt widget.
  FocusNode? phoneTxtFocusNode;
  TextEditingController? phoneTxtController;
  final phoneTxtMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneTxtControllerValidator;
  String? _phoneTxtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido.';
    }

    if (!RegExp('^\\(\\d{3}\\) \\d{3}-\\d{4}\$').hasMatch(val)) {
      return 'Formatio de telefono invalido.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentoIdentidadRecord? createDocumentResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    displayNameTxtControllerValidator = _displayNameTxtControllerValidator;
    formDocumentoIdentidadModel =
        createModel(context, () => FormDocumentoIdentidadModel());
    emailTxtControllerValidator = _emailTxtControllerValidator;
    phoneTxtControllerValidator = _phoneTxtControllerValidator;
  }

  @override
  void dispose() {
    displayNameTxtFocusNode?.dispose();
    displayNameTxtController?.dispose();

    formDocumentoIdentidadModel.dispose();
    emailTxtFocusNode?.dispose();
    emailTxtController?.dispose();

    phoneTxtFocusNode?.dispose();
    phoneTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
