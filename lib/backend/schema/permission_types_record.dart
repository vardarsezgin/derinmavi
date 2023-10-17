import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PermissionTypesRecord extends FirestoreRecord {
  PermissionTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "permissionTypes" field.
  List<String>? _permissionTypes;
  List<String> get permissionTypes => _permissionTypes ?? const [];
  bool hasPermissionTypes() => _permissionTypes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _permissionTypes = getDataList(snapshotData['permissionTypes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('permissionTypes')
          : FirebaseFirestore.instance.collectionGroup('permissionTypes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('permissionTypes').doc();

  static Stream<PermissionTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PermissionTypesRecord.fromSnapshot(s));

  static Future<PermissionTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PermissionTypesRecord.fromSnapshot(s));

  static PermissionTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PermissionTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PermissionTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PermissionTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PermissionTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PermissionTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPermissionTypesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PermissionTypesRecordDocumentEquality
    implements Equality<PermissionTypesRecord> {
  const PermissionTypesRecordDocumentEquality();

  @override
  bool equals(PermissionTypesRecord? e1, PermissionTypesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.permissionTypes, e2?.permissionTypes);
  }

  @override
  int hash(PermissionTypesRecord? e) =>
      const ListEquality().hash([e?.permissionTypes]);

  @override
  bool isValidKey(Object? o) => o is PermissionTypesRecord;
}
