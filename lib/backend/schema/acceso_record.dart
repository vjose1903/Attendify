import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AccesoRecord extends FirestoreRecord {
  AccesoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_usuario" field.
  DocumentReference? _tipoUsuario;
  DocumentReference? get tipoUsuario => _tipoUsuario;
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "tipo_usuario_label" field.
  String? _tipoUsuarioLabel;
  String get tipoUsuarioLabel => _tipoUsuarioLabel ?? '';
  bool hasTipoUsuarioLabel() => _tipoUsuarioLabel != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoUsuario = snapshotData['tipo_usuario'] as DocumentReference?;
    _tipoUsuarioLabel = snapshotData['tipo_usuario_label'] as String?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('acceso')
          : FirebaseFirestore.instance.collectionGroup('acceso');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('acceso').doc(id);

  static Stream<AccesoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccesoRecord.fromSnapshot(s));

  static Future<AccesoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccesoRecord.fromSnapshot(s));

  static AccesoRecord fromSnapshot(DocumentSnapshot snapshot) => AccesoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccesoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccesoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccesoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccesoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccesoRecordData({
  DocumentReference? tipoUsuario,
  String? tipoUsuarioLabel,
  DocumentReference? grupo,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_usuario': tipoUsuario,
      'tipo_usuario_label': tipoUsuarioLabel,
      'grupo': grupo,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccesoRecordDocumentEquality implements Equality<AccesoRecord> {
  const AccesoRecordDocumentEquality();

  @override
  bool equals(AccesoRecord? e1, AccesoRecord? e2) {
    return e1?.tipoUsuario == e2?.tipoUsuario &&
        e1?.tipoUsuarioLabel == e2?.tipoUsuarioLabel &&
        e1?.grupo == e2?.grupo &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(AccesoRecord? e) => const ListEquality()
      .hash([e?.tipoUsuario, e?.tipoUsuarioLabel, e?.grupo, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is AccesoRecord;
}
