import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KulupVeOkullarRecord extends FirestoreRecord {
  KulupVeOkullarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "kulupAdi" field.
  String? _kulupAdi;
  String get kulupAdi => _kulupAdi ?? '';
  bool hasKulupAdi() => _kulupAdi != null;

  // "tipi" field.
  String? _tipi;
  String get tipi => _tipi ?? '';
  bool hasTipi() => _tipi != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _kulupAdi = snapshotData['kulupAdi'] as String?;
    _tipi = snapshotData['tipi'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('kulupVeOkullar')
          : FirebaseFirestore.instance.collectionGroup('kulupVeOkullar');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('kulupVeOkullar').doc();

  static Stream<KulupVeOkullarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KulupVeOkullarRecord.fromSnapshot(s));

  static Future<KulupVeOkullarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KulupVeOkullarRecord.fromSnapshot(s));

  static KulupVeOkullarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KulupVeOkullarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KulupVeOkullarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KulupVeOkullarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KulupVeOkullarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KulupVeOkullarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKulupVeOkullarRecordData({
  String? kulupAdi,
  String? tipi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'kulupAdi': kulupAdi,
      'tipi': tipi,
    }.withoutNulls,
  );

  return firestoreData;
}

class KulupVeOkullarRecordDocumentEquality
    implements Equality<KulupVeOkullarRecord> {
  const KulupVeOkullarRecordDocumentEquality();

  @override
  bool equals(KulupVeOkullarRecord? e1, KulupVeOkullarRecord? e2) {
    return e1?.kulupAdi == e2?.kulupAdi && e1?.tipi == e2?.tipi;
  }

  @override
  int hash(KulupVeOkullarRecord? e) =>
      const ListEquality().hash([e?.kulupAdi, e?.tipi]);

  @override
  bool isValidKey(Object? o) => o is KulupVeOkullarRecord;
}
