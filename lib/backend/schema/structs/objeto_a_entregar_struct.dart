// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjetoAEntregarStruct extends FFFirebaseStruct {
  ObjetoAEntregarStruct({
    double? cantidadMaxima,
    DocumentReference? objetoAEntregar,
    String? objetoAEntregarLabel,
    double? cantidadAEntregar,
    DocumentReference? actividadObjetoAEntregar,
    DocumentReference? objetoEntregadoReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cantidadMaxima = cantidadMaxima,
        _objetoAEntregar = objetoAEntregar,
        _objetoAEntregarLabel = objetoAEntregarLabel,
        _cantidadAEntregar = cantidadAEntregar,
        _actividadObjetoAEntregar = actividadObjetoAEntregar,
        _objetoEntregadoReference = objetoEntregadoReference,
        super(firestoreUtilData);

  // "cantidadMaxima" field.
  double? _cantidadMaxima;
  double get cantidadMaxima => _cantidadMaxima ?? 0.0;
  set cantidadMaxima(double? val) => _cantidadMaxima = val;
  void incrementCantidadMaxima(double amount) =>
      _cantidadMaxima = cantidadMaxima + amount;
  bool hasCantidadMaxima() => _cantidadMaxima != null;

  // "objetoAEntregar" field.
  DocumentReference? _objetoAEntregar;
  DocumentReference? get objetoAEntregar => _objetoAEntregar;
  set objetoAEntregar(DocumentReference? val) => _objetoAEntregar = val;
  bool hasObjetoAEntregar() => _objetoAEntregar != null;

  // "objetoAEntregarLabel" field.
  String? _objetoAEntregarLabel;
  String get objetoAEntregarLabel => _objetoAEntregarLabel ?? '';
  set objetoAEntregarLabel(String? val) => _objetoAEntregarLabel = val;
  bool hasObjetoAEntregarLabel() => _objetoAEntregarLabel != null;

  // "cantidadAEntregar" field.
  double? _cantidadAEntregar;
  double get cantidadAEntregar => _cantidadAEntregar ?? 0.0;
  set cantidadAEntregar(double? val) => _cantidadAEntregar = val;
  void incrementCantidadAEntregar(double amount) =>
      _cantidadAEntregar = cantidadAEntregar + amount;
  bool hasCantidadAEntregar() => _cantidadAEntregar != null;

  // "actividadObjetoAEntregar" field.
  DocumentReference? _actividadObjetoAEntregar;
  DocumentReference? get actividadObjetoAEntregar => _actividadObjetoAEntregar;
  set actividadObjetoAEntregar(DocumentReference? val) =>
      _actividadObjetoAEntregar = val;
  bool hasActividadObjetoAEntregar() => _actividadObjetoAEntregar != null;

  // "objetoEntregadoReference" field.
  DocumentReference? _objetoEntregadoReference;
  DocumentReference? get objetoEntregadoReference => _objetoEntregadoReference;
  set objetoEntregadoReference(DocumentReference? val) =>
      _objetoEntregadoReference = val;
  bool hasObjetoEntregadoReference() => _objetoEntregadoReference != null;

  static ObjetoAEntregarStruct fromMap(Map<String, dynamic> data) =>
      ObjetoAEntregarStruct(
        cantidadMaxima: castToType<double>(data['cantidadMaxima']),
        objetoAEntregar: data['objetoAEntregar'] as DocumentReference?,
        objetoAEntregarLabel: data['objetoAEntregarLabel'] as String?,
        cantidadAEntregar: castToType<double>(data['cantidadAEntregar']),
        actividadObjetoAEntregar:
            data['actividadObjetoAEntregar'] as DocumentReference?,
        objetoEntregadoReference:
            data['objetoEntregadoReference'] as DocumentReference?,
      );

  static ObjetoAEntregarStruct? maybeFromMap(dynamic data) => data is Map
      ? ObjetoAEntregarStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cantidadMaxima': _cantidadMaxima,
        'objetoAEntregar': _objetoAEntregar,
        'objetoAEntregarLabel': _objetoAEntregarLabel,
        'cantidadAEntregar': _cantidadAEntregar,
        'actividadObjetoAEntregar': _actividadObjetoAEntregar,
        'objetoEntregadoReference': _objetoEntregadoReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cantidadMaxima': serializeParam(
          _cantidadMaxima,
          ParamType.double,
        ),
        'objetoAEntregar': serializeParam(
          _objetoAEntregar,
          ParamType.DocumentReference,
        ),
        'objetoAEntregarLabel': serializeParam(
          _objetoAEntregarLabel,
          ParamType.String,
        ),
        'cantidadAEntregar': serializeParam(
          _cantidadAEntregar,
          ParamType.double,
        ),
        'actividadObjetoAEntregar': serializeParam(
          _actividadObjetoAEntregar,
          ParamType.DocumentReference,
        ),
        'objetoEntregadoReference': serializeParam(
          _objetoEntregadoReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ObjetoAEntregarStruct fromSerializableMap(Map<String, dynamic> data) =>
      ObjetoAEntregarStruct(
        cantidadMaxima: deserializeParam(
          data['cantidadMaxima'],
          ParamType.double,
          false,
        ),
        objetoAEntregar: deserializeParam(
          data['objetoAEntregar'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['objeto_a_entregar'],
        ),
        objetoAEntregarLabel: deserializeParam(
          data['objetoAEntregarLabel'],
          ParamType.String,
          false,
        ),
        cantidadAEntregar: deserializeParam(
          data['cantidadAEntregar'],
          ParamType.double,
          false,
        ),
        actividadObjetoAEntregar: deserializeParam(
          data['actividadObjetoAEntregar'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: [
            'grupo_actividad_detalle',
            'actividad_objeto_a_entregar'
          ],
        ),
        objetoEntregadoReference: deserializeParam(
          data['objetoEntregadoReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['grupo_actividad_detalle', 'objeto_entregado'],
        ),
      );

  @override
  String toString() => 'ObjetoAEntregarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ObjetoAEntregarStruct &&
        cantidadMaxima == other.cantidadMaxima &&
        objetoAEntregar == other.objetoAEntregar &&
        objetoAEntregarLabel == other.objetoAEntregarLabel &&
        cantidadAEntregar == other.cantidadAEntregar &&
        actividadObjetoAEntregar == other.actividadObjetoAEntregar &&
        objetoEntregadoReference == other.objetoEntregadoReference;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cantidadMaxima,
        objetoAEntregar,
        objetoAEntregarLabel,
        cantidadAEntregar,
        actividadObjetoAEntregar,
        objetoEntregadoReference
      ]);
}

ObjetoAEntregarStruct createObjetoAEntregarStruct({
  double? cantidadMaxima,
  DocumentReference? objetoAEntregar,
  String? objetoAEntregarLabel,
  double? cantidadAEntregar,
  DocumentReference? actividadObjetoAEntregar,
  DocumentReference? objetoEntregadoReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ObjetoAEntregarStruct(
      cantidadMaxima: cantidadMaxima,
      objetoAEntregar: objetoAEntregar,
      objetoAEntregarLabel: objetoAEntregarLabel,
      cantidadAEntregar: cantidadAEntregar,
      actividadObjetoAEntregar: actividadObjetoAEntregar,
      objetoEntregadoReference: objetoEntregadoReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ObjetoAEntregarStruct? updateObjetoAEntregarStruct(
  ObjetoAEntregarStruct? objetoAEntregarStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    objetoAEntregarStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addObjetoAEntregarStructData(
  Map<String, dynamic> firestoreData,
  ObjetoAEntregarStruct? objetoAEntregarStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (objetoAEntregarStruct == null) {
    return;
  }
  if (objetoAEntregarStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      objetoAEntregarStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final objetoAEntregarStructData =
      getObjetoAEntregarFirestoreData(objetoAEntregarStruct, forFieldValue);
  final nestedData =
      objetoAEntregarStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      objetoAEntregarStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getObjetoAEntregarFirestoreData(
  ObjetoAEntregarStruct? objetoAEntregarStruct, [
  bool forFieldValue = false,
]) {
  if (objetoAEntregarStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(objetoAEntregarStruct.toMap());

  // Add any Firestore field values
  objetoAEntregarStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getObjetoAEntregarListFirestoreData(
  List<ObjetoAEntregarStruct>? objetoAEntregarStructs,
) =>
    objetoAEntregarStructs
        ?.map((e) => getObjetoAEntregarFirestoreData(e, true))
        .toList() ??
    [];
