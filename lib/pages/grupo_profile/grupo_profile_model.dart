import '/flutter_flow/flutter_flow_util.dart';
import 'grupo_profile_widget.dart' show GrupoProfileWidget;
import 'package:flutter/material.dart';

class GrupoProfileModel extends FlutterFlowModel<GrupoProfileWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NombreField widget.
  FocusNode? nombreFieldFocusNode;
  TextEditingController? nombreFieldController;
  String? Function(BuildContext, String?)? nombreFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreFieldFocusNode?.dispose();
    nombreFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
