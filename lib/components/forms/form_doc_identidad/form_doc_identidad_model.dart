import '/backend/backend.dart';
import '/components/forms/form_documento_identidad/form_documento_identidad_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_doc_identidad_widget.dart' show FormDocIdentidadWidget;
import 'package:flutter/material.dart';

class FormDocIdentidadModel extends FlutterFlowModel<FormDocIdentidadWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for formDocumentoIdentidad component.
  late FormDocumentoIdentidadModel formDocumentoIdentidadModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentoIdentidadRecord? createDocumentResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    formDocumentoIdentidadModel =
        createModel(context, () => FormDocumentoIdentidadModel());
  }

  @override
  void dispose() {
    formDocumentoIdentidadModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
