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

Future<bool> grupoUsuarioDBAction(
  DocumentReference usuarioReference,
  DocumentReference grupoReference,
  String type,
) async {
  CollectionReference grupoUsuarioCollection =
      FirebaseFirestore.instance.collection('grupo_usuario');

  grupoUsuarioCollection
      .where("usuario", isEqualTo: usuarioReference)
      .where("grupo", isEqualTo: grupoReference)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.docs.isNotEmpty) {
      // Grupo Usuario Existe
      print("El documento existe en la base de datos");
      var grupo_usuario = querySnapshot.docs.first;
      print("Document data: ${grupo_usuario.data()}");

      if (type == 'remove') {
        print("procediendo a removerlo");

        grupo_usuario.reference.delete().then((_) {
          return true;
        }).catchError((error) {
          return false;
        });
      } else {
        return true;
      }
    } else {
      // Grupo Usuario No existe

      if (type == 'add') {
        TipoUsuarioRecord? usuarioRegular =
            await getTipoUsuarioByDescripcion('Usuario regular');

        if (usuarioRegular != null) {
          String qrLabel =
              await createQrLabel(usuarioReference, grupoReference);

          grupoUsuarioCollection.add({
            'usuario': usuarioReference,
            'grupo': grupoReference,
            'tipo_usuario': usuarioRegular.reference,
            'created_time': DateTime.now(),
            'qr': qrLabel
          }).then((value) async {
            return true;
          }).catchError((error) {
            print("Error: $error");
            return false;
          });
        } else {
          return false;
        }
      } else {
        return true;
      }
    }
  });

  return true;
}
