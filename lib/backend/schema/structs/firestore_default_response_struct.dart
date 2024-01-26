// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirestoreDefaultResponseStruct extends FFFirebaseStruct {
  FirestoreDefaultResponseStruct({
    String? message,
    bool? error,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _error = error,
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

  static FirestoreDefaultResponseStruct fromMap(Map<String, dynamic> data) =>
      FirestoreDefaultResponseStruct(
        message: data['message'] as String?,
        error: data['error'] as bool?,
      );

  static FirestoreDefaultResponseStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FirestoreDefaultResponseStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'error': _error,
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
      }.withoutNulls;

  static FirestoreDefaultResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FirestoreDefaultResponseStruct(
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
      );

  @override
  String toString() => 'FirestoreDefaultResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FirestoreDefaultResponseStruct &&
        message == other.message &&
        error == other.error;
  }

  @override
  int get hashCode => const ListEquality().hash([message, error]);
}

FirestoreDefaultResponseStruct createFirestoreDefaultResponseStruct({
  String? message,
  bool? error,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FirestoreDefaultResponseStruct(
      message: message,
      error: error,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FirestoreDefaultResponseStruct? updateFirestoreDefaultResponseStruct(
  FirestoreDefaultResponseStruct? firestoreDefaultResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    firestoreDefaultResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFirestoreDefaultResponseStructData(
  Map<String, dynamic> firestoreData,
  FirestoreDefaultResponseStruct? firestoreDefaultResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (firestoreDefaultResponse == null) {
    return;
  }
  if (firestoreDefaultResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      firestoreDefaultResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final firestoreDefaultResponseData = getFirestoreDefaultResponseFirestoreData(
      firestoreDefaultResponse, forFieldValue);
  final nestedData =
      firestoreDefaultResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      firestoreDefaultResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFirestoreDefaultResponseFirestoreData(
  FirestoreDefaultResponseStruct? firestoreDefaultResponse, [
  bool forFieldValue = false,
]) {
  if (firestoreDefaultResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(firestoreDefaultResponse.toMap());

  // Add any Firestore field values
  firestoreDefaultResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFirestoreDefaultResponseListFirestoreData(
  List<FirestoreDefaultResponseStruct>? firestoreDefaultResponses,
) =>
    firestoreDefaultResponses
        ?.map((e) => getFirestoreDefaultResponseFirestoreData(e, true))
        .toList() ??
    [];
