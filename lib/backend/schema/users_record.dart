import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "nameSurname" field.
  String? _nameSurname;
  String get nameSurname => _nameSurname ?? '';
  bool hasNameSurname() => _nameSurname != null;

  // "isDarkMode" field.
  String? _isDarkMode;
  String get isDarkMode => _isDarkMode ?? '';
  bool hasIsDarkMode() => _isDarkMode != null;

  // "diveNumber" field.
  int? _diveNumber;
  int get diveNumber => _diveNumber ?? 0;
  bool hasDiveNumber() => _diveNumber != null;

  // "trainingDiveNumber" field.
  int? _trainingDiveNumber;
  int get trainingDiveNumber => _trainingDiveNumber ?? 0;
  bool hasTrainingDiveNumber() => _trainingDiveNumber != null;

  // "totalDiveCount" field.
  int? _totalDiveCount;
  int get totalDiveCount => _totalDiveCount ?? 0;
  bool hasTotalDiveCount() => _totalDiveCount != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "broveSev" field.
  String? _broveSev;
  String get broveSev => _broveSev ?? '';
  bool hasBroveSev() => _broveSev != null;

  // "federayon" field.
  String? _federayon;
  String get federayon => _federayon ?? '';
  bool hasFederayon() => _federayon != null;

  // "okulKulup" field.
  String? _okulKulup;
  String get okulKulup => _okulKulup ?? '';
  bool hasOkulKulup() => _okulKulup != null;

  // "isApprovedInstructer" field.
  bool? _isApprovedInstructer;
  bool get isApprovedInstructer => _isApprovedInstructer ?? false;
  bool hasIsApprovedInstructer() => _isApprovedInstructer != null;

  // "isBlocked" field.
  bool? _isBlocked;
  bool get isBlocked => _isBlocked ?? false;
  bool hasIsBlocked() => _isBlocked != null;

  // "userPermissions" field.
  String? _userPermissions;
  String get userPermissions => _userPermissions ?? '';
  bool hasUserPermissions() => _userPermissions != null;

  // "isModerator" field.
  bool? _isModerator;
  bool get isModerator => _isModerator ?? false;
  bool hasIsModerator() => _isModerator != null;

  // "isInstructor" field.
  bool? _isInstructor;
  bool get isInstructor => _isInstructor ?? false;
  bool hasIsInstructor() => _isInstructor != null;

  // "isEditor" field.
  bool? _isEditor;
  bool get isEditor => _isEditor ?? false;
  bool hasIsEditor() => _isEditor != null;

  // "bioText" field.
  String? _bioText;
  String get bioText => _bioText ?? '';
  bool hasBioText() => _bioText != null;

  // "followed_by" field.
  List<DocumentReference>? _followedBy;
  List<DocumentReference> get followedBy => _followedBy ?? const [];
  bool hasFollowedBy() => _followedBy != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "bioLink" field.
  String? _bioLink;
  String get bioLink => _bioLink ?? '';
  bool hasBioLink() => _bioLink != null;

  // "phoneVerified" field.
  bool? _phoneVerified;
  bool get phoneVerified => _phoneVerified ?? false;
  bool hasPhoneVerified() => _phoneVerified != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "instructerNumber" field.
  String? _instructerNumber;
  String get instructerNumber => _instructerNumber ?? '';
  bool hasInstructerNumber() => _instructerNumber != null;

  // "gecerliSertifikaSev" field.
  String? _gecerliSertifikaSev;
  String get gecerliSertifikaSev => _gecerliSertifikaSev ?? '';
  bool hasGecerliSertifikaSev() => _gecerliSertifikaSev != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _nameSurname = snapshotData['nameSurname'] as String?;
    _isDarkMode = snapshotData['isDarkMode'] as String?;
    _diveNumber = castToType<int>(snapshotData['diveNumber']);
    _trainingDiveNumber = castToType<int>(snapshotData['trainingDiveNumber']);
    _totalDiveCount = castToType<int>(snapshotData['totalDiveCount']);
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _broveSev = snapshotData['broveSev'] as String?;
    _federayon = snapshotData['federayon'] as String?;
    _okulKulup = snapshotData['okulKulup'] as String?;
    _isApprovedInstructer = snapshotData['isApprovedInstructer'] as bool?;
    _isBlocked = snapshotData['isBlocked'] as bool?;
    _userPermissions = snapshotData['userPermissions'] as String?;
    _isModerator = snapshotData['isModerator'] as bool?;
    _isInstructor = snapshotData['isInstructor'] as bool?;
    _isEditor = snapshotData['isEditor'] as bool?;
    _bioText = snapshotData['bioText'] as String?;
    _followedBy = getDataList(snapshotData['followed_by']);
    _following = getDataList(snapshotData['following']);
    _bioLink = snapshotData['bioLink'] as String?;
    _phoneVerified = snapshotData['phoneVerified'] as bool?;
    _status = snapshotData['status'] as String?;
    _surname = snapshotData['surname'] as String?;
    _instructerNumber = snapshotData['instructerNumber'] as String?;
    _gecerliSertifikaSev = snapshotData['gecerliSertifikaSev'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? nameSurname,
  String? isDarkMode,
  int? diveNumber,
  int? trainingDiveNumber,
  int? totalDiveCount,
  bool? isAdmin,
  String? broveSev,
  String? federayon,
  String? okulKulup,
  bool? isApprovedInstructer,
  bool? isBlocked,
  String? userPermissions,
  bool? isModerator,
  bool? isInstructor,
  bool? isEditor,
  String? bioText,
  String? bioLink,
  bool? phoneVerified,
  String? status,
  String? surname,
  String? instructerNumber,
  String? gecerliSertifikaSev,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'nameSurname': nameSurname,
      'isDarkMode': isDarkMode,
      'diveNumber': diveNumber,
      'trainingDiveNumber': trainingDiveNumber,
      'totalDiveCount': totalDiveCount,
      'isAdmin': isAdmin,
      'broveSev': broveSev,
      'federayon': federayon,
      'okulKulup': okulKulup,
      'isApprovedInstructer': isApprovedInstructer,
      'isBlocked': isBlocked,
      'userPermissions': userPermissions,
      'isModerator': isModerator,
      'isInstructor': isInstructor,
      'isEditor': isEditor,
      'bioText': bioText,
      'bioLink': bioLink,
      'phoneVerified': phoneVerified,
      'status': status,
      'surname': surname,
      'instructerNumber': instructerNumber,
      'gecerliSertifikaSev': gecerliSertifikaSev,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.nameSurname == e2?.nameSurname &&
        e1?.isDarkMode == e2?.isDarkMode &&
        e1?.diveNumber == e2?.diveNumber &&
        e1?.trainingDiveNumber == e2?.trainingDiveNumber &&
        e1?.totalDiveCount == e2?.totalDiveCount &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.broveSev == e2?.broveSev &&
        e1?.federayon == e2?.federayon &&
        e1?.okulKulup == e2?.okulKulup &&
        e1?.isApprovedInstructer == e2?.isApprovedInstructer &&
        e1?.isBlocked == e2?.isBlocked &&
        e1?.userPermissions == e2?.userPermissions &&
        e1?.isModerator == e2?.isModerator &&
        e1?.isInstructor == e2?.isInstructor &&
        e1?.isEditor == e2?.isEditor &&
        e1?.bioText == e2?.bioText &&
        listEquality.equals(e1?.followedBy, e2?.followedBy) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.bioLink == e2?.bioLink &&
        e1?.phoneVerified == e2?.phoneVerified &&
        e1?.status == e2?.status &&
        e1?.surname == e2?.surname &&
        e1?.instructerNumber == e2?.instructerNumber &&
        e1?.gecerliSertifikaSev == e2?.gecerliSertifikaSev;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.nameSurname,
        e?.isDarkMode,
        e?.diveNumber,
        e?.trainingDiveNumber,
        e?.totalDiveCount,
        e?.isAdmin,
        e?.broveSev,
        e?.federayon,
        e?.okulKulup,
        e?.isApprovedInstructer,
        e?.isBlocked,
        e?.userPermissions,
        e?.isModerator,
        e?.isInstructor,
        e?.isEditor,
        e?.bioText,
        e?.followedBy,
        e?.following,
        e?.bioLink,
        e?.phoneVerified,
        e?.status,
        e?.surname,
        e?.instructerNumber,
        e?.gecerliSertifikaSev
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
