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

Future<TipoUsuarioRecord?> getTipoUsuarioByDescripcion(
    String descripcion) async {
  // Add your function code here!

  CollectionReference tipoUsuarioCollection =
      FirebaseFirestore.instance.collection('tipo_usuario');

  QuerySnapshot querySnapshot = await tipoUsuarioCollection
      .where('descripcion', isEqualTo: descripcion)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    TipoUsuarioRecord tipoUsuario =
        TipoUsuarioRecord.fromSnapshot(querySnapshot.docs.first);

    return tipoUsuario;
  } else {
    print(
        "No se encontraron documentos en coleccionB con la descripción proporcionada.");
    return null;
  }
}
