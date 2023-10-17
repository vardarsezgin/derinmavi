import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestForumRepliesRecord extends FirestoreRecord {
  TestForumRepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reply_content" field.
  String? _replyContent;
  String get replyContent => _replyContent ?? '';
  bool hasReplyContent() => _replyContent != null;

  // "reply_thread" field.
  DocumentReference? _replyThread;
  DocumentReference? get replyThread => _replyThread;
  bool hasReplyThread() => _replyThread != null;

  // "reply_user" field.
  DocumentReference? _replyUser;
  DocumentReference? get replyUser => _replyUser;
  bool hasReplyUser() => _replyUser != null;

  // "reply_photo" field.
  String? _replyPhoto;
  String get replyPhoto => _replyPhoto ?? '';
  bool hasReplyPhoto() => _replyPhoto != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "reply_to" field.
  DocumentReference? _replyTo;
  DocumentReference? get replyTo => _replyTo;
  bool hasReplyTo() => _replyTo != null;

  // "time_replied" field.
  DateTime? _timeReplied;
  DateTime? get timeReplied => _timeReplied;
  bool hasTimeReplied() => _timeReplied != null;

  // "replied_by" field.
  List<DocumentReference>? _repliedBy;
  List<DocumentReference> get repliedBy => _repliedBy ?? const [];
  bool hasRepliedBy() => _repliedBy != null;

  // "reply_replies" field.
  List<DocumentReference>? _replyReplies;
  List<DocumentReference> get replyReplies => _replyReplies ?? const [];
  bool hasReplyReplies() => _replyReplies != null;

  // "parent_reply" field.
  DocumentReference? _parentReply;
  DocumentReference? get parentReply => _parentReply;
  bool hasParentReply() => _parentReply != null;

  void _initializeFields() {
    _replyContent = snapshotData['reply_content'] as String?;
    _replyThread = snapshotData['reply_thread'] as DocumentReference?;
    _replyUser = snapshotData['reply_user'] as DocumentReference?;
    _replyPhoto = snapshotData['reply_photo'] as String?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _replyTo = snapshotData['reply_to'] as DocumentReference?;
    _timeReplied = snapshotData['time_replied'] as DateTime?;
    _repliedBy = getDataList(snapshotData['replied_by']);
    _replyReplies = getDataList(snapshotData['reply_replies']);
    _parentReply = snapshotData['parent_reply'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testForumReplies');

  static Stream<TestForumRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestForumRepliesRecord.fromSnapshot(s));

  static Future<TestForumRepliesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TestForumRepliesRecord.fromSnapshot(s));

  static TestForumRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestForumRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestForumRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestForumRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestForumRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestForumRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestForumRepliesRecordData({
  String? replyContent,
  DocumentReference? replyThread,
  DocumentReference? replyUser,
  String? replyPhoto,
  DocumentReference? replyTo,
  DateTime? timeReplied,
  DocumentReference? parentReply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reply_content': replyContent,
      'reply_thread': replyThread,
      'reply_user': replyUser,
      'reply_photo': replyPhoto,
      'reply_to': replyTo,
      'time_replied': timeReplied,
      'parent_reply': parentReply,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestForumRepliesRecordDocumentEquality
    implements Equality<TestForumRepliesRecord> {
  const TestForumRepliesRecordDocumentEquality();

  @override
  bool equals(TestForumRepliesRecord? e1, TestForumRepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.replyContent == e2?.replyContent &&
        e1?.replyThread == e2?.replyThread &&
        e1?.replyUser == e2?.replyUser &&
        e1?.replyPhoto == e2?.replyPhoto &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.replyTo == e2?.replyTo &&
        e1?.timeReplied == e2?.timeReplied &&
        listEquality.equals(e1?.repliedBy, e2?.repliedBy) &&
        listEquality.equals(e1?.replyReplies, e2?.replyReplies) &&
        e1?.parentReply == e2?.parentReply;
  }

  @override
  int hash(TestForumRepliesRecord? e) => const ListEquality().hash([
        e?.replyContent,
        e?.replyThread,
        e?.replyUser,
        e?.replyPhoto,
        e?.likedBy,
        e?.replyTo,
        e?.timeReplied,
        e?.repliedBy,
        e?.replyReplies,
        e?.parentReply
      ]);

  @override
  bool isValidKey(Object? o) => o is TestForumRepliesRecord;
}
