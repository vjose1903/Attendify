import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoRecord extends FirestoreRecord {
  GrupoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _estado = snapshotData['estado'] as bool?;
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo');

  static Stream<GrupoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoRecord.fromSnapshot(s));

  static Future<GrupoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoRecord.fromSnapshot(s));

  static GrupoRecord fromSnapshot(DocumentSnapshot snapshot) => GrupoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoRecordData({
  String? nombre,
  bool? estado,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'estado': estado,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoRecordDocumentEquality implements Equality<GrupoRecord> {
  const GrupoRecordDocumentEquality();

  @override
  bool equals(GrupoRecord? e1, GrupoRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.estado == e2?.estado &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(GrupoRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.estado, e?.logo]);

  @override
  bool isValidKey(Object? o) => o is GrupoRecord;
}
