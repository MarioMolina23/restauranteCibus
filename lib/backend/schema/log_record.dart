import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogRecord extends FirestoreRecord {
  LogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _action = snapshotData['action'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('log');

  static Stream<LogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogRecord.fromSnapshot(s));

  static Future<LogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogRecord.fromSnapshot(s));

  static LogRecord fromSnapshot(DocumentSnapshot snapshot) => LogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogRecordData({
  DocumentReference? userRef,
  String? action,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'action': action,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogRecordDocumentEquality implements Equality<LogRecord> {
  const LogRecordDocumentEquality();

  @override
  bool equals(LogRecord? e1, LogRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.action == e2?.action &&
        e1?.time == e2?.time;
  }

  @override
  int hash(LogRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.action, e?.time]);

  @override
  bool isValidKey(Object? o) => o is LogRecord;
}
