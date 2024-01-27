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

Future<dynamic> updateObjetoAEntregarJson(
  dynamic objJson,
  dynamic changes,
) async {
  // Add your function code here!

  if (changes.containsKey('cantidadAEntregar'))
    objJson['cantidadAEntregar'] = changes['cantidadAEntregar'] != null &&
            changes['cantidadAEntregar'] != ""
        ? double.parse("${changes['cantidadAEntregar']}")
        : 0;

  return objJson;
}
