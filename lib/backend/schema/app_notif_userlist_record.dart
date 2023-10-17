import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppNotifUserlistRecord extends FirestoreRecord {
  AppNotifUserlistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  List<DocumentReference>? _userRef;
  List<DocumentReference> get userRef => _userRef ?? const [];
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = getDataList(snapshotData['userRef']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('app_notif_userlist')
          : FirebaseFirestore.instance.collectionGroup('app_notif_userlist');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('app_notif_userlist').doc();

  static Stream<AppNotifUserlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppNotifUserlistRecord.fromSnapshot(s));

  static Future<AppNotifUserlistRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppNotifUserlistRecord.fromSnapshot(s));

  static AppNotifUserlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppNotifUserlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppNotifUserlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppNotifUserlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppNotifUserlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppNotifUserlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppNotifUserlistRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AppNotifUserlistRecordDocumentEquality
    implements Equality<AppNotifUserlistRecord> {
  const AppNotifUserlistRecordDocumentEquality();

  @override
  bool equals(AppNotifUserlistRecord? e1, AppNotifUserlistRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userRef, e2?.userRef);
  }

  @override
  int hash(AppNotifUserlistRecord? e) =>
      const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is AppNotifUserlistRecord;
}
