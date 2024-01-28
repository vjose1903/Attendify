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

import 'package:firebase_storage/firebase_storage.dart';

Future<FirestoreDefaultResponseStruct> deleteActividad(
  List<GrupoActividadDetalleRecord> grupoActividadDetalles,
  ActividadRecord actividad,
  GrupoActividadRecord grupoActividad,
  List<ActividadImagenesRecord> imagenes,
) async {
  // Add your function code here!
  try {
    actividad.reference.delete();
    grupoActividad.reference.delete();

    // ACTIVIDAD IMG ----------------------------------------------------------------------------------------
    final storageRef = FirebaseStorage.instance.ref();

    for (var imagen in imagenes) {
      final image = storageRef.child(imagen.imgPath);
      await image.delete();

      imagen.reference.delete();
    }

    // DETALLES -----------------------------------------------------------------------------------
    for (var detalle in grupoActividadDetalles) {
      CollectionReference accesoActividadCollection =
          detalle.reference.collection('acceso');
      QuerySnapshot accessSnapshot = await accesoActividadCollection.get();

      for (QueryDocumentSnapshot<Object?> acceso in accessSnapshot.docs) {
        await acceso.reference.delete();
      }

      CollectionReference actividadObjetosEntregarCollection =
          detalle.reference.collection('actividad_objeto_a_entregar');
      QuerySnapshot deliverItemSnapshot =
          await actividadObjetosEntregarCollection.get();

      for (QueryDocumentSnapshot<Object?> deliveItem
          in deliverItemSnapshot.docs) {
        await deliveItem.reference.delete();
      }

      detalle.reference.delete();
    }
    return Response('', false);
  } catch (e) {
    return Response(e.toString(), true);
  }
}

FirestoreDefaultResponseStruct Response(String message, bool error) {
  FirestoreDefaultResponseStruct resultado = FirestoreDefaultResponseStruct();

  resultado.message = message;
  resultado.error = error;

  return resultado;
}
