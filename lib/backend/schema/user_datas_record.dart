import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDatasRecord extends FirestoreRecord {
  UserDatasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ref" field.
  String? _ref;
  String get ref => _ref ?? '';
  bool hasRef() => _ref != null;

  // "usernames" field.
  List<String>? _usernames;
  List<String> get usernames => _usernames ?? const [];
  bool hasUsernames() => _usernames != null;

  // "emails" field.
  List<String>? _emails;
  List<String> get emails => _emails ?? const [];
  bool hasEmails() => _emails != null;

  // "references" field.
  List<DocumentReference>? _references;
  List<DocumentReference> get references => _references ?? const [];
  bool hasReferences() => _references != null;

  void _initializeFields() {
    _ref = snapshotData['ref'] as String?;
    _usernames = getDataList(snapshotData['usernames']);
    _emails = getDataList(snapshotData['emails']);
    _references = getDataList(snapshotData['references']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userDatas');

  static Stream<UserDatasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDatasRecord.fromSnapshot(s));

  static Future<UserDatasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDatasRecord.fromSnapshot(s));

  static UserDatasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDatasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDatasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDatasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDatasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDatasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDatasRecordData({
  String? ref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ref': ref,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDatasRecordDocumentEquality implements Equality<UserDatasRecord> {
  const UserDatasRecordDocumentEquality();

  @override
  bool equals(UserDatasRecord? e1, UserDatasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ref == e2?.ref &&
        listEquality.equals(e1?.usernames, e2?.usernames) &&
        listEquality.equals(e1?.emails, e2?.emails) &&
        listEquality.equals(e1?.references, e2?.references);
  }

  @override
  int hash(UserDatasRecord? e) => const ListEquality()
      .hash([e?.ref, e?.usernames, e?.emails, e?.references]);

  @override
  bool isValidKey(Object? o) => o is UserDatasRecord;
}
