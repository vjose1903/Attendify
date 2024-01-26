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

DateTime? parseDateStringToDateTime(String dateString) {
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
