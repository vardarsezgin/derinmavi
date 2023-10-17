import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkedRecord extends FirestoreRecord {
  BookmarkedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bookmarkedRef" field.
  DocumentReference? _bookmarkedRef;
  DocumentReference? get bookmarkedRef => _bookmarkedRef;
  bool hasBookmarkedRef() => _bookmarkedRef != null;

  // "bookmarkedDate" field.
  DateTime? _bookmarkedDate;
  DateTime? get bookmarkedDate => _bookmarkedDate;
  bool hasBookmarkedDate() => _bookmarkedDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookmarkedRef = snapshotData['bookmarkedRef'] as DocumentReference?;
    _bookmarkedDate = snapshotData['bookmarkedDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarked')
          : FirebaseFirestore.instance.collectionGroup('bookmarked');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bookmarked').doc();

  static Stream<BookmarkedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkedRecord.fromSnapshot(s));

  static Future<BookmarkedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarkedRecord.fromSnapshot(s));

  static BookmarkedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkedRecordData({
  DocumentReference? bookmarkedRef,
  DateTime? bookmarkedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookmarkedRef': bookmarkedRef,
      'bookmarkedDate': bookmarkedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkedRecordDocumentEquality implements Equality<BookmarkedRecord> {
  const BookmarkedRecordDocumentEquality();

  @override
  bool equals(BookmarkedRecord? e1, BookmarkedRecord? e2) {
    return e1?.bookmarkedRef == e2?.bookmarkedRef &&
        e1?.bookmarkedDate == e2?.bookmarkedDate;
  }

  @override
  int hash(BookmarkedRecord? e) =>
      const ListEquality().hash([e?.bookmarkedRef, e?.bookmarkedDate]);

  @override
  bool isValidKey(Object? o) => o is BookmarkedRecord;
}
