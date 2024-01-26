import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoUsuarioRecord extends FirestoreRecord {
  GrupoUsuarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "tipo_usuario" field.
  DocumentReference? _tipoUsuario;
  DocumentReference? get tipoUsuario => _tipoUsuario;
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "qr" field.
  String? _qr;
  String get qr => _qr ?? '';
  bool hasQr() => _qr != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _tipoUsuario = snapshotData['tipo_usuario'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _qr = snapshotData['qr'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo_usuario');

  static Stream<GrupoUsuarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoUsuarioRecord.fromSnapshot(s));

  static Future<GrupoUsuarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoUsuarioRecord.fromSnapshot(s));

  static GrupoUsuarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrupoUsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoUsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoUsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoUsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoUsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoUsuarioRecordData({
  DocumentReference? grupo,
  DocumentReference? usuario,
  DocumentReference? tipoUsuario,
  DocumentReference? createdBy,
  String? qr,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grupo': grupo,
      'usuario': usuario,
      'tipo_usuario': tipoUsuario,
      'created_by': createdBy,
      'qr': qr,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoUsuarioRecordDocumentEquality
    implements Equality<GrupoUsuarioRecord> {
  const GrupoUsuarioRecordDocumentEquality();

  @override
  bool equals(GrupoUsuarioRecord? e1, GrupoUsuarioRecord? e2) {
    return e1?.grupo == e2?.grupo &&
        e1?.usuario == e2?.usuario &&
        e1?.tipoUsuario == e2?.tipoUsuario &&
        e1?.createdBy == e2?.createdBy &&
        e1?.qr == e2?.qr &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(GrupoUsuarioRecord? e) => const ListEquality().hash([
        e?.grupo,
        e?.usuario,
        e?.tipoUsuario,
        e?.createdBy,
        e?.qr,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is GrupoUsuarioRecord;
}
