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

import 'package:firebase_auth/firebase_auth.dart';

Future<AuthResponseStruct> loginWithEmail(
  String email,
  String password,
) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return LoginResult("", false);
  } on FirebaseAuthException catch (e) {
    // Manejar errores específicos de Firebase Authentication
    String messaje = '';

    if (e.code == 'invalid-email')
      messaje = 'El email proporcionado es invalido.';
    else if (e.code == 'invalid-credential')
      messaje = 'Las credenciales proporcionadas son incorrectas.';
    else
      messaje = 'Error Desconocido.';

    return LoginResult(messaje, true);
  } catch (e) {
    // Manejar otros errores

    return LoginResult(e.toString(), true);
  }
}

AuthResponseStruct LoginResult(String message, bool error, [String? userUid]) {
  AuthResponseStruct resultado = AuthResponseStruct();

  resultado.userUid = userUid;
  resultado.message = message;
  resultado.error = error;

  return resultado;
}
