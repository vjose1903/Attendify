// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityDeliverItemStruct extends FFFirebaseStruct {
  ActivityDeliverItemStruct({
    DocumentReference? tipoUsuario,
    double? cantidad,
    DocumentReference? objetoAEntregar,
    DocumentReference? referenceID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tipoUsuario = tipoUsuario,
        _cantidad = cantidad,
        _objetoAEntregar = objetoAEntregar,
        _referenceID = referenceID,
        super(firestoreUtilData);

  // "tipo_usuario" field.
  DocumentReference? _tipoUsuario;
  DocumentReference? get tipoUsuario => _tipoUsuario;
  set tipoUsuario(DocumentReference? val) => _tipoUsuario = val;
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "cantidad" field.
  double? _cantidad;
  double get cantidad => _cantidad ?? 0.0;
  set cantidad(double? val) => _cantidad = val;
  void incrementCantidad(double amount) => _cantidad = cantidad + amount;
  bool hasCantidad() => _cantidad != null;

  // "objeto_a_entregar" field.
  DocumentReference? _objetoAEntregar;
  DocumentReference? get objetoAEntregar => _objetoAEntregar;
  set objetoAEntregar(DocumentReference? val) => _objetoAEntregar = val;
  bool hasObjetoAEntregar() => _objetoAEntregar != null;

  // "referenceID" field.
  DocumentReference? _referenceID;
  DocumentReference? get referenceID => _referenceID;
  set referenceID(DocumentReference? val) => _referenceID = val;
  bool hasReferenceID() => _referenceID != null;

  static ActivityDeliverItemStruct fromMap(Map<String, dynamic> data) =>
      ActivityDeliverItemStruct(
        tipoUsuario: data['tipo_usuario'] as DocumentReference?,
        cantidad: castToType<double>(data['cantidad']),
        objetoAEntregar: data['objeto_a_entregar'] as DocumentReference?,
        referenceID: data['referenceID'] as DocumentReference?,
      );

  static ActivityDeliverItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ActivityDeliverItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tipo_usuario': _tipoUsuario,
        'cantidad': _cantidad,
        'objeto_a_entregar': _objetoAEntregar,
        'referenceID': _referenceID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tipo_usuario': serializeParam(
          _tipoUsuario,
          ParamType.DocumentReference,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.double,
        ),
        'objeto_a_entregar': serializeParam(
          _objetoAEntregar,
          ParamType.DocumentReference,
        ),
        'referenceID': serializeParam(
          _referenceID,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ActivityDeliverItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ActivityDeliverItemStruct(
        tipoUsuario: deserializeParam(
          data['tipo_usuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tipo_usuario'],
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.double,
          false,
        ),
        objetoAEntregar: deserializeParam(
          data['objeto_a_entregar'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['objeto_a_entregar'],
        ),
        referenceID: deserializeParam(
          data['referenceID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: [
            'grupo_actividad_detalle',
            'actividad_objeto_a_entregar'
          ],
        ),
      );

  @override
  String toString() => 'ActivityDeliverItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActivityDeliverItemStruct &&
        tipoUsuario == other.tipoUsuario &&
        cantidad == other.cantidad &&
        objetoAEntregar == other.objetoAEntregar &&
        referenceID == other.referenceID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([tipoUsuario, cantidad, objetoAEntregar, referenceID]);
}

ActivityDeliverItemStruct createActivityDeliverItemStruct({
  DocumentReference? tipoUsuario,
  double? cantidad,
  DocumentReference? objetoAEntregar,
  DocumentReference? referenceID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ActivityDeliverItemStruct(
      tipoUsuario: tipoUsuario,
      cantidad: cantidad,
      objetoAEntregar: objetoAEntregar,
      referenceID: referenceID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ActivityDeliverItemStruct? updateActivityDeliverItemStruct(
  ActivityDeliverItemStruct? activityDeliverItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    activityDeliverItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addActivityDeliverItemStructData(
  Map<String, dynamic> firestoreData,
  ActivityDeliverItemStruct? activityDeliverItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (activityDeliverItem == null) {
    return;
  }
  if (activityDeliverItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && activityDeliverItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final activityDeliverItemData =
      getActivityDeliverItemFirestoreData(activityDeliverItem, forFieldValue);
  final nestedData =
      activityDeliverItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      activityDeliverItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getActivityDeliverItemFirestoreData(
  ActivityDeliverItemStruct? activityDeliverItem, [
  bool forFieldValue = false,
]) {
  if (activityDeliverItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(activityDeliverItem.toMap());

  // Add any Firestore field values
  activityDeliverItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getActivityDeliverItemListFirestoreData(
  List<ActivityDeliverItemStruct>? activityDeliverItems,
) =>
    activityDeliverItems
        ?.map((e) => getActivityDeliverItemFirestoreData(e, true))
        .toList() ??
    [];
