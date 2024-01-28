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

Future<FirestoreDefaultResponseStruct> editActivity(
  String nombre,
  String descripcion,
  double costo,
  bool hasDeliverItems,
  List<dynamic> objetosAEntregar,
  List<DocumentReference> grupos,
  List<dynamic> imagenes,
  List<String> accesoPermitido,
  List<dynamic> imagenesToDelete,
  List<dynamic> objetosAEntregarToDelete,
  DocumentReference activityReference,
  DocumentReference grupoActividadReference,
  List<DocumentReference> grupoActividadDetalle,
) async {
  // Add your function code here!
  if (imagenes.isEmpty) {
    return Response("Debe selecciar almenos una imagen.", true);
  }
  List<String> listAccesoPermitido =
      accesoPermitido.where((item) => item != '' && item.isNotEmpty).toList();

  if (listAccesoPermitido.isEmpty) {
    return Response(
        "Debe selecciar almenos un tipo de usuario para acceder.", true);
  }

  List<dynamic> portada =
      imagenes.where((img) => img['isPortada'] == true).toList();

  if (portada.isEmpty) {
    return Response(
        "Debe selecciar almenos una foto como portada de la actividad.", true);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.runTransaction((Transaction transaction) async {
      // ACTIVIDAD ----------------------------------------------------------------------------------------------
      CollectionReference actividadCollection =
          FirebaseFirestore.instance.collection('actividad');

      final activityData = {
        'nombre': nombre,
        'descripcion': descripcion,
        'costo': costo
      };

      await actividadCollection.doc(activityReference.id).update(activityData);

      // GRUPO ACTIVIDAD --------------------------------------------------------------------------------------
      CollectionReference grupoActividadCollection =
          FirebaseFirestore.instance.collection('grupo_actividad');

      final grupoActivityData = {'actividad_name': nombre};

      await grupoActividadCollection
          .doc(grupoActividadReference.id)
          .update(grupoActivityData);

      // ACTIVIDAD IMG ----------------------------------------------------------------------------------------
      CollectionReference imagenActividadCollection =
          FirebaseFirestore.instance.collection('actividad_imagenes');

      for (var currentImg in imagenes) {
        final imgData = {
          'imgPath': currentImg['imgPath'],
          'imgBlurPath': currentImg['imgBlurPath'],
          'isPortada': currentImg['isPortada']
        };

        if (!currentImg.containsKey('reference') ||
            currentImg['reference'] == null) {
          imgData['actividad'] = activityReference;

          await imagenActividadCollection.add(imgData);
        } else {
          await imagenActividadCollection
              .doc(currentImg['reference'].id)
              .update(imgData);
        }
      }

      // TO DELETE -----------------------------------------------------------------
      final storageRef = FirebaseStorage.instance.ref();

      for (var currentImgToDelete in imagenesToDelete) {
        final image = storageRef.child(currentImgToDelete['imgPath']);
        await image.delete();

        await imagenActividadCollection
            .doc(currentImgToDelete['reference'].id)
            .delete();
      }

      // GRUPO ACTIVIDAD DETALLES  ----------------------------------------------------------------------------------

      for (var detalle in grupoActividadDetalle) {
        // ACCESO  --------------------------------------------------------------------------------------------------

        CollectionReference accesoActividadCollection =
            detalle.collection('acceso');

        QuerySnapshot accessoSnapshot = await accesoActividadCollection.get();
        // DELETE OLD ------------------------------------------------------------
        for (QueryDocumentSnapshot<Object?> accesoDocument
            in accessoSnapshot.docs) {
          await accesoDocument.reference.delete();
        }

        for (var currentAcceso in listAccesoPermitido) {
          if (currentAcceso.isNotEmpty && currentAcceso != '') {
            TipoUsuarioRecord? tipoUsuario =
                await getTipoUsuarioByDescripcion(currentAcceso);

            if (tipoUsuario != null) {
              accesoActividadCollection.add({
                'tipo_usuario': tipoUsuario.reference,
                'grupo': FFAppState().grupoSeleccionado,
                'tipo_usuario_label': tipoUsuario.descripcion
              });
            }
          }
        }

        // ACTIVIDAD OBJETO A ENTREGAR  -----------------------------------------------------------------------
        CollectionReference actividadObjetosEntregarCollection =
            detalle.collection('actividad_objeto_a_entregar');

        if (hasDeliverItems) {
          for (var currentDeliveryItem in objetosAEntregar) {
            final deliverItemData = {
              'tipo_usuario': currentDeliveryItem['tipo_usuario']['reference'],
              'objeto_a_entregar': currentDeliveryItem['objeto_a_entregar']
                  ['reference'],
              'cantidad': double.parse("${currentDeliveryItem['cantidad']}"),
              'tipo_usuario_label': currentDeliveryItem['tipo_usuario']
                  ['descripcion'],
              'objeto_a_entregar_label':
                  currentDeliveryItem['objeto_a_entregar']['descripcion'],
            };

            if (!currentDeliveryItem.containsKey('reference') ||
                currentDeliveryItem['reference'] == null) {
              deliverItemData['grupo_actividad'] = grupoActividadReference;
              deliverItemData['grupo'] = FFAppState().grupoSeleccionado;
              await actividadObjetosEntregarCollection.add(deliverItemData);
            } else {
              await actividadObjetosEntregarCollection
                  .doc(currentDeliveryItem['reference'].id)
                  .update(deliverItemData);
            }
          }
        }

        // TO DELETE -----------------------------------------------------------------
        for (var currentDeliveryItemToDelete in objetosAEntregarToDelete) {
          await actividadObjetosEntregarCollection
              .doc(currentDeliveryItemToDelete['reference'].id)
              .delete();
        }
      }
    });

    return Response("", false);
  } catch (e) {
    print("e");
    print(e);
    print(e.toString());

    return Response(e.toString(), true);
  }
}

FirestoreDefaultResponseStruct Response(String message, bool error) {
  FirestoreDefaultResponseStruct resultado = FirestoreDefaultResponseStruct();

  resultado.message = message;
  resultado.error = error;

  return resultado;
}
