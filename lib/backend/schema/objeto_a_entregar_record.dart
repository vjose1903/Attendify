import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ObjetoAEntregarRecord extends FirestoreRecord {
  ObjetoAEntregarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _estado = snapshotData['estado'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('objeto_a_entregar');

  static Stream<ObjetoAEntregarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjetoAEntregarRecord.fromSnapshot(s));

  static Future<ObjetoAEntregarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjetoAEntregarRecord.fromSnapshot(s));

  static ObjetoAEntregarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ObjetoAEntregarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjetoAEntregarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjetoAEntregarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjetoAEntregarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjetoAEntregarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjetoAEntregarRecordData({
  String? descripcion,
  DocumentReference? grupo,
  String? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
      'grupo': grupo,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjetoAEntregarRecordDocumentEquality
    implements Equality<ObjetoAEntregarRecord> {
  const ObjetoAEntregarRecordDocumentEquality();

  @override
  bool equals(ObjetoAEntregarRecord? e1, ObjetoAEntregarRecord? e2) {
    return e1?.descripcion == e2?.descripcion &&
        e1?.grupo == e2?.grupo &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ObjetoAEntregarRecord? e) =>
      const ListEquality().hash([e?.descripcion, e?.grupo, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is ObjetoAEntregarRecord;
}
