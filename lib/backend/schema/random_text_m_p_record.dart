import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RandomTextMPRecord extends FirestoreRecord {
  RandomTextMPRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "no" field.
  int? _no;
  int get no => _no ?? 0;
  bool hasNo() => _no != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _no = castToType<int>(snapshotData['no']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('randomTextMP')
          : FirebaseFirestore.instance.collectionGroup('randomTextMP');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('randomTextMP').doc();

  static Stream<RandomTextMPRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RandomTextMPRecord.fromSnapshot(s));

  static Future<RandomTextMPRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RandomTextMPRecord.fromSnapshot(s));

  static RandomTextMPRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RandomTextMPRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RandomTextMPRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RandomTextMPRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RandomTextMPRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RandomTextMPRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRandomTextMPRecordData({
  String? text,
  int? no,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'no': no,
    }.withoutNulls,
  );

  return firestoreData;
}

class RandomTextMPRecordDocumentEquality
    implements Equality<RandomTextMPRecord> {
  const RandomTextMPRecordDocumentEquality();

  @override
  bool equals(RandomTextMPRecord? e1, RandomTextMPRecord? e2) {
    return e1?.text == e2?.text && e1?.no == e2?.no;
  }

  @override
  int hash(RandomTextMPRecord? e) =>
      const ListEquality().hash([e?.text, e?.no]);

  @override
  bool isValidKey(Object? o) => o is RandomTextMPRecord;
}
