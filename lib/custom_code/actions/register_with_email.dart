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

Future<AuthResponseStruct> registerWithEmail(
    String email, String password, String confirmPassword) async {
  if (password != confirmPassword)
    return RegisterResult("Las contraseñas no coinciden", true);
  print("Las contraseñas coinciden");

  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return RegisterResult("Registro Completo", false, credential.user?.uid);
  } on FirebaseAuthException catch (e) {
    String messaje = '';

    if (e.code == 'weak-password')
      messaje = 'La contraseña utilizada es muy débil.';
    else if (e.code == 'email-already-in-use')
      messaje = 'Ya existe una cuenta con el email proporcionado.';
    else if (e.code == 'invalid-email')
      messaje = 'El email proporcionado es invalido.';
    else
      messaje = 'Error Desconocido.';

    return RegisterResult(messaje, true);
  } catch (e) {
    return RegisterResult(
        "Error registrando usuario, vuelva a intentarlo", true);
  }
}

AuthResponseStruct RegisterResult(String message, bool error,
    [String? userUid]) {
  AuthResponseStruct resultado = AuthResponseStruct();

  resultado.userUid = userUid;
  resultado.message = message;
  resultado.error = error;

  print("resultado --> ${resultado.toString()}");

  return resultado;
}
