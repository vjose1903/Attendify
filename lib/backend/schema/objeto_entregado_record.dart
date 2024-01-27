import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjetoEntregadoRecord extends FirestoreRecord {
  ObjetoEntregadoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "asistencia" field.
  DocumentReference? _asistencia;
  DocumentReference? get asistencia => _asistencia;
  bool hasAsistencia() => _asistencia != null;

  // "objeto_a_entregar" field.
  DocumentReference? _objetoAEntregar;
  DocumentReference? get objetoAEntregar => _objetoAEntregar;
  bool hasObjetoAEntregar() => _objetoAEntregar != null;

  // "objeto_a_entregar_label" field.
  String? _objetoAEntregarLabel;
  String get objetoAEntregarLabel => _objetoAEntregarLabel ?? '';
  bool hasObjetoAEntregarLabel() => _objetoAEntregarLabel != null;

  // "grupo_usuario" field.
  DocumentReference? _grupoUsuario;
  DocumentReference? get grupoUsuario => _grupoUsuario;
  bool hasGrupoUsuario() => _grupoUsuario != null;

  // "usuario_name" field.
  String? _usuarioName;
  String get usuarioName => _usuarioName ?? '';
  bool hasUsuarioName() => _usuarioName != null;

  // "cantidad" field.
  double? _cantidad;
  double get cantidad => _cantidad ?? 0.0;
  bool hasCantidad() => _cantidad != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "tipo_usuario" field.
  DocumentReference? _tipoUsuario;
  DocumentReference? get tipoUsuario => _tipoUsuario;
  bool hasTipoUsuario() => _tipoUsuario != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _asistencia = snapshotData['asistencia'] as DocumentReference?;
    _objetoAEntregar = snapshotData['objeto_a_entregar'] as DocumentReference?;
    _objetoAEntregarLabel = snapshotData['objeto_a_entregar_label'] as String?;
    _grupoUsuario = snapshotData['grupo_usuario'] as DocumentReference?;
    _usuarioName = snapshotData['usuario_name'] as String?;
    _cantidad = castToType<double>(snapshotData['cantidad']);
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _tipoUsuario = snapshotData['tipo_usuario'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('objeto_entregado')
          : FirebaseFirestore.instance.collectionGroup('objeto_entregado');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('objeto_entregado').doc(id);

  static Stream<ObjetoEntregadoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjetoEntregadoRecord.fromSnapshot(s));

  static Future<ObjetoEntregadoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjetoEntregadoRecord.fromSnapshot(s));

  static ObjetoEntregadoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ObjetoEntregadoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjetoEntregadoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjetoEntregadoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjetoEntregadoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjetoEntregadoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjetoEntregadoRecordData({
  DocumentReference? asistencia,
  DocumentReference? objetoAEntregar,
  String? objetoAEntregarLabel,
  DocumentReference? grupoUsuario,
  String? usuarioName,
  double? cantidad,
  DocumentReference? grupo,
  DocumentReference? tipoUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'asistencia': asistencia,
      'objeto_a_entregar': objetoAEntregar,
      'objeto_a_entregar_label': objetoAEntregarLabel,
      'grupo_usuario': grupoUsuario,
      'usuario_name': usuarioName,
      'cantidad': cantidad,
      'grupo': grupo,
      'tipo_usuario': tipoUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjetoEntregadoRecordDocumentEquality
    implements Equality<ObjetoEntregadoRecord> {
  const ObjetoEntregadoRecordDocumentEquality();

  @override
  bool equals(ObjetoEntregadoRecord? e1, ObjetoEntregadoRecord? e2) {
    return e1?.asistencia == e2?.asistencia &&
        e1?.objetoAEntregar == e2?.objetoAEntregar &&
        e1?.objetoAEntregarLabel == e2?.objetoAEntregarLabel &&
        e1?.grupoUsuario == e2?.grupoUsuario &&
        e1?.usuarioName == e2?.usuarioName &&
        e1?.cantidad == e2?.cantidad &&
        e1?.grupo == e2?.grupo &&
        e1?.tipoUsuario == e2?.tipoUsuario;
  }

  @override
  int hash(ObjetoEntregadoRecord? e) => const ListEquality().hash([
        e?.asistencia,
        e?.objetoAEntregar,
        e?.objetoAEntregarLabel,
        e?.grupoUsuario,
        e?.usuarioName,
        e?.cantidad,
        e?.grupo,
        e?.tipoUsuario
      ]);

  @override
  bool isValidKey(Object? o) => o is ObjetoEntregadoRecord;
}
