// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadyEventStruct extends FFFirebaseStruct {
  UploadyEventStruct({
    String? type,
    String? current,
    String? old,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _current = current,
        _old = old,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "current" field.
  String? _current;
  String get current => _current ?? '';
  set current(String? val) => _current = val;
  bool hasCurrent() => _current != null;

  // "old" field.
  String? _old;
  String get old => _old ?? '';
  set old(String? val) => _old = val;
  bool hasOld() => _old != null;

  static UploadyEventStruct fromMap(Map<String, dynamic> data) =>
      UploadyEventStruct(
        type: data['type'] as String?,
        current: data['current'] as String?,
        old: data['old'] as String?,
      );

  static UploadyEventStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UploadyEventStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'current': _current,
        'old': _old,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'current': serializeParam(
          _current,
          ParamType.String,
        ),
        'old': serializeParam(
          _old,
          ParamType.String,
        ),
      }.withoutNulls;

  static UploadyEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      UploadyEventStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        current: deserializeParam(
          data['current'],
          ParamType.String,
          false,
        ),
        old: deserializeParam(
          data['old'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UploadyEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UploadyEventStruct &&
        type == other.type &&
        current == other.current &&
        old == other.old;
  }

  @override
  int get hashCode => const ListEquality().hash([type, current, old]);
}

UploadyEventStruct createUploadyEventStruct({
  String? type,
  String? current,
  String? old,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadyEventStruct(
      type: type,
      current: current,
      old: old,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UploadyEventStruct? updateUploadyEventStruct(
  UploadyEventStruct? uploadyEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    uploadyEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUploadyEventStructData(
  Map<String, dynamic> firestoreData,
  UploadyEventStruct? uploadyEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uploadyEvent == null) {
    return;
  }
  if (uploadyEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && uploadyEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uploadyEventData =
      getUploadyEventFirestoreData(uploadyEvent, forFieldValue);
  final nestedData =
      uploadyEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = uploadyEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUploadyEventFirestoreData(
  UploadyEventStruct? uploadyEvent, [
  bool forFieldValue = false,
]) {
  if (uploadyEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uploadyEvent.toMap());

  // Add any Firestore field values
  uploadyEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUploadyEventListFirestoreData(
  List<UploadyEventStruct>? uploadyEvents,
) =>
    uploadyEvents?.map((e) => getUploadyEventFirestoreData(e, true)).toList() ??
    [];
