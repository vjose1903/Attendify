import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class DocumentoIdentidadRecord extends FirestoreRecord {
  DocumentoIdentidadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo" field.
  TipoDocumentoIdentidad? _tipo;
  TipoDocumentoIdentidad? get tipo => _tipo;
  bool hasTipo() => _tipo != null;

  // "valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "usuarioReference" field.
  DocumentReference? _usuarioReference;
  DocumentReference? get usuarioReference => _usuarioReference;
  bool hasUsuarioReference() => _usuarioReference != null;

  void _initializeFields() {
    _tipo = deserializeEnum<TipoDocumentoIdentidad>(snapshotData['tipo']);
    _valor = snapshotData['valor'] as String?;
    _usuarioReference = snapshotData['usuarioReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documento_identidad');

  static Stream<DocumentoIdentidadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentoIdentidadRecord.fromSnapshot(s));

  static Future<DocumentoIdentidadRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DocumentoIdentidadRecord.fromSnapshot(s));

  static DocumentoIdentidadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentoIdentidadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentoIdentidadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentoIdentidadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentoIdentidadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentoIdentidadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentoIdentidadRecordData({
  TipoDocumentoIdentidad? tipo,
  String? valor,
  DocumentReference? usuarioReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'valor': valor,
      'usuarioReference': usuarioReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentoIdentidadRecordDocumentEquality
    implements Equality<DocumentoIdentidadRecord> {
  const DocumentoIdentidadRecordDocumentEquality();

  @override
  bool equals(DocumentoIdentidadRecord? e1, DocumentoIdentidadRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.valor == e2?.valor &&
        e1?.usuarioReference == e2?.usuarioReference;
  }

  @override
  int hash(DocumentoIdentidadRecord? e) =>
      const ListEquality().hash([e?.tipo, e?.valor, e?.usuarioReference]);

  @override
  bool isValidKey(Object? o) => o is DocumentoIdentidadRecord;
}
