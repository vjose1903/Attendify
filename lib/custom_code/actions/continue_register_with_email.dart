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

Future<bool> continueRegisterWithEmail(
  String userUid,
  String email,
) async {
  try {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Usuarios');

    final userData = {
      'email': email,
      'uid': userUid,
      'created_time': DateTime.now()
    };

    print("userData ${userData}");

    await usersCollection.doc(userUid).set(userData);

    return true;
  } catch (e) {
    print("e");
    print(e);
    print(e.toString());

    return false;
  }
}
