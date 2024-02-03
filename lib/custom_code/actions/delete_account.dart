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
import 'dart:async';

Future<FirestoreDefaultResponseStruct> deleteAccount(
  String email,
  String password,
) async {
  // Add your function code here!
  try {
    Completer<FirestoreDefaultResponseStruct> completer =
        Completer<FirestoreDefaultResponseStruct>();

    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);

        try {
          await user.reauthenticateWithCredential(credential);
          await user.delete();

          completer.complete(Response("", false));
        } catch (e) {
          completer.complete(Response(
              'Las credenciales proporcionadas son incorrectas.',
              true)); // Resuelve el completer con error
        }
      }
    });

    return await completer.future;
  } catch (e) {
    return Response("Algo salio mal, vuelvalo a intentar mas tarde.", true);
  }
}

FirestoreDefaultResponseStruct Response(String message, bool error) {
  FirestoreDefaultResponseStruct resultado = FirestoreDefaultResponseStruct();

  resultado.message = message;
  resultado.error = error;

  return resultado;
}
