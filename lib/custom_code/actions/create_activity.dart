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

Future<FirestoreDefaultResponseStruct> createActivity(
  String nombre,
  String descripcion,
  DateTime fecha,
  DateTime hasta,
  double costo,
  bool hasDeliverItems,
  List<dynamic> objetosAEntregar,
  List<DocumentReference> grupos,
  List<dynamic> imagenes,
  List<String> accesoPermitido,
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

  if (fecha.isAfter(hasta)) {
    return Response("La fecha de inicio debe de ser menor a la de fin.", true);
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
        'comentario': null,
        'fecha_inicio': fecha,
        'fecha_fin': hasta,
        'costo': costo,
        'estado': 'No Iniciado',
        'created_time': DateTime.now()
      };

      DocumentReference newActivity =
          await actividadCollection.add(activityData);

      // GRUPO ACTIVIDAD ----------------------------------------------------------------------------------------
      CollectionReference grupoActividadCollection =
          FirebaseFirestore.instance.collection('grupo_actividad');

      final grupoActivityData = {
        'actividad': newActivity,
        'actividad_name': nombre,
        'grupos': grupos,
        'fecha_inicio': fecha,
        'fecha_fin': hasta,
      };

      DocumentReference newGroupActivity =
          await grupoActividadCollection.add(grupoActivityData);

      // ACTIVIDAD IMG ----------------------------------------------------------------------------------------
      CollectionReference imagenActividadCollection =
          FirebaseFirestore.instance.collection('actividad_imagenes');

      for (var currentImg in imagenes) {
        final imgData = {
          'actividad': newActivity,
          'imgPath': currentImg['imgPath'],
          'imgBlurPath': currentImg['imgBlurPath'],
          'isPortada': currentImg['isPortada'],
          'type': 'info'
        };

        await imagenActividadCollection.add(imgData);
      }
      // DETALLE GRUPO ACTIVIDAD  ---------------------------------------------------------------------------
      CollectionReference grupoActividadDetalleCollection =
          FirebaseFirestore.instance.collection('grupo_actividad_detalle');

      List<DateTime> fechasIntermedias = [];

      for (DateTime fechaActual = fecha;
          fechaActual.isBefore(hasta) || fechaActual.isAtSameMomentAs(hasta);
          fechaActual = fechaActual.add(Duration(days: 1))) {
        if (!fechasIntermedias.contains(fechaActual)) {
          fechasIntermedias.add(fechaActual);

          final grupoActividadDetalleData = {
            'grupo_actividad': newGroupActivity,
            'grupo': FFAppState().grupoSeleccionado,
            'fecha': fechaActual,
          };

          DocumentReference newGrupoActividadDetalle =
              await grupoActividadDetalleCollection
                  .add(grupoActividadDetalleData);

          // ACCESO  ---------------------------------------------------------------------------

          CollectionReference accesoActividadCollection =
              newGrupoActividadDetalle.collection('acceso');

          for (var currentAcceso in listAccesoPermitido) {
            if (currentAcceso.isNotEmpty && currentAcceso != '') {
              TipoUsuarioRecord? tipoUsuario =
                  await getTipoUsuarioByDescripcion(currentAcceso);

              if (tipoUsuario != null) {
                accesoActividadCollection.add({
                  'tipo_usuario': tipoUsuario.reference,
                  'fecha': fechaActual,
                  'grupo': FFAppState().grupoSeleccionado,
                  'tipo_usuario_label': tipoUsuario.descripcion
                });
              }
            }
          }

          //  OBJETO A ENTREGAR  -----------------------------------------------------------------------
          if (hasDeliverItems) {
            CollectionReference actividadObjetosEntregarCollection =
                newGrupoActividadDetalle
                    .collection('actividad_objeto_a_entregar');

            for (var currentDeliveryItem in objetosAEntregar) {
              final deliverItemData = {
                'tipo_usuario': currentDeliveryItem['tipo_usuario']
                    ['reference'],
                'grupo_actividad': newGroupActivity,
                'objeto_a_entregar': currentDeliveryItem['objeto_a_entregar']
                    ['reference'],
                'cantidad': double.parse("${currentDeliveryItem['cantidad']}"),
                'tipo_usuario_label': currentDeliveryItem['tipo_usuario']
                    ['descripcion'],
                'objeto_a_entregar_label':
                    currentDeliveryItem['objeto_a_entregar']['descripcion'],
                'grupo': FFAppState().grupoSeleccionado
              };
              await actividadObjetosEntregarCollection.add(deliverItemData);
            }
          }
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
