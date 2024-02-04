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

Future<dynamic> getProximasActividades(
  DocumentReference tipoUsuario,
  DocumentReference grupo,
) async {
  // Add your function code here!

  DateTime fechaActual = DateTime.now();
  DateTime fechaLimite = fechaActual.add(Duration(days: 7));

  CollectionReference grupoActividadCollection =
      FirebaseFirestore.instance.collection('grupo_actividad');
  CollectionReference grupoActividadDetalleCollection =
      FirebaseFirestore.instance.collection('grupo_actividad_detalle');

  QuerySnapshot grupoActividadSnapshot = await grupoActividadCollection
      .where('fecha_fin', isGreaterThanOrEqualTo: toInitDayHour(fechaActual))
      .where('grupos', arrayContains: grupo)
      .orderBy('fecha_fin', descending: true)
      .get();

  List<DocumentSnapshot> sortedDocs = grupoActividadSnapshot.docs;

  // Ordenar los documentos por fecha_inicio de manera ascendente
  sortedDocs.sort((a, b) {
    DateTime fechaInicioA = a['fecha_inicio'].toDate();
    DateTime fechaInicioB = b['fecha_inicio'].toDate();
    return fechaInicioA.compareTo(fechaInicioB);
  });

  List<dynamic> primeras5Actividades = [];
  List<dynamic> todasLasActividades = [];

  for (DocumentSnapshot grupoActividadDoc in sortedDocs) {
    QuerySnapshot detalleActividadSnapshot =
        await grupoActividadDetalleCollection
            .where('grupo_actividad', isEqualTo: grupoActividadDoc.reference)
            .get();

    List<DocumentSnapshot> sortedDetalles = detalleActividadSnapshot.docs;

    // Ordenar los documentos por fecha_inicio de manera ascendente
    sortedDetalles.sort((a, b) {
      DateTime fechaA = a['fecha'].toDate();
      DateTime fechaB = b['fecha'].toDate();
      return fechaA.compareTo(fechaB);
    });

    for (DocumentSnapshot detalleActividadDoc in sortedDetalles) {
      DateTime fechaActividad = detalleActividadDoc['fecha'].toDate();

      QuerySnapshot accesoSnapshot = await detalleActividadDoc.reference
          .collection('acceso')
          .where('tipo_usuario', isEqualTo: tipoUsuario)
          .get();

      if (accesoSnapshot.docs.isNotEmpty) {
        if (primeras5Actividades.length < 5 &&
                fechaActividad.isAtSameMomentAs(toInitDayHour(fechaActual)) ||
            (fechaActividad.isAfter(toInitDayHour(fechaActual)) &&
                fechaActividad.isBefore(toInitDayHour(fechaLimite)))) {
          //
          primeras5Actividades.add({
            'actividad': grupoActividadDoc['actividad'],
            'fecha_inicio': grupoActividadDoc['fecha_inicio'].toDate(),
            'index': primeras5Actividades.length + 1
          });
        } else {
          todasLasActividades.add({
            'actividad': grupoActividadDoc['actividad'],
            'fecha_inicio': grupoActividadDoc['fecha_inicio'].toDate(),
            'index': primeras5Actividades.length + 1
          });
        }

        break;
      }
    }
  }

  return {
    'primeras5Actividades': primeras5Actividades,
    'todasLasActividades': todasLasActividades
  };
}
