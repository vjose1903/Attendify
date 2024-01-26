// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthResponseStruct extends FFFirebaseStruct {
  AuthResponseStruct({
    String? message,
    bool? error,
    String? userUid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _error = error,
        _userUid = userUid,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "error" field.
  bool? _error;
  bool get error => _error ?? false;
  set error(bool? val) => _error = val;
  bool hasError() => _error != null;

  // "userUid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  set userUid(String? val) => _userUid = val;
  bool hasUserUid() => _userUid != null;

  static AuthResponseStruct fromMap(Map<String, dynamic> data) =>
      AuthResponseStruct(
        message: data['message'] as String?,
        error: data['error'] as bool?,
        userUid: data['userUid'] as String?,
      );

  static AuthResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'error': _error,
        'userUid': _userUid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.bool,
        ),
        'userUid': serializeParam(
          _userUid,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthResponseStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.bool,
          false,
        ),
        userUid: deserializeParam(
          data['userUid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthResponseStruct &&
        message == other.message &&
        error == other.error &&
        userUid == other.userUid;
  }

  @override
  int get hashCode => const ListEquality().hash([message, error, userUid]);
}

AuthResponseStruct createAuthResponseStruct({
  String? message,
  bool? error,
  String? userUid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthResponseStruct(
      message: message,
      error: error,
      userUid: userUid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthResponseStruct? updateAuthResponseStruct(
  AuthResponseStruct? authResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthResponseStructData(
  Map<String, dynamic> firestoreData,
  AuthResponseStruct? authResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authResponse == null) {
    return;
  }
  if (authResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authResponseData =
      getAuthResponseFirestoreData(authResponse, forFieldValue);
  final nestedData =
      authResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthResponseFirestoreData(
  AuthResponseStruct? authResponse, [
  bool forFieldValue = false,
]) {
  if (authResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authResponse.toMap());

  // Add any Firestore field values
  authResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthResponseListFirestoreData(
  List<AuthResponseStruct>? authResponses,
) =>
    authResponses?.map((e) => getAuthResponseFirestoreData(e, true)).toList() ??
    [];
