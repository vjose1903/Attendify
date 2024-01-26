import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AsistenciaRecord extends FirestoreRecord {
  AsistenciaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "usuario_name" field.
  String? _usuarioName;
  String get usuarioName => _usuarioName ?? '';
  bool hasUsuarioName() => _usuarioName != null;

  // "presente" field.
  bool? _presente;
  bool get presente => _presente ?? false;
  bool hasPresente() => _presente != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "grupo_name" field.
  String? _grupoName;
  String get grupoName => _grupoName ?? '';
  bool hasGrupoName() => _grupoName != null;

  // "grupo_usuario" field.
  DocumentReference? _grupoUsuario;
  DocumentReference? get grupoUsuario => _grupoUsuario;
  bool hasGrupoUsuario() => _grupoUsuario != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _usuarioName = snapshotData['usuario_name'] as String?;
    _presente = snapshotData['presente'] as bool?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _grupoName = snapshotData['grupo_name'] as String?;
    _grupoUsuario = snapshotData['grupo_usuario'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('asistencia')
          : FirebaseFirestore.instance.collectionGroup('asistencia');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('asistencia').doc(id);

  static Stream<AsistenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciaRecord.fromSnapshot(s));

  static Future<AsistenciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciaRecord.fromSnapshot(s));

  static AsistenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciaRecordData({
  String? usuarioName,
  bool? presente,
  DocumentReference? grupo,
  String? grupoName,
  DocumentReference? grupoUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario_name': usuarioName,
      'presente': presente,
      'grupo': grupo,
      'grupo_name': grupoName,
      'grupo_usuario': grupoUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    return e1?.usuarioName == e2?.usuarioName &&
        e1?.presente == e2?.presente &&
        e1?.grupo == e2?.grupo &&
        e1?.grupoName == e2?.grupoName &&
        e1?.grupoUsuario == e2?.grupoUsuario;
  }

  @override
  int hash(AsistenciaRecord? e) => const ListEquality().hash(
      [e?.usuarioName, e?.presente, e?.grupo, e?.grupoName, e?.grupoUsuario]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
