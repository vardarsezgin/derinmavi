import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllPostsRecord extends FirestoreRecord {
  AllPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "post_youtube" field.
  String? _postYoutube;
  String get postYoutube => _postYoutube ?? '';
  bool hasPostYoutube() => _postYoutube != null;

  // "post_video" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  bool hasPostVideo() => _postVideo != null;

  // "isApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "isApprovedBy" field.
  DocumentReference? _isApprovedBy;
  DocumentReference? get isApprovedBy => _isApprovedBy;
  bool hasIsApprovedBy() => _isApprovedBy != null;

  // "post_tags" field.
  List<String>? _postTags;
  List<String> get postTags => _postTags ?? const [];
  bool hasPostTags() => _postTags != null;

  // "post_cat" field.
  String? _postCat;
  String get postCat => _postCat ?? '';
  bool hasPostCat() => _postCat != null;

  // "link_youtube" field.
  String? _linkYoutube;
  String get linkYoutube => _linkYoutube ?? '';
  bool hasLinkYoutube() => _linkYoutube != null;

  // "link_action" field.
  String? _linkAction;
  String get linkAction => _linkAction ?? '';
  bool hasLinkAction() => _linkAction != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "hideAuthor" field.
  bool? _hideAuthor;
  bool get hideAuthor => _hideAuthor ?? false;
  bool hasHideAuthor() => _hideAuthor != null;

  // "post_photos" field.
  List<String>? _postPhotos;
  List<String> get postPhotos => _postPhotos ?? const [];
  bool hasPostPhotos() => _postPhotos != null;

  // "num_likes" field.
  int? _numLikes;
  int get numLikes => _numLikes ?? 0;
  bool hasNumLikes() => _numLikes != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _postYoutube = snapshotData['post_youtube'] as String?;
    _postVideo = snapshotData['post_video'] as String?;
    _isApproved = snapshotData['isApproved'] as bool?;
    _isApprovedBy = snapshotData['isApprovedBy'] as DocumentReference?;
    _postTags = getDataList(snapshotData['post_tags']);
    _postCat = snapshotData['post_cat'] as String?;
    _linkYoutube = snapshotData['link_youtube'] as String?;
    _linkAction = snapshotData['link_action'] as String?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _hideAuthor = snapshotData['hideAuthor'] as bool?;
    _postPhotos = getDataList(snapshotData['post_photos']);
    _numLikes = castToType<int>(snapshotData['num_likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allPosts');

  static Stream<AllPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllPostsRecord.fromSnapshot(s));

  static Future<AllPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllPostsRecord.fromSnapshot(s));

  static AllPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllPostsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  String? postYoutube,
  String? postVideo,
  bool? isApproved,
  DocumentReference? isApprovedBy,
  String? postCat,
  String? linkYoutube,
  String? linkAction,
  bool? isDeclined,
  bool? hideAuthor,
  int? numLikes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'post_youtube': postYoutube,
      'post_video': postVideo,
      'isApproved': isApproved,
      'isApprovedBy': isApprovedBy,
      'post_cat': postCat,
      'link_youtube': linkYoutube,
      'link_action': linkAction,
      'isDeclined': isDeclined,
      'hideAuthor': hideAuthor,
      'num_likes': numLikes,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllPostsRecordDocumentEquality implements Equality<AllPostsRecord> {
  const AllPostsRecordDocumentEquality();

  @override
  bool equals(AllPostsRecord? e1, AllPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.postYoutube == e2?.postYoutube &&
        e1?.postVideo == e2?.postVideo &&
        e1?.isApproved == e2?.isApproved &&
        e1?.isApprovedBy == e2?.isApprovedBy &&
        listEquality.equals(e1?.postTags, e2?.postTags) &&
        e1?.postCat == e2?.postCat &&
        e1?.linkYoutube == e2?.linkYoutube &&
        e1?.linkAction == e2?.linkAction &&
        e1?.isDeclined == e2?.isDeclined &&
        e1?.hideAuthor == e2?.hideAuthor &&
        listEquality.equals(e1?.postPhotos, e2?.postPhotos) &&
        e1?.numLikes == e2?.numLikes;
  }

  @override
  int hash(AllPostsRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.postYoutube,
        e?.postVideo,
        e?.isApproved,
        e?.isApprovedBy,
        e?.postTags,
        e?.postCat,
        e?.linkYoutube,
        e?.linkAction,
        e?.isDeclined,
        e?.hideAuthor,
        e?.postPhotos,
        e?.numLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is AllPostsRecord;
}
