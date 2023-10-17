import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrivateNotificationsRecord extends FirestoreRecord {
  PrivateNotificationsRecord._(
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

  // "senderRef" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "senderUsername" field.
  String? _senderUsername;
  String get senderUsername => _senderUsername ?? '';
  bool hasSenderUsername() => _senderUsername != null;

  // "senderName" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "isHidden" field.
  bool? _isHidden;
  bool get isHidden => _isHidden ?? false;
  bool hasIsHidden() => _isHidden != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notText = snapshotData['notText'] as String?;
    _notHeader = snapshotData['notHeader'] as String?;
    _photo = snapshotData['photo'] as String?;
    _actionLink = snapshotData['actionLink'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _senderRef = snapshotData['senderRef'] as DocumentReference?;
    _senderUsername = snapshotData['senderUsername'] as String?;
    _senderName = snapshotData['senderName'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isHidden = snapshotData['isHidden'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('private_notifications')
          : FirebaseFirestore.instance.collectionGroup('private_notifications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('private_notifications').doc();

  static Stream<PrivateNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => PrivateNotificationsRecord.fromSnapshot(s));

  static Future<PrivateNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PrivateNotificationsRecord.fromSnapshot(s));

  static PrivateNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrivateNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrivateNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrivateNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrivateNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrivateNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrivateNotificationsRecordData({
  String? notText,
  String? notHeader,
  String? photo,
  String? actionLink,
  DocumentReference? senderRef,
  String? senderUsername,
  String? senderName,
  DateTime? timestamp,
  bool? isHidden,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notText': notText,
      'notHeader': notHeader,
      'photo': photo,
      'actionLink': actionLink,
      'senderRef': senderRef,
      'senderUsername': senderUsername,
      'senderName': senderName,
      'timestamp': timestamp,
      'isHidden': isHidden,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrivateNotificationsRecordDocumentEquality
    implements Equality<PrivateNotificationsRecord> {
  const PrivateNotificationsRecordDocumentEquality();

  @override
  bool equals(PrivateNotificationsRecord? e1, PrivateNotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notText == e2?.notText &&
        e1?.notHeader == e2?.notHeader &&
        e1?.photo == e2?.photo &&
        e1?.actionLink == e2?.actionLink &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.senderRef == e2?.senderRef &&
        e1?.senderUsername == e2?.senderUsername &&
        e1?.senderName == e2?.senderName &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isHidden == e2?.isHidden;
  }

  @override
  int hash(PrivateNotificationsRecord? e) => const ListEquality().hash([
        e?.notText,
        e?.notHeader,
        e?.photo,
        e?.actionLink,
        e?.categories,
        e?.senderRef,
        e?.senderUsername,
        e?.senderName,
        e?.timestamp,
        e?.isHidden
      ]);

  @override
  bool isValidKey(Object? o) => o is PrivateNotificationsRecord;
}
