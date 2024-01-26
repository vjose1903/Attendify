import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoActividadDetalleRecord extends FirestoreRecord {
  GrupoActividadDetalleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "grupo_actividad" field.
  DocumentReference? _grupoActividad;
  DocumentReference? get grupoActividad => _grupoActividad;
  bool hasGrupoActividad() => _grupoActividad != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  void _initializeFields() {
    _grupoActividad = snapshotData['grupo_actividad'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo_actividad_detalle');

  static Stream<GrupoActividadDetalleRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoActividadDetalleRecord.fromSnapshot(s));

  static Future<GrupoActividadDetalleRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GrupoActividadDetalleRecord.fromSnapshot(s));

  static GrupoActividadDetalleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrupoActividadDetalleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoActividadDetalleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoActividadDetalleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoActividadDetalleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoActividadDetalleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoActividadDetalleRecordData({
  DocumentReference? grupoActividad,
  DateTime? fecha,
  DocumentReference? grupo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grupo_actividad': grupoActividad,
      'fecha': fecha,
      'grupo': grupo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoActividadDetalleRecordDocumentEquality
    implements Equality<GrupoActividadDetalleRecord> {
  const GrupoActividadDetalleRecordDocumentEquality();

  @override
  bool equals(
      GrupoActividadDetalleRecord? e1, GrupoActividadDetalleRecord? e2) {
    return e1?.grupoActividad == e2?.grupoActividad &&
        e1?.fecha == e2?.fecha &&
        e1?.grupo == e2?.grupo;
  }

  @override
  int hash(GrupoActividadDetalleRecord? e) =>
      const ListEquality().hash([e?.grupoActividad, e?.fecha, e?.grupo]);

  @override
  bool isValidKey(Object? o) => o is GrupoActividadDetalleRecord;
}
