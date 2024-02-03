import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  TipoDocumentoIdentidad? initialTipoDoc;

  String? initialValueDoc;

  DocumentReference? initialRefDoc;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in profile widget.
  DocumentoIdentidadRecord? findDocIdentidad;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in deleteAccount widget.
  String? passwordConfirm;
  // Stores action output result for [Custom Action - deleteAccount] action in deleteAccount widget.
  FirestoreDefaultResponseStruct? deleteAuthResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in deleteAccount widget.
  GrupoUsuarioRecord? deleteAccountGrupoUsuario;
  // Stores action output result for [Firestore Query - Query a collection] action in CancelBtn widget.
  DocumentoIdentidadRecord? findDocIdentidadCancel;
  // Stores action output result for [Firestore Query - Query a collection] action in SaveBtn widget.
  DocumentoIdentidadRecord? findDocIdentidadAceptar;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
