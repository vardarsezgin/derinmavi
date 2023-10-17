import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FederationsRecord extends FirestoreRecord {
  FederationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fedName" field.
  String? _fedName;
  String get fedName => _fedName ?? '';
  bool hasFedName() => _fedName != null;

  // "certLevels" field.
  List<String>? _certLevels;
  List<String> get certLevels => _certLevels ?? const [];
  bool hasCertLevels() => _certLevels != null;

  // "fedndex" field.
  int? _fedndex;
  int get fedndex => _fedndex ?? 0;
  bool hasFedndex() => _fedndex != null;

  void _initializeFields() {
    _fedName = snapshotData['fedName'] as String?;
    _certLevels = getDataList(snapshotData['certLevels']);
    _fedndex = castToType<int>(snapshotData['fedndex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('federations');

  static Stream<FederationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FederationsRecord.fromSnapshot(s));

  static Future<FederationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FederationsRecord.fromSnapshot(s));

  static FederationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FederationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FederationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FederationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FederationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FederationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFederationsRecordData({
  String? fedName,
  int? fedndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fedName': fedName,
      'fedndex': fedndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class FederationsRecordDocumentEquality implements Equality<FederationsRecord> {
  const FederationsRecordDocumentEquality();

  @override
  bool equals(FederationsRecord? e1, FederationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fedName == e2?.fedName &&
        listEquality.equals(e1?.certLevels, e2?.certLevels) &&
        e1?.fedndex == e2?.fedndex;
  }

  @override
  int hash(FederationsRecord? e) =>
      const ListEquality().hash([e?.fedName, e?.certLevels, e?.fedndex]);

  @override
  bool isValidKey(Object? o) => o is FederationsRecord;
}
