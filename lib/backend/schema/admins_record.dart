import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminsRecord extends FirestoreRecord {
  AdminsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "yoneticilerRef" field.
  List<DocumentReference>? _yoneticilerRef;
  List<DocumentReference> get yoneticilerRef => _yoneticilerRef ?? const [];
  bool hasYoneticilerRef() => _yoneticilerRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _yoneticilerRef = getDataList(snapshotData['yoneticilerRef']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('admins')
          : FirebaseFirestore.instance.collectionGroup('admins');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('admins').doc();

  static Stream<AdminsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminsRecord.fromSnapshot(s));

  static Future<AdminsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminsRecord.fromSnapshot(s));

  static AdminsRecord fromSnapshot(DocumentSnapshot snapshot) => AdminsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AdminsRecordDocumentEquality implements Equality<AdminsRecord> {
  const AdminsRecordDocumentEquality();

  @override
  bool equals(AdminsRecord? e1, AdminsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.yoneticilerRef, e2?.yoneticilerRef);
  }

  @override
  int hash(AdminsRecord? e) => const ListEquality().hash([e?.yoneticilerRef]);

  @override
  bool isValidKey(Object? o) => o is AdminsRecord;
}
