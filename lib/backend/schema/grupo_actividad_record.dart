import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoActividadRecord extends FirestoreRecord {
  GrupoActividadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "actividad" field.
  DocumentReference? _actividad;
  DocumentReference? get actividad => _actividad;
  bool hasActividad() => _actividad != null;

  // "grupos" field.
  List<DocumentReference>? _grupos;
  List<DocumentReference> get grupos => _grupos ?? const [];
  bool hasGrupos() => _grupos != null;

  // "fecha_inicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "fecha_fin" field.
  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  bool hasFechaFin() => _fechaFin != null;

  void _initializeFields() {
    _actividad = snapshotData['actividad'] as DocumentReference?;
    _grupos = getDataList(snapshotData['grupos']);
    _fechaInicio = snapshotData['fecha_inicio'] as DateTime?;
    _fechaFin = snapshotData['fecha_fin'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo_actividad');

  static Stream<GrupoActividadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoActividadRecord.fromSnapshot(s));

  static Future<GrupoActividadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoActividadRecord.fromSnapshot(s));

  static GrupoActividadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrupoActividadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoActividadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoActividadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoActividadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoActividadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoActividadRecordData({
  DocumentReference? actividad,
  DateTime? fechaInicio,
  DateTime? fechaFin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'actividad': actividad,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoActividadRecordDocumentEquality
    implements Equality<GrupoActividadRecord> {
  const GrupoActividadRecordDocumentEquality();

  @override
  bool equals(GrupoActividadRecord? e1, GrupoActividadRecord? e2) {
    const listEquality = ListEquality();
    return e1?.actividad == e2?.actividad &&
        listEquality.equals(e1?.grupos, e2?.grupos) &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFin == e2?.fechaFin;
  }

  @override
  int hash(GrupoActividadRecord? e) => const ListEquality()
      .hash([e?.actividad, e?.grupos, e?.fechaInicio, e?.fechaFin]);

  @override
  bool isValidKey(Object? o) => o is GrupoActividadRecord;
}
