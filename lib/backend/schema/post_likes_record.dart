import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostLikesRecord extends FirestoreRecord {
  PostLikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRefs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRefs = getDataList(snapshotData['userRefs']);
    _postRef = snapshotData['post_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post_likes')
          : FirebaseFirestore.instance.collectionGroup('post_likes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('post_likes').doc();

  static Stream<PostLikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostLikesRecord.fromSnapshot(s));

  static Future<PostLikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostLikesRecord.fromSnapshot(s));

  static PostLikesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostLikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostLikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostLikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostLikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostLikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostLikesRecordData({
  DocumentReference? postRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_ref': postRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostLikesRecordDocumentEquality implements Equality<PostLikesRecord> {
  const PostLikesRecordDocumentEquality();

  @override
  bool equals(PostLikesRecord? e1, PostLikesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        e1?.postRef == e2?.postRef;
  }

  @override
  int hash(PostLikesRecord? e) =>
      const ListEquality().hash([e?.userRefs, e?.postRef]);

  @override
  bool isValidKey(Object? o) => o is PostLikesRecord;
}
