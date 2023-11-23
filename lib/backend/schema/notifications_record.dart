import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NotifType" field.
  String? _notifType;
  String get notifType => _notifType ?? '';
  bool hasNotifType() => _notifType != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "ImagAlert" field.
  String? _imagAlert;
  String get imagAlert => _imagAlert ?? '';
  bool hasImagAlert() => _imagAlert != null;

  void _initializeFields() {
    _notifType = snapshotData['NotifType'] as String?;
    _title = snapshotData['Title'] as String?;
    _message = snapshotData['Message'] as String?;
    _time = snapshotData['Time'] as DateTime?;
    _imagAlert = snapshotData['ImagAlert'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notifType,
  String? title,
  String? message,
  DateTime? time,
  String? imagAlert,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NotifType': notifType,
      'Title': title,
      'Message': message,
      'Time': time,
      'ImagAlert': imagAlert,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notifType == e2?.notifType &&
        e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.time == e2?.time &&
        e1?.imagAlert == e2?.imagAlert;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality()
      .hash([e?.notifType, e?.title, e?.message, e?.time, e?.imagAlert]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
