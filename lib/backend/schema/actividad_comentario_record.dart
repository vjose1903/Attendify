import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ActividadComentarioRecord extends FirestoreRecord {
  ActividadComentarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comentario = snapshotData['comentario'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('actividad_comentario')
          : FirebaseFirestore.instance.collectionGroup('actividad_comentario');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('actividad_comentario').doc(id);

  static Stream<ActividadComentarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActividadComentarioRecord.fromSnapshot(s));

  static Future<ActividadComentarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActividadComentarioRecord.fromSnapshot(s));

  static ActividadComentarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActividadComentarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadComentarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadComentarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadComentarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadComentarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActividadComentarioRecordData({
  String? comentario,
  DateTime? createdAt,
  DocumentReference? grupo,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comentario': comentario,
      'createdAt': createdAt,
      'grupo': grupo,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadComentarioRecordDocumentEquality
    implements Equality<ActividadComentarioRecord> {
  const ActividadComentarioRecordDocumentEquality();

  @override
  bool equals(ActividadComentarioRecord? e1, ActividadComentarioRecord? e2) {
    return e1?.comentario == e2?.comentario &&
        e1?.createdAt == e2?.createdAt &&
        e1?.grupo == e2?.grupo &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(ActividadComentarioRecord? e) => const ListEquality()
      .hash([e?.comentario, e?.createdAt, e?.grupo, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is ActividadComentarioRecord;
}
