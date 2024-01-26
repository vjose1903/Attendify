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

Future setTiposUsuariosReferences() async {
  // USUARIO REGULAR --------------------------------------------------------------------------------
  TipoUsuarioRecord? usuarioRegular =
      await getTipoUsuarioByDescripcion('Usuario regular');

  if (usuarioRegular != null)
    FFAppState().TUsuarioRegular = usuarioRegular.reference;

// ADMINISRTRADOR --------------------------------------------------------------------------------
  TipoUsuarioRecord? administrador =
      await getTipoUsuarioByDescripcion('Administrador');
  if (administrador != null)
    FFAppState().TAdministrador = administrador.reference;

// MIEMBRO ACTIVO --------------------------------------------------------------------------------
  TipoUsuarioRecord? miembroActivo =
      await getTipoUsuarioByDescripcion('Miembro activo');
  if (miembroActivo != null)
    FFAppState().TMiembroActivo = miembroActivo.reference;

// MIEMBRO --------------------------------------------------------------------------------
  TipoUsuarioRecord? miembro = await getTipoUsuarioByDescripcion('Miembro');
  if (miembro != null) FFAppState().TMiembro = miembro.reference;
}
