import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificatesRecord extends FirestoreRecord {
  CertificatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "certName" field.
  String? _certName;
  String get certName => _certName ?? '';
  bool hasCertName() => _certName != null;

  // "certRef" field.
  DocumentReference? _certRef;
  DocumentReference? get certRef => _certRef;
  bool hasCertRef() => _certRef != null;

  // "fedRef" field.
  DocumentReference? _fedRef;
  DocumentReference? get fedRef => _fedRef;
  bool hasFedRef() => _fedRef != null;

  // "fedName" field.
  String? _fedName;
  String get fedName => _fedName ?? '';
  bool hasFedName() => _fedName != null;

  // "isApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "certPhoto" field.
  String? _certPhoto;
  String get certPhoto => _certPhoto ?? '';
  bool hasCertPhoto() => _certPhoto != null;

  // "certPhoto2" field.
  String? _certPhoto2;
  String get certPhoto2 => _certPhoto2 ?? '';
  bool hasCertPhoto2() => _certPhoto2 != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "isDeclined" field.
  bool? _isDeclined;
  bool get isDeclined => _isDeclined ?? false;
  bool hasIsDeclined() => _isDeclined != null;

  // "reasonForDecline" field.
  String? _reasonForDecline;
  String get reasonForDecline => _reasonForDecline ?? '';
  bool hasReasonForDecline() => _reasonForDecline != null;

  // "certDate" field.
  DateTime? _certDate;
  DateTime? get certDate => _certDate;
  bool hasCertDate() => _certDate != null;

  // "certValidUntil" field.
  DateTime? _certValidUntil;
  DateTime? get certValidUntil => _certValidUntil;
  bool hasCertValidUntil() => _certValidUntil != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _certName = snapshotData['certName'] as String?;
    _certRef = snapshotData['certRef'] as DocumentReference?;
    _fedRef = snapshotData['fedRef'] as DocumentReference?;
    _fedName = snapshotData['fedName'] as String?;
    _isApproved = snapshotData['isApproved'] as bool?;
    _certPhoto = snapshotData['certPhoto'] as String?;
    _certPhoto2 = snapshotData['certPhoto2'] as String?;
    _note = snapshotData['note'] as String?;
    _isDeclined = snapshotData['isDeclined'] as bool?;
    _reasonForDecline = snapshotData['reasonForDecline'] as String?;
    _certDate = snapshotData['certDate'] as DateTime?;
    _certValidUntil = snapshotData['certValidUntil'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('certificates')
          : FirebaseFirestore.instance.collectionGroup('certificates');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('certificates').doc();

  static Stream<CertificatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificatesRecord.fromSnapshot(s));

  static Future<CertificatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CertificatesRecord.fromSnapshot(s));

  static CertificatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCertificatesRecordData({
  String? certName,
  DocumentReference? certRef,
  DocumentReference? fedRef,
  String? fedName,
  bool? isApproved,
  String? certPhoto,
  String? certPhoto2,
  String? note,
  bool? isDeclined,
  String? reasonForDecline,
  DateTime? certDate,
  DateTime? certValidUntil,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'certName': certName,
      'certRef': certRef,
      'fedRef': fedRef,
      'fedName': fedName,
      'isApproved': isApproved,
      'certPhoto': certPhoto,
      'certPhoto2': certPhoto2,
      'note': note,
      'isDeclined': isDeclined,
      'reasonForDecline': reasonForDecline,
      'certDate': certDate,
      'certValidUntil': certValidUntil,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificatesRecordDocumentEquality
    implements Equality<CertificatesRecord> {
  const CertificatesRecordDocumentEquality();

  @override
  bool equals(CertificatesRecord? e1, CertificatesRecord? e2) {
    return e1?.certName == e2?.certName &&
        e1?.certRef == e2?.certRef &&
        e1?.fedRef == e2?.fedRef &&
        e1?.fedName == e2?.fedName &&
        e1?.isApproved == e2?.isApproved &&
        e1?.certPhoto == e2?.certPhoto &&
        e1?.certPhoto2 == e2?.certPhoto2 &&
        e1?.note == e2?.note &&
        e1?.isDeclined == e2?.isDeclined &&
        e1?.reasonForDecline == e2?.reasonForDecline &&
        e1?.certDate == e2?.certDate &&
        e1?.certValidUntil == e2?.certValidUntil &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(CertificatesRecord? e) => const ListEquality().hash([
        e?.certName,
        e?.certRef,
        e?.fedRef,
        e?.fedName,
        e?.isApproved,
        e?.certPhoto,
        e?.certPhoto2,
        e?.note,
        e?.isDeclined,
        e?.reasonForDecline,
        e?.certDate,
        e?.certValidUntil,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is CertificatesRecord;
}
