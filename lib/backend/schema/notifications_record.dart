import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notText" field.
  String? _notText;
  String get notText => _notText ?? '';
  bool hasNotText() => _notText != null;

  // "notHeader" field.
  String? _notHeader;
  String get notHeader => _notHeader ?? '';
  bool hasNotHeader() => _notHeader != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "actionLink" field.
  String? _actionLink;
  String get actionLink => _actionLink ?? '';
  bool hasActionLink() => _actionLink != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "expireDate" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "expireHour" field.
  DateTime? _expireHour;
  DateTime? get expireHour => _expireHour;
  bool hasExpireHour() => _expireHour != null;

  // "isReaded" field.
  bool? _isReaded;
  bool get isReaded => _isReaded ?? false;
  bool hasIsReaded() => _isReaded != null;

  // "alici" field.
  DocumentReference? _alici;
  DocumentReference? get alici => _alici;
  bool hasAlici() => _alici != null;

  // "alicilar" field.
  List<DocumentReference>? _alicilar;
  List<DocumentReference> get alicilar => _alicilar ?? const [];
  bool hasAlicilar() => _alicilar != null;

  // "gonderen" field.
  DocumentReference? _gonderen;
  DocumentReference? get gonderen => _gonderen;
  bool hasGonderen() => _gonderen != null;

  void _initializeFields() {
    _notText = snapshotData['notText'] as String?;
    _notHeader = snapshotData['notHeader'] as String?;
    _photo = snapshotData['photo'] as String?;
    _actionLink = snapshotData['actionLink'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _expireDate = snapshotData['expireDate'] as DateTime?;
    _expireHour = snapshotData['expireHour'] as DateTime?;
    _isReaded = snapshotData['isReaded'] as bool?;
    _alici = snapshotData['alici'] as DocumentReference?;
    _alicilar = getDataList(snapshotData['alicilar']);
    _gonderen = snapshotData['gonderen'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notText,
  String? notHeader,
  String? photo,
  String? actionLink,
  DateTime? timestamp,
  DateTime? expireDate,
  DateTime? expireHour,
  bool? isReaded,
  DocumentReference? alici,
  DocumentReference? gonderen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notText': notText,
      'notHeader': notHeader,
      'photo': photo,
      'actionLink': actionLink,
      'timestamp': timestamp,
      'expireDate': expireDate,
      'expireHour': expireHour,
      'isReaded': isReaded,
      'alici': alici,
      'gonderen': gonderen,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notText == e2?.notText &&
        e1?.notHeader == e2?.notHeader &&
        e1?.photo == e2?.photo &&
        e1?.actionLink == e2?.actionLink &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.timestamp == e2?.timestamp &&
        e1?.expireDate == e2?.expireDate &&
        e1?.expireHour == e2?.expireHour &&
        e1?.isReaded == e2?.isReaded &&
        e1?.alici == e2?.alici &&
        listEquality.equals(e1?.alicilar, e2?.alicilar) &&
        e1?.gonderen == e2?.gonderen;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notText,
        e?.notHeader,
        e?.photo,
        e?.actionLink,
        e?.categories,
        e?.timestamp,
        e?.expireDate,
        e?.expireHour,
        e?.isReaded,
        e?.alici,
        e?.alicilar,
        e?.gonderen
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
