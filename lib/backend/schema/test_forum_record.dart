import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestForumRecord extends FirestoreRecord {
  TestForumRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "thread_photo" field.
  String? _threadPhoto;
  String get threadPhoto => _threadPhoto ?? '';
  bool hasThreadPhoto() => _threadPhoto != null;

  // "thread_user" field.
  DocumentReference? _threadUser;
  DocumentReference? get threadUser => _threadUser;
  bool hasThreadUser() => _threadUser != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "replied_by" field.
  List<DocumentReference>? _repliedBy;
  List<DocumentReference> get repliedBy => _repliedBy ?? const [];
  bool hasRepliedBy() => _repliedBy != null;

  // "thread_content" field.
  String? _threadContent;
  String get threadContent => _threadContent ?? '';
  bool hasThreadContent() => _threadContent != null;

  // "replies" field.
  List<DocumentReference>? _replies;
  List<DocumentReference> get replies => _replies ?? const [];
  bool hasReplies() => _replies != null;

  // "tagged_users" field.
  List<DocumentReference>? _taggedUsers;
  List<DocumentReference> get taggedUsers => _taggedUsers ?? const [];
  bool hasTaggedUsers() => _taggedUsers != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "locationLatLng" field.
  LatLng? _locationLatLng;
  LatLng? get locationLatLng => _locationLatLng;
  bool hasLocationLatLng() => _locationLatLng != null;

  // "closeComments" field.
  bool? _closeComments;
  bool get closeComments => _closeComments ?? false;
  bool hasCloseComments() => _closeComments != null;

  // "hideLikeCount" field.
  bool? _hideLikeCount;
  bool get hideLikeCount => _hideLikeCount ?? false;
  bool hasHideLikeCount() => _hideLikeCount != null;

  // "editedAt" field.
  List<DateTime>? _editedAt;
  List<DateTime> get editedAt => _editedAt ?? const [];
  bool hasEditedAt() => _editedAt != null;

  // "oldContent" field.
  List<String>? _oldContent;
  List<String> get oldContent => _oldContent ?? const [];
  bool hasOldContent() => _oldContent != null;

  // "oldImages" field.
  List<String>? _oldImages;
  List<String> get oldImages => _oldImages ?? const [];
  bool hasOldImages() => _oldImages != null;

  void _initializeFields() {
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _threadPhoto = snapshotData['thread_photo'] as String?;
    _threadUser = snapshotData['thread_user'] as DocumentReference?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _repliedBy = getDataList(snapshotData['replied_by']);
    _threadContent = snapshotData['thread_content'] as String?;
    _replies = getDataList(snapshotData['replies']);
    _taggedUsers = getDataList(snapshotData['tagged_users']);
    _locationName = snapshotData['locationName'] as String?;
    _locationLatLng = snapshotData['locationLatLng'] as LatLng?;
    _closeComments = snapshotData['closeComments'] as bool?;
    _hideLikeCount = snapshotData['hideLikeCount'] as bool?;
    _editedAt = getDataList(snapshotData['editedAt']);
    _oldContent = getDataList(snapshotData['oldContent']);
    _oldImages = getDataList(snapshotData['oldImages']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testForum');

  static Stream<TestForumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestForumRecord.fromSnapshot(s));

  static Future<TestForumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestForumRecord.fromSnapshot(s));

  static TestForumRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestForumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestForumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestForumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestForumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestForumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestForumRecordData({
  DateTime? timePosted,
  String? threadPhoto,
  DocumentReference? threadUser,
  String? threadContent,
  String? locationName,
  LatLng? locationLatLng,
  bool? closeComments,
  bool? hideLikeCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_posted': timePosted,
      'thread_photo': threadPhoto,
      'thread_user': threadUser,
      'thread_content': threadContent,
      'locationName': locationName,
      'locationLatLng': locationLatLng,
      'closeComments': closeComments,
      'hideLikeCount': hideLikeCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestForumRecordDocumentEquality implements Equality<TestForumRecord> {
  const TestForumRecordDocumentEquality();

  @override
  bool equals(TestForumRecord? e1, TestForumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.threadPhoto == e2?.threadPhoto &&
        e1?.threadUser == e2?.threadUser &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.repliedBy, e2?.repliedBy) &&
        e1?.threadContent == e2?.threadContent &&
        listEquality.equals(e1?.replies, e2?.replies) &&
        listEquality.equals(e1?.taggedUsers, e2?.taggedUsers) &&
        e1?.locationName == e2?.locationName &&
        e1?.locationLatLng == e2?.locationLatLng &&
        e1?.closeComments == e2?.closeComments &&
        e1?.hideLikeCount == e2?.hideLikeCount &&
        listEquality.equals(e1?.editedAt, e2?.editedAt) &&
        listEquality.equals(e1?.oldContent, e2?.oldContent) &&
        listEquality.equals(e1?.oldImages, e2?.oldImages);
  }

  @override
  int hash(TestForumRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.threadPhoto,
        e?.threadUser,
        e?.likedBy,
        e?.repliedBy,
        e?.threadContent,
        e?.replies,
        e?.taggedUsers,
        e?.locationName,
        e?.locationLatLng,
        e?.closeComments,
        e?.hideLikeCount,
        e?.editedAt,
        e?.oldContent,
        e?.oldImages
      ]);

  @override
  bool isValidKey(Object? o) => o is TestForumRecord;
}
