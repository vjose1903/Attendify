// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> arrayObjAEntregarHasTipoUsuario(
  String tipoUsuario,
  List<dynamic> array,
) async {
  // Add your function code here!

  if (array != null && array is List && array.length > 0) {
    for (var elemento in array) {
      if (elemento['tipo_usuario']['descripcion'] == tipoUsuario) {
        return true;
      }
    }
  }
  return false;
}
