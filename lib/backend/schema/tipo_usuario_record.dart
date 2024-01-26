import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TipoUsuarioRecord extends FirestoreRecord {
  TipoUsuarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
    _estado = snapshotData['estado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipo_usuario');

  static Stream<TipoUsuarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoUsuarioRecord.fromSnapshot(s));

  static Future<TipoUsuarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoUsuarioRecord.fromSnapshot(s));

  static TipoUsuarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoUsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoUsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoUsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoUsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoUsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoUsuarioRecordData({
  String? descripcion,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoUsuarioRecordDocumentEquality implements Equality<TipoUsuarioRecord> {
  const TipoUsuarioRecordDocumentEquality();

  @override
  bool equals(TipoUsuarioRecord? e1, TipoUsuarioRecord? e2) {
    return e1?.descripcion == e2?.descripcion && e1?.estado == e2?.estado;
  }

  @override
  int hash(TipoUsuarioRecord? e) =>
      const ListEquality().hash([e?.descripcion, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is TipoUsuarioRecord;
}
