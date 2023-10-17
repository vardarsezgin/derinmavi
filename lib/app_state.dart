import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
      _languageBool =
          await secureStorage.getBool('ff_languageBool') ?? _languageBool;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    await _safeInitAsync(() async {
      _isModeAutomatic =
          await secureStorage.getBool('ff_isModeAutomatic') ?? _isModeAutomatic;
    });
    await _safeInitAsync(() async {
      _datasRef =
          (await secureStorage.getString('ff_datasRef'))?.ref ?? _datasRef;
    });
    await _safeInitAsync(() async {
      _scanQRtoApprove =
          (await secureStorage.getString('ff_scanQRtoApprove'))?.ref ??
              _scanQRtoApprove;
    });
    await _safeInitAsync(() async {
      _yoneticiRef = (await secureStorage.getString('ff_yoneticiRef'))?.ref ??
          _yoneticiRef;
    });
    await _safeInitAsync(() async {
      _appIcon = await secureStorage.getString('ff_appIcon') ?? _appIcon;
    });
    await _safeInitAsync(() async {
      _editModulesSosyal =
          (await secureStorage.getString('ff_editModulesSosyal'))?.ref ??
              _editModulesSosyal;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _contador = 1;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
  }

  DateTime? _diveDate = DateTime.fromMillisecondsSinceEpoch(1672520400000);
  DateTime? get diveDate => _diveDate;
  set diveDate(DateTime? _value) {
    _diveDate = _value;
  }

  DateTime? _diveTime = DateTime.fromMillisecondsSinceEpoch(1672520400000);
  DateTime? get diveTime => _diveTime;
  set diveTime(DateTime? _value) {
    _diveTime = _value;
  }

  int _diveTemp = 0;
  int get diveTemp => _diveTemp;
  set diveTemp(int _value) {
    _diveTemp = _value;
  }

  bool _favourite = false;
  bool get favourite => _favourite;
  set favourite(bool _value) {
    _favourite = _value;
  }

  String _diveBuddy = '';
  String get diveBuddy => _diveBuddy;
  set diveBuddy(String _value) {
    _diveBuddy = _value;
  }

  int _diveDepth = 0;
  int get diveDepth => _diveDepth;
  set diveDepth(int _value) {
    _diveDepth = _value;
  }

  int _diveDuration = 0;
  int get diveDuration => _diveDuration;
  set diveDuration(int _value) {
    _diveDuration = _value;
  }

  bool _isTraining = false;
  bool get isTraining => _isTraining;
  set isTraining(bool _value) {
    _isTraining = _value;
  }

  int _secWaitDepth = 5;
  int get secWaitDepth => _secWaitDepth;
  set secWaitDepth(int _value) {
    _secWaitDepth = _value;
  }

  int _secWaitDuration = 3;
  int get secWaitDuration => _secWaitDuration;
  set secWaitDuration(int _value) {
    _secWaitDuration = _value;
  }

  String _divePoint = '';
  String get divePoint => _divePoint;
  set divePoint(String _value) {
    _divePoint = _value;
  }

  LatLng? _diveLocation = LatLng(40.2261732, 28.8706519);
  LatLng? get diveLocation => _diveLocation;
  set diveLocation(LatLng? _value) {
    _diveLocation = _value;
  }

  String _diveTank = '';
  String get diveTank => _diveTank;
  set diveTank(String _value) {
    _diveTank = _value;
  }

  int _diveWeight = 0;
  int get diveWeight => _diveWeight;
  set diveWeight(int _value) {
    _diveWeight = _value;
  }

  double _diveRate = 0.0;
  double get diveRate => _diveRate;
  set diveRate(double _value) {
    _diveRate = _value;
  }

  String _diveNotes = '';
  String get diveNotes => _diveNotes;
  set diveNotes(String _value) {
    _diveNotes = _value;
  }

  double _hoveringRate = 0.0;
  double get hoveringRate => _hoveringRate;
  set hoveringRate(double _value) {
    _hoveringRate = _value;
  }

  int _airConsumption = 0;
  int get airConsumption => _airConsumption;
  set airConsumption(int _value) {
    _airConsumption = _value;
  }

  bool _bool2 = false;
  bool get bool2 => _bool2;
  set bool2(bool _value) {
    _bool2 = _value;
  }

  bool _booldivepoint = false;
  bool get booldivepoint => _booldivepoint;
  set booldivepoint(bool _value) {
    _booldivepoint = _value;
  }

  bool _isFavPoint = false;
  bool get isFavPoint => _isFavPoint;
  set isFavPoint(bool _value) {
    _isFavPoint = _value;
  }

  bool _boolNews = false;
  bool get boolNews => _boolNews;
  set boolNews(bool _value) {
    _boolNews = _value;
  }

  bool _boolQR = false;
  bool get boolQR => _boolQR;
  set boolQR(bool _value) {
    _boolQR = _value;
  }

  bool _boolNotification = false;
  bool get boolNotification => _boolNotification;
  set boolNotification(bool _value) {
    _boolNotification = _value;
  }

  bool _boolEditPost = false;
  bool get boolEditPost => _boolEditPost;
  set boolEditPost(bool _value) {
    _boolEditPost = _value;
  }

  bool _languageBool = false;
  bool get languageBool => _languageBool;
  set languageBool(bool _value) {
    _languageBool = _value;
    secureStorage.setBool('ff_languageBool', _value);
  }

  void deleteLanguageBool() {
    secureStorage.delete(key: 'ff_languageBool');
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool _value) {
    _isDarkMode = _value;
    secureStorage.setBool('ff_isDarkMode', _value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  bool _isModeAutomatic = false;
  bool get isModeAutomatic => _isModeAutomatic;
  set isModeAutomatic(bool _value) {
    _isModeAutomatic = _value;
    secureStorage.setBool('ff_isModeAutomatic', _value);
  }

  void deleteIsModeAutomatic() {
    secureStorage.delete(key: 'ff_isModeAutomatic');
  }

  List<DocumentReference> _emptyList = [];
  List<DocumentReference> get emptyList => _emptyList;
  set emptyList(List<DocumentReference> _value) {
    _emptyList = _value;
  }

  void addToEmptyList(DocumentReference _value) {
    _emptyList.add(_value);
  }

  void removeFromEmptyList(DocumentReference _value) {
    _emptyList.remove(_value);
  }

  void removeAtIndexFromEmptyList(int _index) {
    _emptyList.removeAt(_index);
  }

  void updateEmptyListAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _emptyList[_index] = updateFn(_emptyList[_index]);
  }

  void insertAtIndexInEmptyList(int _index, DocumentReference _value) {
    _emptyList.insert(_index, _value);
  }

  String _uploadPhoto = '';
  String get uploadPhoto => _uploadPhoto;
  set uploadPhoto(String _value) {
    _uploadPhoto = _value;
  }

  LatLng? _placePickerThread;
  LatLng? get placePickerThread => _placePickerThread;
  set placePickerThread(LatLng? _value) {
    _placePickerThread = _value;
  }

  String _placePickerNameThread = '';
  String get placePickerNameThread => _placePickerNameThread;
  set placePickerNameThread(String _value) {
    _placePickerNameThread = _value;
  }

  List<DocumentReference> _taggedUsers = [];
  List<DocumentReference> get taggedUsers => _taggedUsers;
  set taggedUsers(List<DocumentReference> _value) {
    _taggedUsers = _value;
  }

  void addToTaggedUsers(DocumentReference _value) {
    _taggedUsers.add(_value);
  }

  void removeFromTaggedUsers(DocumentReference _value) {
    _taggedUsers.remove(_value);
  }

  void removeAtIndexFromTaggedUsers(int _index) {
    _taggedUsers.removeAt(_index);
  }

  void updateTaggedUsersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _taggedUsers[_index] = updateFn(_taggedUsers[_index]);
  }

  void insertAtIndexInTaggedUsers(int _index, DocumentReference _value) {
    _taggedUsers.insert(_index, _value);
  }

  String _emptyUserImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dive-maps-iavvjm/assets/kuikwb78wnql/diver_(1).png';
  String get emptyUserImage => _emptyUserImage;
  set emptyUserImage(String _value) {
    _emptyUserImage = _value;
  }

  DocumentReference? _datasRef =
      FirebaseFirestore.instance.doc('/datas/8EqzwwfUmfwqL654yLW0');
  DocumentReference? get datasRef => _datasRef;
  set datasRef(DocumentReference? _value) {
    _datasRef = _value;
    _value != null
        ? secureStorage.setString('ff_datasRef', _value.path)
        : secureStorage.remove('ff_datasRef');
  }

  void deleteDatasRef() {
    secureStorage.delete(key: 'ff_datasRef');
  }

  List<DocumentReference> _taggedDivers = [];
  List<DocumentReference> get taggedDivers => _taggedDivers;
  set taggedDivers(List<DocumentReference> _value) {
    _taggedDivers = _value;
  }

  void addToTaggedDivers(DocumentReference _value) {
    _taggedDivers.add(_value);
  }

  void removeFromTaggedDivers(DocumentReference _value) {
    _taggedDivers.remove(_value);
  }

  void removeAtIndexFromTaggedDivers(int _index) {
    _taggedDivers.removeAt(_index);
  }

  void updateTaggedDiversAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _taggedDivers[_index] = updateFn(_taggedDivers[_index]);
  }

  void insertAtIndexInTaggedDivers(int _index, DocumentReference _value) {
    _taggedDivers.insert(_index, _value);
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String _value) {
    _phoneNumber = _value;
  }

  DocumentReference? _scanQRtoApprove =
      FirebaseFirestore.instance.doc('/editModules/la8C1Ox8aoJqWXWM3qzb');
  DocumentReference? get scanQRtoApprove => _scanQRtoApprove;
  set scanQRtoApprove(DocumentReference? _value) {
    _scanQRtoApprove = _value;
    _value != null
        ? secureStorage.setString('ff_scanQRtoApprove', _value.path)
        : secureStorage.remove('ff_scanQRtoApprove');
  }

  void deleteScanQRtoApprove() {
    secureStorage.delete(key: 'ff_scanQRtoApprove');
  }

  DocumentReference? _yoneticiRef =
      FirebaseFirestore.instance.doc('/users/XK9AwBTa2khCvebf5wKj3zrq0Dm2');
  DocumentReference? get yoneticiRef => _yoneticiRef;
  set yoneticiRef(DocumentReference? _value) {
    _yoneticiRef = _value;
    _value != null
        ? secureStorage.setString('ff_yoneticiRef', _value.path)
        : secureStorage.remove('ff_yoneticiRef');
  }

  void deleteYoneticiRef() {
    secureStorage.delete(key: 'ff_yoneticiRef');
  }

  String _appIcon =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dive-maps-iavvjm/assets/kgcmuyjubkxj/Icon-App-40x40@3x.png';
  String get appIcon => _appIcon;
  set appIcon(String _value) {
    _appIcon = _value;
    secureStorage.setString('ff_appIcon', _value);
  }

  void deleteAppIcon() {
    secureStorage.delete(key: 'ff_appIcon');
  }

  DocumentReference? _editModulesSosyal =
      FirebaseFirestore.instance.doc('/editModules/atBK7R4dvJ4lmxayM34s');
  DocumentReference? get editModulesSosyal => _editModulesSosyal;
  set editModulesSosyal(DocumentReference? _value) {
    _editModulesSosyal = _value;
    _value != null
        ? secureStorage.setString('ff_editModulesSosyal', _value.path)
        : secureStorage.remove('ff_editModulesSosyal');
  }

  void deleteEditModulesSosyal() {
    secureStorage.delete(key: 'ff_editModulesSosyal');
  }

  DocumentReference? _userDatas =
      FirebaseFirestore.instance.doc('/userDatas/O026AUCbZ7Q1UqPt8yxT');
  DocumentReference? get userDatas => _userDatas;
  set userDatas(DocumentReference? _value) {
    _userDatas = _value;
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
