import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EditModulesRecord extends FirestoreRecord {
  EditModulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  bool hasModuleName() => _moduleName != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _moduleName = snapshotData['moduleName'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _name = snapshotData['name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('editModules')
          : FirebaseFirestore.instance.collectionGroup('editModules');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('editModules').doc();

  static Stream<EditModulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EditModulesRecord.fromSnapshot(s));

  static Future<EditModulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EditModulesRecord.fromSnapshot(s));

  static EditModulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EditModulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EditModulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EditModulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EditModulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EditModulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEditModulesRecordData({
  String? moduleName,
  bool? isActive,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'moduleName': moduleName,
      'isActive': isActive,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class EditModulesRecordDocumentEquality implements Equality<EditModulesRecord> {
  const EditModulesRecordDocumentEquality();

  @override
  bool equals(EditModulesRecord? e1, EditModulesRecord? e2) {
    return e1?.moduleName == e2?.moduleName &&
        e1?.isActive == e2?.isActive &&
        e1?.name == e2?.name;
  }

  @override
  int hash(EditModulesRecord? e) =>
      const ListEquality().hash([e?.moduleName, e?.isActive, e?.name]);

  @override
  bool isValidKey(Object? o) => o is EditModulesRecord;
}
