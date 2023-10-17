import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeneralNotifUserlistRecord extends FirestoreRecord {
  GeneralNotifUserlistRecord._(
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
          ? parent.collection('general_notif_userlist')
          : FirebaseFirestore.instance
              .collectionGroup('general_notif_userlist');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('general_notif_userlist').doc();

  static Stream<GeneralNotifUserlistRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GeneralNotifUserlistRecord.fromSnapshot(s));

  static Future<GeneralNotifUserlistRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GeneralNotifUserlistRecord.fromSnapshot(s));

  static GeneralNotifUserlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GeneralNotifUserlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GeneralNotifUserlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GeneralNotifUserlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GeneralNotifUserlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GeneralNotifUserlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGeneralNotifUserlistRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class GeneralNotifUserlistRecordDocumentEquality
    implements Equality<GeneralNotifUserlistRecord> {
  const GeneralNotifUserlistRecordDocumentEquality();

  @override
  bool equals(GeneralNotifUserlistRecord? e1, GeneralNotifUserlistRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userRef, e2?.userRef);
  }

  @override
  int hash(GeneralNotifUserlistRecord? e) =>
      const ListEquality().hash([e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is GeneralNotifUserlistRecord;
}
