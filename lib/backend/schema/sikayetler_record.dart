import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SikayetlerRecord extends FirestoreRecord {
  SikayetlerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sikayetSebebi" field.
  String? _sikayetSebebi;
  String get sikayetSebebi => _sikayetSebebi ?? '';
  bool hasSikayetSebebi() => _sikayetSebebi != null;

  // "sikayetDokumanRef" field.
  DocumentReference? _sikayetDokumanRef;
  DocumentReference? get sikayetDokumanRef => _sikayetDokumanRef;
  bool hasSikayetDokumanRef() => _sikayetDokumanRef != null;

  // "sikayetTarih" field.
  DateTime? _sikayetTarih;
  DateTime? get sikayetTarih => _sikayetTarih;
  bool hasSikayetTarih() => _sikayetTarih != null;

  // "sikayetKullanici" field.
  DocumentReference? _sikayetKullanici;
  DocumentReference? get sikayetKullanici => _sikayetKullanici;
  bool hasSikayetKullanici() => _sikayetKullanici != null;

  // "icerikSilindiMi" field.
  bool? _icerikSilindiMi;
  bool get icerikSilindiMi => _icerikSilindiMi ?? false;
  bool hasIcerikSilindiMi() => _icerikSilindiMi != null;

  void _initializeFields() {
    _sikayetSebebi = snapshotData['sikayetSebebi'] as String?;
    _sikayetDokumanRef =
        snapshotData['sikayetDokumanRef'] as DocumentReference?;
    _sikayetTarih = snapshotData['sikayetTarih'] as DateTime?;
    _sikayetKullanici = snapshotData['sikayetKullanici'] as DocumentReference?;
    _icerikSilindiMi = snapshotData['icerikSilindiMi'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sikayetler');

  static Stream<SikayetlerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SikayetlerRecord.fromSnapshot(s));

  static Future<SikayetlerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SikayetlerRecord.fromSnapshot(s));

  static SikayetlerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SikayetlerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SikayetlerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SikayetlerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SikayetlerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SikayetlerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSikayetlerRecordData({
  String? sikayetSebebi,
  DocumentReference? sikayetDokumanRef,
  DateTime? sikayetTarih,
  DocumentReference? sikayetKullanici,
  bool? icerikSilindiMi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sikayetSebebi': sikayetSebebi,
      'sikayetDokumanRef': sikayetDokumanRef,
      'sikayetTarih': sikayetTarih,
      'sikayetKullanici': sikayetKullanici,
      'icerikSilindiMi': icerikSilindiMi,
    }.withoutNulls,
  );

  return firestoreData;
}

class SikayetlerRecordDocumentEquality implements Equality<SikayetlerRecord> {
  const SikayetlerRecordDocumentEquality();

  @override
  bool equals(SikayetlerRecord? e1, SikayetlerRecord? e2) {
    return e1?.sikayetSebebi == e2?.sikayetSebebi &&
        e1?.sikayetDokumanRef == e2?.sikayetDokumanRef &&
        e1?.sikayetTarih == e2?.sikayetTarih &&
        e1?.sikayetKullanici == e2?.sikayetKullanici &&
        e1?.icerikSilindiMi == e2?.icerikSilindiMi;
  }

  @override
  int hash(SikayetlerRecord? e) => const ListEquality().hash([
        e?.sikayetSebebi,
        e?.sikayetDokumanRef,
        e?.sikayetTarih,
        e?.sikayetKullanici,
        e?.icerikSilindiMi
      ]);

  @override
  bool isValidKey(Object? o) => o is SikayetlerRecord;
}
