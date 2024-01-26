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

Future<ObjetoAEntregarRecord?> getObjetoAEntregarByDescripcion(
  String descripcion,
  DocumentReference grupoRef,
) async {
  // Add your function code here!

  CollectionReference objDeliverCollection =
      FirebaseFirestore.instance.collection('objeto_a_entregar');

  QuerySnapshot querySnapshot = await objDeliverCollection
      .where('descripcion', isEqualTo: descripcion)
      .where('grupo', isEqualTo: grupoRef)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    ObjetoAEntregarRecord obj =
        ObjetoAEntregarRecord.fromSnapshot(querySnapshot.docs.first);

    return obj;
  } else {
    print(
        "No se encontraron documentos en objeto a entregar con la descripción proporcionada.");
    return null;
  }
}
