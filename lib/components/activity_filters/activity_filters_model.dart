import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'activity_filters_widget.dart' show ActivityFiltersWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ActivityFiltersModel extends FlutterFlowModel<ActivityFiltersWidget> {
  ///  Local state fields for this component.

  List<String> estadosSelected = ['Todos'];
  void addToEstadosSelected(String item) => estadosSelected.add(item);
  void removeFromEstadosSelected(String item) => estadosSelected.remove(item);
  void removeAtIndexFromEstadosSelected(int index) =>
      estadosSelected.removeAt(index);
  void insertAtIndexInEstadosSelected(int index, String item) =>
      estadosSelected.insert(index, item);
  void updateEstadosSelectedAtIndex(int index, Function(String) updateFn) =>
      estadosSelected[index] = updateFn(estadosSelected[index]);

  DateTime? desdeSelected;

  DateTime? hastaSelected;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChipsEstados widget.
  List<String>? chipsEstadosValues;
  FormFieldController<List<String>>? chipsEstadosValueController;
  // State field(s) for DesdeTxt widget.
  FocusNode? desdeTxtFocusNode;
  TextEditingController? desdeTxtController;
  final desdeTxtMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? desdeTxtControllerValidator;
  // State field(s) for HastaTxt widget.
  FocusNode? hastaTxtFocusNode;
  TextEditingController? hastaTxtController;
  final hastaTxtMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? hastaTxtControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    desdeTxtFocusNode?.dispose();
    desdeTxtController?.dispose();

    hastaTxtFocusNode?.dispose();
    hastaTxtController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
