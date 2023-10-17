import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostTagsRecord extends FirestoreRecord {
  PostTagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tags = getDataList(snapshotData['tags']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postTags')
          : FirebaseFirestore.instance.collectionGroup('postTags');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('postTags').doc();

  static Stream<PostTagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostTagsRecord.fromSnapshot(s));

  static Future<PostTagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostTagsRecord.fromSnapshot(s));

  static PostTagsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostTagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostTagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostTagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostTagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostTagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostTagsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PostTagsRecordDocumentEquality implements Equality<PostTagsRecord> {
  const PostTagsRecordDocumentEquality();

  @override
  bool equals(PostTagsRecord? e1, PostTagsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(PostTagsRecord? e) => const ListEquality().hash([e?.tags]);

  @override
  bool isValidKey(Object? o) => o is PostTagsRecord;
}
