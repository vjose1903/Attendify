// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrupoActividadHomeStruct extends FFFirebaseStruct {
  GrupoActividadHomeStruct({
    DocumentReference? actividad,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _actividad = actividad,
        _index = index,
        super(firestoreUtilData);

  // "actividad" field.
  DocumentReference? _actividad;
  DocumentReference? get actividad => _actividad;
  set actividad(DocumentReference? val) => _actividad = val;
  bool hasActividad() => _actividad != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static GrupoActividadHomeStruct fromMap(Map<String, dynamic> data) =>
      GrupoActividadHomeStruct(
        actividad: data['actividad'] as DocumentReference?,
        index: castToType<int>(data['index']),
      );

  static GrupoActividadHomeStruct? maybeFromMap(dynamic data) => data is Map
      ? GrupoActividadHomeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'actividad': _actividad,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'actividad': serializeParam(
          _actividad,
          ParamType.DocumentReference,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static GrupoActividadHomeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GrupoActividadHomeStruct(
        actividad: deserializeParam(
          data['actividad'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['actividad'],
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GrupoActividadHomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrupoActividadHomeStruct &&
        actividad == other.actividad &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([actividad, index]);
}

GrupoActividadHomeStruct createGrupoActividadHomeStruct({
  DocumentReference? actividad,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GrupoActividadHomeStruct(
      actividad: actividad,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GrupoActividadHomeStruct? updateGrupoActividadHomeStruct(
  GrupoActividadHomeStruct? grupoActividadHome, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    grupoActividadHome
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGrupoActividadHomeStructData(
  Map<String, dynamic> firestoreData,
  GrupoActividadHomeStruct? grupoActividadHome,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (grupoActividadHome == null) {
    return;
  }
  if (grupoActividadHome.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && grupoActividadHome.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final grupoActividadHomeData =
      getGrupoActividadHomeFirestoreData(grupoActividadHome, forFieldValue);
  final nestedData =
      grupoActividadHomeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      grupoActividadHome.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGrupoActividadHomeFirestoreData(
  GrupoActividadHomeStruct? grupoActividadHome, [
  bool forFieldValue = false,
]) {
  if (grupoActividadHome == null) {
    return {};
  }
  final firestoreData = mapToFirestore(grupoActividadHome.toMap());

  // Add any Firestore field values
  grupoActividadHome.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGrupoActividadHomeListFirestoreData(
  List<GrupoActividadHomeStruct>? grupoActividadHomes,
) =>
    grupoActividadHomes
        ?.map((e) => getGrupoActividadHomeFirestoreData(e, true))
        .toList() ??
    [];
