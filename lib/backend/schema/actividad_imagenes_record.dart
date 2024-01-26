import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ActividadImagenesRecord extends FirestoreRecord {
  ActividadImagenesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imgPath" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  bool hasImgPath() => _imgPath != null;

  // "isPortada" field.
  bool? _isPortada;
  bool get isPortada => _isPortada ?? false;
  bool hasIsPortada() => _isPortada != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "actividad" field.
  DocumentReference? _actividad;
  DocumentReference? get actividad => _actividad;
  bool hasActividad() => _actividad != null;

  // "imgBlurPath" field.
  String? _imgBlurPath;
  String get imgBlurPath => _imgBlurPath ?? '';
  bool hasImgBlurPath() => _imgBlurPath != null;

  void _initializeFields() {
    _imgPath = snapshotData['imgPath'] as String?;
    _isPortada = snapshotData['isPortada'] as bool?;
    _type = snapshotData['type'] as String?;
    _actividad = snapshotData['actividad'] as DocumentReference?;
    _imgBlurPath = snapshotData['imgBlurPath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actividad_imagenes');

  static Stream<ActividadImagenesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActividadImagenesRecord.fromSnapshot(s));

  static Future<ActividadImagenesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActividadImagenesRecord.fromSnapshot(s));

  static ActividadImagenesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActividadImagenesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadImagenesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadImagenesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadImagenesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadImagenesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActividadImagenesRecordData({
  String? imgPath,
  bool? isPortada,
  String? type,
  DocumentReference? actividad,
  String? imgBlurPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imgPath': imgPath,
      'isPortada': isPortada,
      'type': type,
      'actividad': actividad,
      'imgBlurPath': imgBlurPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadImagenesRecordDocumentEquality
    implements Equality<ActividadImagenesRecord> {
  const ActividadImagenesRecordDocumentEquality();

  @override
  bool equals(ActividadImagenesRecord? e1, ActividadImagenesRecord? e2) {
    return e1?.imgPath == e2?.imgPath &&
        e1?.isPortada == e2?.isPortada &&
        e1?.type == e2?.type &&
        e1?.actividad == e2?.actividad &&
        e1?.imgBlurPath == e2?.imgBlurPath;
  }

  @override
  int hash(ActividadImagenesRecord? e) => const ListEquality()
      .hash([e?.imgPath, e?.isPortada, e?.type, e?.actividad, e?.imgBlurPath]);

  @override
  bool isValidKey(Object? o) => o is ActividadImagenesRecord;
}
