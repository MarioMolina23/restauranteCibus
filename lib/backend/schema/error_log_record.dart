import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErrorLogRecord extends FirestoreRecord {
  ErrorLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eid" field.
  String? _eid;
  String get eid => _eid ?? '';
  bool hasEid() => _eid != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "error_description" field.
  String? _errorDescription;
  String get errorDescription => _errorDescription ?? '';
  bool hasErrorDescription() => _errorDescription != null;

  // "possible_actions" field.
  String? _possibleActions;
  String get possibleActions => _possibleActions ?? '';
  bool hasPossibleActions() => _possibleActions != null;

  void _initializeFields() {
    _eid = snapshotData['eid'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _errorDescription = snapshotData['error_description'] as String?;
    _possibleActions = snapshotData['possible_actions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('error_log');

  static Stream<ErrorLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ErrorLogRecord.fromSnapshot(s));

  static Future<ErrorLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ErrorLogRecord.fromSnapshot(s));

  static ErrorLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ErrorLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ErrorLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ErrorLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ErrorLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ErrorLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createErrorLogRecordData({
  String? eid,
  DateTime? time,
  String? errorDescription,
  String? possibleActions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eid': eid,
      'time': time,
      'error_description': errorDescription,
      'possible_actions': possibleActions,
    }.withoutNulls,
  );

  return firestoreData;
}

class ErrorLogRecordDocumentEquality implements Equality<ErrorLogRecord> {
  const ErrorLogRecordDocumentEquality();

  @override
  bool equals(ErrorLogRecord? e1, ErrorLogRecord? e2) {
    return e1?.eid == e2?.eid &&
        e1?.time == e2?.time &&
        e1?.errorDescription == e2?.errorDescription &&
        e1?.possibleActions == e2?.possibleActions;
  }

  @override
  int hash(ErrorLogRecord? e) => const ListEquality()
      .hash([e?.eid, e?.time, e?.errorDescription, e?.possibleActions]);

  @override
  bool isValidKey(Object? o) => o is ErrorLogRecord;
}
