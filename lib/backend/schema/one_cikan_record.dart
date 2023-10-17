import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OneCikanRecord extends FirestoreRecord {
  OneCikanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "baslik" field.
  String? _baslik;
  String get baslik => _baslik ?? '';
  bool hasBaslik() => _baslik != null;

  // "aciklama" field.
  String? _aciklama;
  String get aciklama => _aciklama ?? '';
  bool hasAciklama() => _aciklama != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "tarih" field.
  DateTime? _tarih;
  DateTime? get tarih => _tarih;
  bool hasTarih() => _tarih != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "aciklama2" field.
  String? _aciklama2;
  String get aciklama2 => _aciklama2 ?? '';
  bool hasAciklama2() => _aciklama2 != null;

  // "icerikKategori" field.
  String? _icerikKategori;
  String get icerikKategori => _icerikKategori ?? '';
  bool hasIcerikKategori() => _icerikKategori != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _baslik = snapshotData['baslik'] as String?;
    _aciklama = snapshotData['aciklama'] as String?;
    _link = snapshotData['link'] as String?;
    _tarih = snapshotData['tarih'] as DateTime?;
    _foto = snapshotData['foto'] as String?;
    _aciklama2 = snapshotData['aciklama2'] as String?;
    _icerikKategori = snapshotData['icerikKategori'] as String?;
    _youtube = snapshotData['youtube'] as String?;
    _likes = getDataList(snapshotData['likes']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('oneCikan')
          : FirebaseFirestore.instance.collectionGroup('oneCikan');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('oneCikan').doc();

  static Stream<OneCikanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OneCikanRecord.fromSnapshot(s));

  static Future<OneCikanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OneCikanRecord.fromSnapshot(s));

  static OneCikanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OneCikanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OneCikanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OneCikanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OneCikanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OneCikanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOneCikanRecordData({
  String? baslik,
  String? aciklama,
  String? link,
  DateTime? tarih,
  String? foto,
  String? aciklama2,
  String? icerikKategori,
  String? youtube,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'baslik': baslik,
      'aciklama': aciklama,
      'link': link,
      'tarih': tarih,
      'foto': foto,
      'aciklama2': aciklama2,
      'icerikKategori': icerikKategori,
      'youtube': youtube,
    }.withoutNulls,
  );

  return firestoreData;
}

class OneCikanRecordDocumentEquality implements Equality<OneCikanRecord> {
  const OneCikanRecordDocumentEquality();

  @override
  bool equals(OneCikanRecord? e1, OneCikanRecord? e2) {
    const listEquality = ListEquality();
    return e1?.baslik == e2?.baslik &&
        e1?.aciklama == e2?.aciklama &&
        e1?.link == e2?.link &&
        e1?.tarih == e2?.tarih &&
        e1?.foto == e2?.foto &&
        e1?.aciklama2 == e2?.aciklama2 &&
        e1?.icerikKategori == e2?.icerikKategori &&
        e1?.youtube == e2?.youtube &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(OneCikanRecord? e) => const ListEquality().hash([
        e?.baslik,
        e?.aciklama,
        e?.link,
        e?.tarih,
        e?.foto,
        e?.aciklama2,
        e?.icerikKategori,
        e?.youtube,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is OneCikanRecord;
}
