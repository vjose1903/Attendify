import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? parseDateStringToDateTime(String? dateString) {
  if (dateString == null || dateString == '') return null;
  // Define el formato esperado de la cadena de fecha
  DateFormat formatoFecha = DateFormat('dd/MM/yyyy');

  try {
    // Intenta analizar la cadena de fecha en un objeto DateTime
    DateTime fecha = formatoFecha.parse(dateString);
    return fecha;
  } catch (e) {
    print('Error al parsear la fecha: $e');
    return null;
  }
}

DateTime toInitDayHour(DateTime date) {
  return DateTime(date.year, date.month, date.day, 0, 0, 0);
}

bool stringInclude(
  String targetString,
  List<String> includes,
) {
  for (var include in includes) {
    if (!targetString.contains(include)) return false;
  }

  return true;
}

bool activityAccessIncludeUser(
  DocumentReference grupoUsuarioFund,
  List<DocumentReference> access,
) {
  return access.contains(grupoUsuarioFund);
}

ObjetoAEntregarStruct parseObjetoAEntregarDataType(dynamic json) {
  ObjetoAEntregarStruct obj = ObjetoAEntregarStruct();
  obj.cantidadMaxima = double.parse("${json['cantidadMaxima']}");
  obj.objetoAEntregar = json['objetoAEntregar'];
  obj.objetoAEntregarLabel = json['objetoAEntregarLabel'];
  obj.cantidadAEntregar = double.parse("${json['cantidadAEntregar']}");
  obj.actividadObjetoAEntregar = json['actividadObjetoAEntregar'];

  if (json['objetoEntregadoReference'] != null &&
      json['objetoEntregadoReference'] != "") {
    obj.objetoEntregadoReference = json['objetoEntregadoReference'];
  }

  return obj;
}

FirestoreDefaultResponseStruct evaluateObjetosAEntregar(
    List<dynamic> objetosAEntregar) {
  FirestoreDefaultResponseStruct response = FirestoreDefaultResponseStruct();
  response.error = false;
  response.message = "";

  for (var index = 0; index < objetosAEntregar.length; index++) {
    dynamic obj = objetosAEntregar[index];

    ObjetoAEntregarStruct objParsed = ObjetoAEntregarStruct.fromMap(obj);

    // ignore: unnecessary_null_comparison
    if (objParsed.cantidadAEntregar != null &&
        objParsed.cantidadAEntregar > 0 &&
        objParsed.cantidadAEntregar != "") {
      if (objParsed.cantidadAEntregar > objParsed.cantidadMaxima) {
        response.error = true;
        response.message =
            'La cantidad maxima de ${objParsed.objetoAEntregarLabel} son: ${objParsed.cantidadMaxima}';
        return response;
      }
    }
  }

  return response;
}

double addReduceNumber(
  double target,
  MathAction type,
  double baseAdd,
) {
  if (type == MathAction.substract) {
    return target -= baseAdd;
  }

  if (type == MathAction.add) {
    return target += baseAdd;
  }

  return target;
}

double parseDouble(String number) {
  return double.parse(number);
}

DateTime addDays(int cantidadDias) {
  return DateTime.now().add(Duration(days: cantidadDias));
}
