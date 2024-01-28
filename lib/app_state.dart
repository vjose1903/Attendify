import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _grupoSeleccionado =
          prefs.getString('ff_grupoSeleccionado')?.ref ?? _grupoSeleccionado;
    });
    _safeInit(() {
      _gruposSeguidos = prefs
              .getStringList('ff_gruposSeguidos')
              ?.map((path) => path.ref)
              .toList() ??
          _gruposSeguidos;
    });
    _safeInit(() {
      _tipoUsuarioLoged =
          prefs.getString('ff_tipoUsuarioLoged')?.ref ?? _tipoUsuarioLoged;
    });
    _safeInit(() {
      _grupoUsuarioLoged =
          prefs.getString('ff_grupoUsuarioLoged')?.ref ?? _grupoUsuarioLoged;
    });
    _safeInit(() {
      _TAdministrador =
          prefs.getString('ff_TAdministrador')?.ref ?? _TAdministrador;
    });
    _safeInit(() {
      _TMiembro = prefs.getString('ff_TMiembro')?.ref ?? _TMiembro;
    });
    _safeInit(() {
      _TMiembroActivo =
          prefs.getString('ff_TMiembroActivo')?.ref ?? _TMiembroActivo;
    });
    _safeInit(() {
      _TUsuarioRegular =
          prefs.getString('ff_TUsuarioRegular')?.ref ?? _TUsuarioRegular;
    });
    _safeInit(() {
      _grupoSeleccionadoName =
          prefs.getString('ff_grupoSeleccionadoName') ?? _grupoSeleccionadoName;
    });
    _safeInit(() {
      _secondContador = prefs.getInt('ff_secondContador') ?? _secondContador;
    });
    _safeInit(() {
      _loadingActividades =
          prefs.getBool('ff_loadingActividades') ?? _loadingActividades;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _grupoSeleccionado;
  DocumentReference? get grupoSeleccionado => _grupoSeleccionado;
  set grupoSeleccionado(DocumentReference? value) {
    _grupoSeleccionado = value;
    value != null
        ? prefs.setString('ff_grupoSeleccionado', value.path)
        : prefs.remove('ff_grupoSeleccionado');
  }

  List<DocumentReference> _gruposSeguidos = [];
  List<DocumentReference> get gruposSeguidos => _gruposSeguidos;
  set gruposSeguidos(List<DocumentReference> value) {
    _gruposSeguidos = value;
    prefs.setStringList(
        'ff_gruposSeguidos', value.map((x) => x.path).toList());
  }

  void addToGruposSeguidos(DocumentReference value) {
    _gruposSeguidos.add(value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void removeFromGruposSeguidos(DocumentReference value) {
    _gruposSeguidos.remove(value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void removeAtIndexFromGruposSeguidos(int index) {
    _gruposSeguidos.removeAt(index);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void updateGruposSeguidosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _gruposSeguidos[index] = updateFn(_gruposSeguidos[index]);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void insertAtIndexInGruposSeguidos(int index, DocumentReference value) {
    _gruposSeguidos.insert(index, value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }

  DocumentReference? _tipoUsuarioLoged;
  DocumentReference? get tipoUsuarioLoged => _tipoUsuarioLoged;
  set tipoUsuarioLoged(DocumentReference? value) {
    _tipoUsuarioLoged = value;
    value != null
        ? prefs.setString('ff_tipoUsuarioLoged', value.path)
        : prefs.remove('ff_tipoUsuarioLoged');
  }

  DocumentReference? _grupoUsuarioLoged;
  DocumentReference? get grupoUsuarioLoged => _grupoUsuarioLoged;
  set grupoUsuarioLoged(DocumentReference? value) {
    _grupoUsuarioLoged = value;
    value != null
        ? prefs.setString('ff_grupoUsuarioLoged', value.path)
        : prefs.remove('ff_grupoUsuarioLoged');
  }

  DocumentReference? _TAdministrador;
  DocumentReference? get TAdministrador => _TAdministrador;
  set TAdministrador(DocumentReference? value) {
    _TAdministrador = value;
    value != null
        ? prefs.setString('ff_TAdministrador', value.path)
        : prefs.remove('ff_TAdministrador');
  }

  DocumentReference? _TMiembro;
  DocumentReference? get TMiembro => _TMiembro;
  set TMiembro(DocumentReference? value) {
    _TMiembro = value;
    value != null
        ? prefs.setString('ff_TMiembro', value.path)
        : prefs.remove('ff_TMiembro');
  }

  DocumentReference? _TMiembroActivo;
  DocumentReference? get TMiembroActivo => _TMiembroActivo;
  set TMiembroActivo(DocumentReference? value) {
    _TMiembroActivo = value;
    value != null
        ? prefs.setString('ff_TMiembroActivo', value.path)
        : prefs.remove('ff_TMiembroActivo');
  }

  DocumentReference? _TUsuarioRegular;
  DocumentReference? get TUsuarioRegular => _TUsuarioRegular;
  set TUsuarioRegular(DocumentReference? value) {
    _TUsuarioRegular = value;
    value != null
        ? prefs.setString('ff_TUsuarioRegular', value.path)
        : prefs.remove('ff_TUsuarioRegular');
  }

  String _marta =
      'usuario-sa3dNl475MSbSdWhcxImFQgpv552-grupo-mu9lgafcgPHW5TWIbGP7-1705622308798';
  String get marta => _marta;
  set marta(String value) {
    _marta = value;
  }

  String _lola =
      'usuario-yfl6v4gyCGWulcVTFfHRvzM7yk62-grupo-mu9lgafcgPHW5TWIbGP7-1706244134805';
  String get lola => _lola;
  set lola(String value) {
    _lola = value;
  }

  String _victor =
      'usuario-ynUHgX8amtV8Z1HN9QZDhY5vsAx2-grupo-mu9lgafcgPHW5TWIbGP7-1705356733111';
  String get victor => _victor;
  set victor(String value) {
    _victor = value;
  }

  String _grupoSeleccionadoName = '';
  String get grupoSeleccionadoName => _grupoSeleccionadoName;
  set grupoSeleccionadoName(String value) {
    _grupoSeleccionadoName = value;
    prefs.setString('ff_grupoSeleccionadoName', value);
  }

  int _secondContador = 0;
  int get secondContador => _secondContador;
  set secondContador(int value) {
    _secondContador = value;
    prefs.setInt('ff_secondContador', value);
  }

  bool _loadingActividades = true;
  bool get loadingActividades => _loadingActividades;
  set loadingActividades(bool value) {
    _loadingActividades = value;
    prefs.setBool('ff_loadingActividades', value);
  }

  List<GrupoActividadHomeStruct> _proximasActividades = [];
  List<GrupoActividadHomeStruct> get proximasActividades =>
      _proximasActividades;
  set proximasActividades(List<GrupoActividadHomeStruct> value) {
    _proximasActividades = value;
  }

  void addToProximasActividades(GrupoActividadHomeStruct value) {
    _proximasActividades.add(value);
  }

  void removeFromProximasActividades(GrupoActividadHomeStruct value) {
    _proximasActividades.remove(value);
  }

  void removeAtIndexFromProximasActividades(int index) {
    _proximasActividades.removeAt(index);
  }

  void updateProximasActividadesAtIndex(
    int index,
    GrupoActividadHomeStruct Function(GrupoActividadHomeStruct) updateFn,
  ) {
    _proximasActividades[index] = updateFn(_proximasActividades[index]);
  }

  void insertAtIndexInProximasActividades(
      int index, GrupoActividadHomeStruct value) {
    _proximasActividades.insert(index, value);
  }

  List<GrupoActividadHomeStruct> _restoActividades = [];
  List<GrupoActividadHomeStruct> get restoActividades => _restoActividades;
  set restoActividades(List<GrupoActividadHomeStruct> value) {
    _restoActividades = value;
  }

  void addToRestoActividades(GrupoActividadHomeStruct value) {
    _restoActividades.add(value);
  }

  void removeFromRestoActividades(GrupoActividadHomeStruct value) {
    _restoActividades.remove(value);
  }

  void removeAtIndexFromRestoActividades(int index) {
    _restoActividades.removeAt(index);
  }

  void updateRestoActividadesAtIndex(
    int index,
    GrupoActividadHomeStruct Function(GrupoActividadHomeStruct) updateFn,
  ) {
    _restoActividades[index] = updateFn(_restoActividades[index]);
  }

  void insertAtIndexInRestoActividades(
      int index, GrupoActividadHomeStruct value) {
    _restoActividades.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
