import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatasRecord extends FirestoreRecord {
  DatasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "broveSev" field.
  List<String>? _broveSev;
  List<String> get broveSev => _broveSev ?? const [];
  bool hasBroveSev() => _broveSev != null;

  // "fedName" field.
  List<String>? _fedName;
  List<String> get fedName => _fedName ?? const [];
  bool hasFedName() => _fedName != null;

  // "KonfedName" field.
  List<String>? _konfedName;
  List<String> get konfedName => _konfedName ?? const [];
  bool hasKonfedName() => _konfedName != null;

  // "kulupVeOkullar" field.
  List<String>? _kulupVeOkullar;
  List<String> get kulupVeOkullar => _kulupVeOkullar ?? const [];
  bool hasKulupVeOkullar() => _kulupVeOkullar != null;

  // "userType" field.
  List<String>? _userType;
  List<String> get userType => _userType ?? const [];
  bool hasUserType() => _userType != null;

  // "randomTextMainPage" field.
  List<String>? _randomTextMainPage;
  List<String> get randomTextMainPage => _randomTextMainPage ?? const [];
  bool hasRandomTextMainPage() => _randomTextMainPage != null;

  // "pinCode" field.
  int? _pinCode;
  int get pinCode => _pinCode ?? 0;
  bool hasPinCode() => _pinCode != null;

  void _initializeFields() {
    _broveSev = getDataList(snapshotData['broveSev']);
    _fedName = getDataList(snapshotData['fedName']);
    _konfedName = getDataList(snapshotData['KonfedName']);
    _kulupVeOkullar = getDataList(snapshotData['kulupVeOkullar']);
    _userType = getDataList(snapshotData['userType']);
    _randomTextMainPage = getDataList(snapshotData['randomTextMainPage']);
    _pinCode = castToType<int>(snapshotData['pinCode']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('datas');

  static Stream<DatasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatasRecord.fromSnapshot(s));

  static Future<DatasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatasRecord.fromSnapshot(s));

  static DatasRecord fromSnapshot(DocumentSnapshot snapshot) => DatasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatasRecordData({
  int? pinCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pinCode': pinCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatasRecordDocumentEquality implements Equality<DatasRecord> {
  const DatasRecordDocumentEquality();

  @override
  bool equals(DatasRecord? e1, DatasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.broveSev, e2?.broveSev) &&
        listEquality.equals(e1?.fedName, e2?.fedName) &&
        listEquality.equals(e1?.konfedName, e2?.konfedName) &&
        listEquality.equals(e1?.kulupVeOkullar, e2?.kulupVeOkullar) &&
        listEquality.equals(e1?.userType, e2?.userType) &&
        listEquality.equals(e1?.randomTextMainPage, e2?.randomTextMainPage) &&
        e1?.pinCode == e2?.pinCode;
  }

  @override
  int hash(DatasRecord? e) => const ListEquality().hash([
        e?.broveSev,
        e?.fedName,
        e?.konfedName,
        e?.kulupVeOkullar,
        e?.userType,
        e?.randomTextMainPage,
        e?.pinCode
      ]);

  @override
  bool isValidKey(Object? o) => o is DatasRecord;
}
