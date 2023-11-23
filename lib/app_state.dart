import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _numTable = (await secureStorage.getStringList('ff_numTable'))
              ?.map(int.parse)
              .toList() ??
          _numTable;
    });
    await _safeInitAsync(() async {
      _DescripcionOrden =
          await secureStorage.getString('ff_DescripcionOrden') ??
              _DescripcionOrden;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _Login = false;
  bool get Login => _Login;
  set Login(bool _value) {
    _Login = _value;
  }

  List<String> _Valores = ['Todos'];
  List<String> get Valores => _Valores;
  set Valores(List<String> _value) {
    _Valores = _value;
  }

  void addToValores(String _value) {
    _Valores.add(_value);
  }

  void removeFromValores(String _value) {
    _Valores.remove(_value);
  }

  void removeAtIndexFromValores(int _index) {
    _Valores.removeAt(_index);
  }

  void updateValoresAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Valores[_index] = updateFn(_Valores[_index]);
  }

  void insertAtIndexInValores(int _index, String _value) {
    _Valores.insert(_index, _value);
  }

  bool _ImageUpload = false;
  bool get ImageUpload => _ImageUpload;
  set ImageUpload(bool _value) {
    _ImageUpload = _value;
  }

  DocumentReference? _categoriaSeleccionadaCrear;
  DocumentReference? get categoriaSeleccionadaCrear =>
      _categoriaSeleccionadaCrear;
  set categoriaSeleccionadaCrear(DocumentReference? _value) {
    _categoriaSeleccionadaCrear = _value;
  }

  int _variableOrdenes = 0;
  int get variableOrdenes => _variableOrdenes;
  set variableOrdenes(int _value) {
    _variableOrdenes = _value;
  }

  DocumentReference? _recetaSeleccionadaGestion;
  DocumentReference? get recetaSeleccionadaGestion =>
      _recetaSeleccionadaGestion;
  set recetaSeleccionadaGestion(DocumentReference? _value) {
    _recetaSeleccionadaGestion = _value;
  }

  DocumentReference? _ingredienteSeleccionado;
  DocumentReference? get ingredienteSeleccionado => _ingredienteSeleccionado;
  set ingredienteSeleccionado(DocumentReference? _value) {
    _ingredienteSeleccionado = _value;
  }

  List<DocumentReference> _Verification = [];
  List<DocumentReference> get Verification => _Verification;
  set Verification(List<DocumentReference> _value) {
    _Verification = _value;
  }

  void addToVerification(DocumentReference _value) {
    _Verification.add(_value);
  }

  void removeFromVerification(DocumentReference _value) {
    _Verification.remove(_value);
  }

  void removeAtIndexFromVerification(int _index) {
    _Verification.removeAt(_index);
  }

  void updateVerificationAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Verification[_index] = updateFn(_Verification[_index]);
  }

  void insertAtIndexInVerification(int _index, DocumentReference _value) {
    _Verification.insert(_index, _value);
  }

  int _indexMesa = 0;
  int get indexMesa => _indexMesa;
  set indexMesa(int _value) {
    _indexMesa = _value;
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
  }

  List<int> _numTable = [];
  List<int> get numTable => _numTable;
  set numTable(List<int> _value) {
    _numTable = _value;
    secureStorage.setStringList(
        'ff_numTable', _value.map((x) => x.toString()).toList());
  }

  void deleteNumTable() {
    secureStorage.delete(key: 'ff_numTable');
  }

  void addToNumTable(int _value) {
    _numTable.add(_value);
    secureStorage.setStringList(
        'ff_numTable', _numTable.map((x) => x.toString()).toList());
  }

  void removeFromNumTable(int _value) {
    _numTable.remove(_value);
    secureStorage.setStringList(
        'ff_numTable', _numTable.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromNumTable(int _index) {
    _numTable.removeAt(_index);
    secureStorage.setStringList(
        'ff_numTable', _numTable.map((x) => x.toString()).toList());
  }

  void updateNumTableAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _numTable[_index] = updateFn(_numTable[_index]);
    secureStorage.setStringList(
        'ff_numTable', _numTable.map((x) => x.toString()).toList());
  }

  void insertAtIndexInNumTable(int _index, int _value) {
    _numTable.insert(_index, _value);
    secureStorage.setStringList(
        'ff_numTable', _numTable.map((x) => x.toString()).toList());
  }

  String _DescripcionOrden = '';
  String get DescripcionOrden => _DescripcionOrden;
  set DescripcionOrden(String _value) {
    _DescripcionOrden = _value;
    secureStorage.setString('ff_DescripcionOrden', _value);
  }

  void deleteDescripcionOrden() {
    secureStorage.delete(key: 'ff_DescripcionOrden');
  }

  bool _editandoReceta = false;
  bool get editandoReceta => _editandoReceta;
  set editandoReceta(bool _value) {
    _editandoReceta = _value;
  }

  List<DocumentReference> _productosSeleccionadosReceta = [];
  List<DocumentReference> get productosSeleccionadosReceta =>
      _productosSeleccionadosReceta;
  set productosSeleccionadosReceta(List<DocumentReference> _value) {
    _productosSeleccionadosReceta = _value;
  }

  void addToProductosSeleccionadosReceta(DocumentReference _value) {
    _productosSeleccionadosReceta.add(_value);
  }

  void removeFromProductosSeleccionadosReceta(DocumentReference _value) {
    _productosSeleccionadosReceta.remove(_value);
  }

  void removeAtIndexFromProductosSeleccionadosReceta(int _index) {
    _productosSeleccionadosReceta.removeAt(_index);
  }

  void updateProductosSeleccionadosRecetaAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _productosSeleccionadosReceta[_index] =
        updateFn(_productosSeleccionadosReceta[_index]);
  }

  void insertAtIndexInProductosSeleccionadosReceta(
      int _index, DocumentReference _value) {
    _productosSeleccionadosReceta.insert(_index, _value);
  }

  String _imagenEditando = '';
  String get imagenEditando => _imagenEditando;
  set imagenEditando(String _value) {
    _imagenEditando = _value;
  }

  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  set orderRef(DocumentReference? _value) {
    _orderRef = _value;
  }

  String _categoriaSpecial = '';
  String get categoriaSpecial => _categoriaSpecial;
  set categoriaSpecial(String _value) {
    _categoriaSpecial = _value;
  }

  DocumentReference? _platilloSeleccionadoGestion;
  DocumentReference? get platilloSeleccionadoGestion =>
      _platilloSeleccionadoGestion;
  set platilloSeleccionadoGestion(DocumentReference? _value) {
    _platilloSeleccionadoGestion = _value;
  }

  bool _editandoPlatillo = false;
  bool get editandoPlatillo => _editandoPlatillo;
  set editandoPlatillo(bool _value) {
    _editandoPlatillo = _value;
  }

  bool _estaEnPedidos = false;
  bool get estaEnPedidos => _estaEnPedidos;
  set estaEnPedidos(bool _value) {
    _estaEnPedidos = _value;
  }

  int _totalReporte = 0;
  int get totalReporte => _totalReporte;
  set totalReporte(int _value) {
    _totalReporte = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
