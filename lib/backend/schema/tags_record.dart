import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tagName" field.
  String? _tagName;
  String get tagName => _tagName ?? '';
  bool hasTagName() => _tagName != null;

  // "isExist" field.
  bool? _isExist;
  bool get isExist => _isExist ?? false;
  bool hasIsExist() => _isExist != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tagName = snapshotData['tagName'] as String?;
    _isExist = snapshotData['isExist'] as bool?;
    _tags = getDataList(snapshotData['tags']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tags')
          : FirebaseFirestore.instance.collectionGroup('tags');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tags').doc();

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  String? tagName,
  bool? isExist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tagName': tagName,
      'isExist': isExist,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tagName == e2?.tagName &&
        e1?.isExist == e2?.isExist &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(TagsRecord? e) =>
      const ListEquality().hash([e?.tagName, e?.isExist, e?.tags]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
