import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActividadObjetoAEntregarRecord extends FirestoreRecord {
  ActividadObjetoAEntregarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_usuario" field.
  DocumentReference? _tipoUsuario;
  DocumentReference? get tipoUsuario => _tipoUsuario;
  bool hasTipoUsuario() => _tipoUsuario != null;

  // "grupo_actividad" field.
  DocumentReference? _grupoActividad;
  DocumentReference? get grupoActividad => _grupoActividad;
  bool hasGrupoActividad() => _grupoActividad != null;

  // "objeto_a_entregar" field.
  DocumentReference? _objetoAEntregar;
  DocumentReference? get objetoAEntregar => _objetoAEntregar;
  bool hasObjetoAEntregar() => _objetoAEntregar != null;

  // "cantidad" field.
  double? _cantidad;
  double get cantidad => _cantidad ?? 0.0;
  bool hasCantidad() => _cantidad != null;

  // "tipo_usuario_label" field.
  String? _tipoUsuarioLabel;
  String get tipoUsuarioLabel => _tipoUsuarioLabel ?? '';
  bool hasTipoUsuarioLabel() => _tipoUsuarioLabel != null;

  // "objeto_a_entregar_label" field.
  String? _objetoAEntregarLabel;
  String get objetoAEntregarLabel => _objetoAEntregarLabel ?? '';
  bool hasObjetoAEntregarLabel() => _objetoAEntregarLabel != null;

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tipoUsuario = snapshotData['tipo_usuario'] as DocumentReference?;
    _grupoActividad = snapshotData['grupo_actividad'] as DocumentReference?;
    _objetoAEntregar = snapshotData['objeto_a_entregar'] as DocumentReference?;
    _cantidad = castToType<double>(snapshotData['cantidad']);
    _tipoUsuarioLabel = snapshotData['tipo_usuario_label'] as String?;
    _objetoAEntregarLabel = snapshotData['objeto_a_entregar_label'] as String?;
    _grupo = snapshotData['grupo'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('actividad_objeto_a_entregar')
          : FirebaseFirestore.instance
              .collectionGroup('actividad_objeto_a_entregar');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('actividad_objeto_a_entregar').doc(id);

  static Stream<ActividadObjetoAEntregarRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ActividadObjetoAEntregarRecord.fromSnapshot(s));

  static Future<ActividadObjetoAEntregarRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActividadObjetoAEntregarRecord.fromSnapshot(s));

  static ActividadObjetoAEntregarRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ActividadObjetoAEntregarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadObjetoAEntregarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadObjetoAEntregarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadObjetoAEntregarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadObjetoAEntregarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActividadObjetoAEntregarRecordData({
  DocumentReference? tipoUsuario,
  DocumentReference? grupoActividad,
  DocumentReference? objetoAEntregar,
  double? cantidad,
  String? tipoUsuarioLabel,
  String? objetoAEntregarLabel,
  DocumentReference? grupo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_usuario': tipoUsuario,
      'grupo_actividad': grupoActividad,
      'objeto_a_entregar': objetoAEntregar,
      'cantidad': cantidad,
      'tipo_usuario_label': tipoUsuarioLabel,
      'objeto_a_entregar_label': objetoAEntregarLabel,
      'grupo': grupo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadObjetoAEntregarRecordDocumentEquality
    implements Equality<ActividadObjetoAEntregarRecord> {
  const ActividadObjetoAEntregarRecordDocumentEquality();

  @override
  bool equals(
      ActividadObjetoAEntregarRecord? e1, ActividadObjetoAEntregarRecord? e2) {
    return e1?.tipoUsuario == e2?.tipoUsuario &&
        e1?.grupoActividad == e2?.grupoActividad &&
        e1?.objetoAEntregar == e2?.objetoAEntregar &&
        e1?.cantidad == e2?.cantidad &&
        e1?.tipoUsuarioLabel == e2?.tipoUsuarioLabel &&
        e1?.objetoAEntregarLabel == e2?.objetoAEntregarLabel &&
        e1?.grupo == e2?.grupo;
  }

  @override
  int hash(ActividadObjetoAEntregarRecord? e) => const ListEquality().hash([
        e?.tipoUsuario,
        e?.grupoActividad,
        e?.objetoAEntregar,
        e?.cantidad,
        e?.tipoUsuarioLabel,
        e?.objetoAEntregarLabel,
        e?.grupo
      ]);

  @override
  bool isValidKey(Object? o) => o is ActividadObjetoAEntregarRecord;
}
