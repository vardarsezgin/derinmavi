import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DivePointsRecord extends FirestoreRecord {
  DivePointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Pname" field.
  String? _pname;
  String get pname => _pname ?? '';
  bool hasPname() => _pname != null;

  // "Plocation" field.
  String? _plocation;
  String get plocation => _plocation ?? '';
  bool hasPlocation() => _plocation != null;

  // "PlocationLatLng" field.
  LatLng? _plocationLatLng;
  LatLng? get plocationLatLng => _plocationLatLng;
  bool hasPlocationLatLng() => _plocationLatLng != null;

  // "Ptimestamp" field.
  DateTime? _ptimestamp;
  DateTime? get ptimestamp => _ptimestamp;
  bool hasPtimestamp() => _ptimestamp != null;

  // "Ptext" field.
  String? _ptext;
  String get ptext => _ptext ?? '';
  bool hasPtext() => _ptext != null;

  // "isWreck" field.
  bool? _isWreck;
  bool get isWreck => _isWreck ?? false;
  bool hasIsWreck() => _isWreck != null;

  // "isDeepDive" field.
  bool? _isDeepDive;
  bool get isDeepDive => _isDeepDive ?? false;
  bool hasIsDeepDive() => _isDeepDive != null;

  // "isCave" field.
  bool? _isCave;
  bool get isCave => _isCave ?? false;
  bool hasIsCave() => _isCave != null;

  // "isReef" field.
  bool? _isReef;
  bool get isReef => _isReef ?? false;
  bool hasIsReef() => _isReef != null;

  // "authorUser" field.
  String? _authorUser;
  String get authorUser => _authorUser ?? '';
  bool hasAuthorUser() => _authorUser != null;

  // "authorRefUser" field.
  DocumentReference? _authorRefUser;
  DocumentReference? get authorRefUser => _authorRefUser;
  bool hasAuthorRefUser() => _authorRefUser != null;

  // "authorUserImage" field.
  String? _authorUserImage;
  String get authorUserImage => _authorUserImage ?? '';
  bool hasAuthorUserImage() => _authorUserImage != null;

  // "pImage" field.
  String? _pImage;
  String get pImage => _pImage ?? '';
  bool hasPImage() => _pImage != null;

  // "isVideoExist" field.
  bool? _isVideoExist;
  bool get isVideoExist => _isVideoExist ?? false;
  bool hasIsVideoExist() => _isVideoExist != null;

  // "pVideo" field.
  String? _pVideo;
  String get pVideo => _pVideo ?? '';
  bool hasPVideo() => _pVideo != null;

  // "ratePoint" field.
  double? _ratePoint;
  double get ratePoint => _ratePoint ?? 0.0;
  bool hasRatePoint() => _ratePoint != null;

  // "rateVisibility" field.
  double? _rateVisibility;
  double get rateVisibility => _rateVisibility ?? 0.0;
  bool hasRateVisibility() => _rateVisibility != null;

  // "temp" field.
  int? _temp;
  int get temp => _temp ?? 0;
  bool hasTemp() => _temp != null;

  // "maxDepth" field.
  int? _maxDepth;
  int get maxDepth => _maxDepth ?? 0;
  bool hasMaxDepth() => _maxDepth != null;

  // "pTags" field.
  List<String>? _pTags;
  List<String> get pTags => _pTags ?? const [];
  bool hasPTags() => _pTags != null;

  // "yTubeVideo" field.
  String? _yTubeVideo;
  String get yTubeVideo => _yTubeVideo ?? '';
  bool hasYTubeVideo() => _yTubeVideo != null;

  // "favList" field.
  List<DocumentReference>? _favList;
  List<DocumentReference> get favList => _favList ?? const [];
  bool hasFavList() => _favList != null;

  // "favListusernames" field.
  List<String>? _favListusernames;
  List<String> get favListusernames => _favListusernames ?? const [];
  bool hasFavListusernames() => _favListusernames != null;

  // "isPublished" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "bookmarkedBy" field.
  List<DocumentReference>? _bookmarkedBy;
  List<DocumentReference> get bookmarkedBy => _bookmarkedBy ?? const [];
  bool hasBookmarkedBy() => _bookmarkedBy != null;

  void _initializeFields() {
    _pname = snapshotData['Pname'] as String?;
    _plocation = snapshotData['Plocation'] as String?;
    _plocationLatLng = snapshotData['PlocationLatLng'] as LatLng?;
    _ptimestamp = snapshotData['Ptimestamp'] as DateTime?;
    _ptext = snapshotData['Ptext'] as String?;
    _isWreck = snapshotData['isWreck'] as bool?;
    _isDeepDive = snapshotData['isDeepDive'] as bool?;
    _isCave = snapshotData['isCave'] as bool?;
    _isReef = snapshotData['isReef'] as bool?;
    _authorUser = snapshotData['authorUser'] as String?;
    _authorRefUser = snapshotData['authorRefUser'] as DocumentReference?;
    _authorUserImage = snapshotData['authorUserImage'] as String?;
    _pImage = snapshotData['pImage'] as String?;
    _isVideoExist = snapshotData['isVideoExist'] as bool?;
    _pVideo = snapshotData['pVideo'] as String?;
    _ratePoint = castToType<double>(snapshotData['ratePoint']);
    _rateVisibility = castToType<double>(snapshotData['rateVisibility']);
    _temp = castToType<int>(snapshotData['temp']);
    _maxDepth = castToType<int>(snapshotData['maxDepth']);
    _pTags = getDataList(snapshotData['pTags']);
    _yTubeVideo = snapshotData['yTubeVideo'] as String?;
    _favList = getDataList(snapshotData['favList']);
    _favListusernames = getDataList(snapshotData['favListusernames']);
    _isPublished = snapshotData['isPublished'] as bool?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _bookmarkedBy = getDataList(snapshotData['bookmarkedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('divePoints');

  static Stream<DivePointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DivePointsRecord.fromSnapshot(s));

  static Future<DivePointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DivePointsRecord.fromSnapshot(s));

  static DivePointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DivePointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DivePointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DivePointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DivePointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DivePointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDivePointsRecordData({
  String? pname,
  String? plocation,
  LatLng? plocationLatLng,
  DateTime? ptimestamp,
  String? ptext,
  bool? isWreck,
  bool? isDeepDive,
  bool? isCave,
  bool? isReef,
  String? authorUser,
  DocumentReference? authorRefUser,
  String? authorUserImage,
  String? pImage,
  bool? isVideoExist,
  String? pVideo,
  double? ratePoint,
  double? rateVisibility,
  int? temp,
  int? maxDepth,
  String? yTubeVideo,
  bool? isPublished,
  bool? isDeclined,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Pname': pname,
      'Plocation': plocation,
      'PlocationLatLng': plocationLatLng,
      'Ptimestamp': ptimestamp,
      'Ptext': ptext,
      'isWreck': isWreck,
      'isDeepDive': isDeepDive,
      'isCave': isCave,
      'isReef': isReef,
      'authorUser': authorUser,
      'authorRefUser': authorRefUser,
      'authorUserImage': authorUserImage,
      'pImage': pImage,
      'isVideoExist': isVideoExist,
      'pVideo': pVideo,
      'ratePoint': ratePoint,
      'rateVisibility': rateVisibility,
      'temp': temp,
      'maxDepth': maxDepth,
      'yTubeVideo': yTubeVideo,
      'isPublished': isPublished,
      'isDeclined': isDeclined,
    }.withoutNulls,
  );

  return firestoreData;
}

class DivePointsRecordDocumentEquality implements Equality<DivePointsRecord> {
  const DivePointsRecordDocumentEquality();

  @override
  bool equals(DivePointsRecord? e1, DivePointsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pname == e2?.pname &&
        e1?.plocation == e2?.plocation &&
        e1?.plocationLatLng == e2?.plocationLatLng &&
        e1?.ptimestamp == e2?.ptimestamp &&
        e1?.ptext == e2?.ptext &&
        e1?.isWreck == e2?.isWreck &&
        e1?.isDeepDive == e2?.isDeepDive &&
        e1?.isCave == e2?.isCave &&
        e1?.isReef == e2?.isReef &&
        e1?.authorUser == e2?.authorUser &&
        e1?.authorRefUser == e2?.authorRefUser &&
        e1?.authorUserImage == e2?.authorUserImage &&
        e1?.pImage == e2?.pImage &&
        e1?.isVideoExist == e2?.isVideoExist &&
        e1?.pVideo == e2?.pVideo &&
        e1?.ratePoint == e2?.ratePoint &&
        e1?.rateVisibility == e2?.rateVisibility &&
        e1?.temp == e2?.temp &&
        e1?.maxDepth == e2?.maxDepth &&
        listEquality.equals(e1?.pTags, e2?.pTags) &&
        e1?.yTubeVideo == e2?.yTubeVideo &&
        listEquality.equals(e1?.favList, e2?.favList) &&
        listEquality.equals(e1?.favListusernames, e2?.favListusernames) &&
        e1?.isPublished == e2?.isPublished &&
        e1?.isDeclined == e2?.isDeclined &&
        listEquality.equals(e1?.bookmarkedBy, e2?.bookmarkedBy);
  }

  @override
  int hash(DivePointsRecord? e) => const ListEquality().hash([
        e?.pname,
        e?.plocation,
        e?.plocationLatLng,
        e?.ptimestamp,
        e?.ptext,
        e?.isWreck,
        e?.isDeepDive,
        e?.isCave,
        e?.isReef,
        e?.authorUser,
        e?.authorRefUser,
        e?.authorUserImage,
        e?.pImage,
        e?.isVideoExist,
        e?.pVideo,
        e?.ratePoint,
        e?.rateVisibility,
        e?.temp,
        e?.maxDepth,
        e?.pTags,
        e?.yTubeVideo,
        e?.favList,
        e?.favListusernames,
        e?.isPublished,
        e?.isDeclined,
        e?.bookmarkedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is DivePointsRecord;
}
