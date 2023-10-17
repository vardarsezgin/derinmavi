import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "comment_author" field.
  DocumentReference? _commentAuthor;
  DocumentReference? get commentAuthor => _commentAuthor;
  bool hasCommentAuthor() => _commentAuthor != null;

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "comment_likes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentText = snapshotData['comment_text'] as String?;
    _commentAuthor = snapshotData['comment_author'] as DocumentReference?;
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _commentLikes = getDataList(snapshotData['comment_likes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comments').doc();

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentText,
  DocumentReference? commentAuthor,
  DateTime? commentTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_text': commentText,
      'comment_author': commentAuthor,
      'comment_time': commentTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentText == e2?.commentText &&
        e1?.commentAuthor == e2?.commentAuthor &&
        e1?.commentTime == e2?.commentTime &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash(
      [e?.commentText, e?.commentAuthor, e?.commentTime, e?.commentLikes]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
