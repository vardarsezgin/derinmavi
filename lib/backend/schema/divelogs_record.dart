import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DivelogsRecord extends FirestoreRecord {
  DivelogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "diveDate" field.
  DateTime? _diveDate;
  DateTime? get diveDate => _diveDate;
  bool hasDiveDate() => _diveDate != null;

  // "diveTime" field.
  DateTime? _diveTime;
  DateTime? get diveTime => _diveTime;
  bool hasDiveTime() => _diveTime != null;

  // "diveTemp" field.
  int? _diveTemp;
  int get diveTemp => _diveTemp ?? 0;
  bool hasDiveTemp() => _diveTemp != null;

  // "favourite" field.
  bool? _favourite;
  bool get favourite => _favourite ?? false;
  bool hasFavourite() => _favourite != null;

  // "diveBuddy" field.
  String? _diveBuddy;
  String get diveBuddy => _diveBuddy ?? '';
  bool hasDiveBuddy() => _diveBuddy != null;

  // "diveDepth" field.
  int? _diveDepth;
  int get diveDepth => _diveDepth ?? 0;
  bool hasDiveDepth() => _diveDepth != null;

  // "dveDuration" field.
  int? _dveDuration;
  int get dveDuration => _dveDuration ?? 0;
  bool hasDveDuration() => _dveDuration != null;

  // "isTraining" field.
  bool? _isTraining;
  bool get isTraining => _isTraining ?? false;
  bool hasIsTraining() => _isTraining != null;

  // "secWaitDepth" field.
  int? _secWaitDepth;
  int get secWaitDepth => _secWaitDepth ?? 0;
  bool hasSecWaitDepth() => _secWaitDepth != null;

  // "secWaitDuration" field.
  int? _secWaitDuration;
  int get secWaitDuration => _secWaitDuration ?? 0;
  bool hasSecWaitDuration() => _secWaitDuration != null;

  // "divePoint" field.
  String? _divePoint;
  String get divePoint => _divePoint ?? '';
  bool hasDivePoint() => _divePoint != null;

  // "diveLocation" field.
  LatLng? _diveLocation;
  LatLng? get diveLocation => _diveLocation;
  bool hasDiveLocation() => _diveLocation != null;

  // "diveLocationName" field.
  String? _diveLocationName;
  String get diveLocationName => _diveLocationName ?? '';
  bool hasDiveLocationName() => _diveLocationName != null;

  // "diveTankType" field.
  String? _diveTankType;
  String get diveTankType => _diveTankType ?? '';
  bool hasDiveTankType() => _diveTankType != null;

  // "diveTankLiter" field.
  int? _diveTankLiter;
  int get diveTankLiter => _diveTankLiter ?? 0;
  bool hasDiveTankLiter() => _diveTankLiter != null;

  // "diveWeight" field.
  int? _diveWeight;
  int get diveWeight => _diveWeight ?? 0;
  bool hasDiveWeight() => _diveWeight != null;

  // "diveRate" field.
  double? _diveRate;
  double get diveRate => _diveRate ?? 0.0;
  bool hasDiveRate() => _diveRate != null;

  // "hoveringRate" field.
  double? _hoveringRate;
  double get hoveringRate => _hoveringRate ?? 0.0;
  bool hasHoveringRate() => _hoveringRate != null;

  // "diveNotes" field.
  String? _diveNotes;
  String get diveNotes => _diveNotes ?? '';
  bool hasDiveNotes() => _diveNotes != null;

  // "airConsumption" field.
  int? _airConsumption;
  int get airConsumption => _airConsumption ?? 0;
  bool hasAirConsumption() => _airConsumption != null;

  // "diveSuitLenght" field.
  bool? _diveSuitLenght;
  bool get diveSuitLenght => _diveSuitLenght ?? false;
  bool hasDiveSuitLenght() => _diveSuitLenght != null;

  // "isSecWaitMade" field.
  bool? _isSecWaitMade;
  bool get isSecWaitMade => _isSecWaitMade ?? false;
  bool hasIsSecWaitMade() => _isSecWaitMade != null;

  // "diveLeader" field.
  String? _diveLeader;
  String get diveLeader => _diveLeader ?? '';
  bool hasDiveLeader() => _diveLeader != null;

  // "isSigned" field.
  bool? _isSigned;
  bool get isSigned => _isSigned ?? false;
  bool hasIsSigned() => _isSigned != null;

  // "diveRefNumber" field.
  String? _diveRefNumber;
  String get diveRefNumber => _diveRefNumber ?? '';
  bool hasDiveRefNumber() => _diveRefNumber != null;

  // "LeaderApproval" field.
  bool? _leaderApproval;
  bool get leaderApproval => _leaderApproval ?? false;
  bool hasLeaderApproval() => _leaderApproval != null;

  // "diveNo" field.
  int? _diveNo;
  int get diveNo => _diveNo ?? 0;
  bool hasDiveNo() => _diveNo != null;

  // "diveOwnerName" field.
  String? _diveOwnerName;
  String get diveOwnerName => _diveOwnerName ?? '';
  bool hasDiveOwnerName() => _diveOwnerName != null;

  // "diveOwnerUsername" field.
  String? _diveOwnerUsername;
  String get diveOwnerUsername => _diveOwnerUsername ?? '';
  bool hasDiveOwnerUsername() => _diveOwnerUsername != null;

  // "diveOwner" field.
  DocumentReference? _diveOwner;
  DocumentReference? get diveOwner => _diveOwner;
  bool hasDiveOwner() => _diveOwner != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  bool hasIsLiked() => _isLiked != null;

  // "taggedDivers" field.
  List<DocumentReference>? _taggedDivers;
  List<DocumentReference> get taggedDivers => _taggedDivers ?? const [];
  bool hasTaggedDivers() => _taggedDivers != null;

  // "approvedBy" field.
  DocumentReference? _approvedBy;
  DocumentReference? get approvedBy => _approvedBy;
  bool hasApprovedBy() => _approvedBy != null;

  // "approvedDate" field.
  DateTime? _approvedDate;
  DateTime? get approvedDate => _approvedDate;
  bool hasApprovedDate() => _approvedDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _diveDate = snapshotData['diveDate'] as DateTime?;
    _diveTime = snapshotData['diveTime'] as DateTime?;
    _diveTemp = castToType<int>(snapshotData['diveTemp']);
    _favourite = snapshotData['favourite'] as bool?;
    _diveBuddy = snapshotData['diveBuddy'] as String?;
    _diveDepth = castToType<int>(snapshotData['diveDepth']);
    _dveDuration = castToType<int>(snapshotData['dveDuration']);
    _isTraining = snapshotData['isTraining'] as bool?;
    _secWaitDepth = castToType<int>(snapshotData['secWaitDepth']);
    _secWaitDuration = castToType<int>(snapshotData['secWaitDuration']);
    _divePoint = snapshotData['divePoint'] as String?;
    _diveLocation = snapshotData['diveLocation'] as LatLng?;
    _diveLocationName = snapshotData['diveLocationName'] as String?;
    _diveTankType = snapshotData['diveTankType'] as String?;
    _diveTankLiter = castToType<int>(snapshotData['diveTankLiter']);
    _diveWeight = castToType<int>(snapshotData['diveWeight']);
    _diveRate = castToType<double>(snapshotData['diveRate']);
    _hoveringRate = castToType<double>(snapshotData['hoveringRate']);
    _diveNotes = snapshotData['diveNotes'] as String?;
    _airConsumption = castToType<int>(snapshotData['airConsumption']);
    _diveSuitLenght = snapshotData['diveSuitLenght'] as bool?;
    _isSecWaitMade = snapshotData['isSecWaitMade'] as bool?;
    _diveLeader = snapshotData['diveLeader'] as String?;
    _isSigned = snapshotData['isSigned'] as bool?;
    _diveRefNumber = snapshotData['diveRefNumber'] as String?;
    _leaderApproval = snapshotData['LeaderApproval'] as bool?;
    _diveNo = castToType<int>(snapshotData['diveNo']);
    _diveOwnerName = snapshotData['diveOwnerName'] as String?;
    _diveOwnerUsername = snapshotData['diveOwnerUsername'] as String?;
    _diveOwner = snapshotData['diveOwner'] as DocumentReference?;
    _isLiked = snapshotData['isLiked'] as bool?;
    _taggedDivers = getDataList(snapshotData['taggedDivers']);
    _approvedBy = snapshotData['approvedBy'] as DocumentReference?;
    _approvedDate = snapshotData['approvedDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('divelogs')
          : FirebaseFirestore.instance.collectionGroup('divelogs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('divelogs').doc();

  static Stream<DivelogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DivelogsRecord.fromSnapshot(s));

  static Future<DivelogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DivelogsRecord.fromSnapshot(s));

  static DivelogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DivelogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DivelogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DivelogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DivelogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DivelogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDivelogsRecordData({
  DateTime? diveDate,
  DateTime? diveTime,
  int? diveTemp,
  bool? favourite,
  String? diveBuddy,
  int? diveDepth,
  int? dveDuration,
  bool? isTraining,
  int? secWaitDepth,
  int? secWaitDuration,
  String? divePoint,
  LatLng? diveLocation,
  String? diveLocationName,
  String? diveTankType,
  int? diveTankLiter,
  int? diveWeight,
  double? diveRate,
  double? hoveringRate,
  String? diveNotes,
  int? airConsumption,
  bool? diveSuitLenght,
  bool? isSecWaitMade,
  String? diveLeader,
  bool? isSigned,
  String? diveRefNumber,
  bool? leaderApproval,
  int? diveNo,
  String? diveOwnerName,
  String? diveOwnerUsername,
  DocumentReference? diveOwner,
  bool? isLiked,
  DocumentReference? approvedBy,
  DateTime? approvedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'diveDate': diveDate,
      'diveTime': diveTime,
      'diveTemp': diveTemp,
      'favourite': favourite,
      'diveBuddy': diveBuddy,
      'diveDepth': diveDepth,
      'dveDuration': dveDuration,
      'isTraining': isTraining,
      'secWaitDepth': secWaitDepth,
      'secWaitDuration': secWaitDuration,
      'divePoint': divePoint,
      'diveLocation': diveLocation,
      'diveLocationName': diveLocationName,
      'diveTankType': diveTankType,
      'diveTankLiter': diveTankLiter,
      'diveWeight': diveWeight,
      'diveRate': diveRate,
      'hoveringRate': hoveringRate,
      'diveNotes': diveNotes,
      'airConsumption': airConsumption,
      'diveSuitLenght': diveSuitLenght,
      'isSecWaitMade': isSecWaitMade,
      'diveLeader': diveLeader,
      'isSigned': isSigned,
      'diveRefNumber': diveRefNumber,
      'LeaderApproval': leaderApproval,
      'diveNo': diveNo,
      'diveOwnerName': diveOwnerName,
      'diveOwnerUsername': diveOwnerUsername,
      'diveOwner': diveOwner,
      'isLiked': isLiked,
      'approvedBy': approvedBy,
      'approvedDate': approvedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class DivelogsRecordDocumentEquality implements Equality<DivelogsRecord> {
  const DivelogsRecordDocumentEquality();

  @override
  bool equals(DivelogsRecord? e1, DivelogsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.diveDate == e2?.diveDate &&
        e1?.diveTime == e2?.diveTime &&
        e1?.diveTemp == e2?.diveTemp &&
        e1?.favourite == e2?.favourite &&
        e1?.diveBuddy == e2?.diveBuddy &&
        e1?.diveDepth == e2?.diveDepth &&
        e1?.dveDuration == e2?.dveDuration &&
        e1?.isTraining == e2?.isTraining &&
        e1?.secWaitDepth == e2?.secWaitDepth &&
        e1?.secWaitDuration == e2?.secWaitDuration &&
        e1?.divePoint == e2?.divePoint &&
        e1?.diveLocation == e2?.diveLocation &&
        e1?.diveLocationName == e2?.diveLocationName &&
        e1?.diveTankType == e2?.diveTankType &&
        e1?.diveTankLiter == e2?.diveTankLiter &&
        e1?.diveWeight == e2?.diveWeight &&
        e1?.diveRate == e2?.diveRate &&
        e1?.hoveringRate == e2?.hoveringRate &&
        e1?.diveNotes == e2?.diveNotes &&
        e1?.airConsumption == e2?.airConsumption &&
        e1?.diveSuitLenght == e2?.diveSuitLenght &&
        e1?.isSecWaitMade == e2?.isSecWaitMade &&
        e1?.diveLeader == e2?.diveLeader &&
        e1?.isSigned == e2?.isSigned &&
        e1?.diveRefNumber == e2?.diveRefNumber &&
        e1?.leaderApproval == e2?.leaderApproval &&
        e1?.diveNo == e2?.diveNo &&
        e1?.diveOwnerName == e2?.diveOwnerName &&
        e1?.diveOwnerUsername == e2?.diveOwnerUsername &&
        e1?.diveOwner == e2?.diveOwner &&
        e1?.isLiked == e2?.isLiked &&
        listEquality.equals(e1?.taggedDivers, e2?.taggedDivers) &&
        e1?.approvedBy == e2?.approvedBy &&
        e1?.approvedDate == e2?.approvedDate;
  }

  @override
  int hash(DivelogsRecord? e) => const ListEquality().hash([
        e?.diveDate,
        e?.diveTime,
        e?.diveTemp,
        e?.favourite,
        e?.diveBuddy,
        e?.diveDepth,
        e?.dveDuration,
        e?.isTraining,
        e?.secWaitDepth,
        e?.secWaitDuration,
        e?.divePoint,
        e?.diveLocation,
        e?.diveLocationName,
        e?.diveTankType,
        e?.diveTankLiter,
        e?.diveWeight,
        e?.diveRate,
        e?.hoveringRate,
        e?.diveNotes,
        e?.airConsumption,
        e?.diveSuitLenght,
        e?.isSecWaitMade,
        e?.diveLeader,
        e?.isSigned,
        e?.diveRefNumber,
        e?.leaderApproval,
        e?.diveNo,
        e?.diveOwnerName,
        e?.diveOwnerUsername,
        e?.diveOwner,
        e?.isLiked,
        e?.taggedDivers,
        e?.approvedBy,
        e?.approvedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is DivelogsRecord;
}
