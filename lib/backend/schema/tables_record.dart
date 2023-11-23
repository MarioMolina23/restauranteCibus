import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numberTable" field.
  int? _numberTable;
  int get numberTable => _numberTable ?? 0;
  bool hasNumberTable() => _numberTable != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  bool hasIsSelected() => _isSelected != null;

  void _initializeFields() {
    _numberTable = castToType<int>(snapshotData['numberTable']);
    _isSelected = snapshotData['isSelected'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tables');

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  int? numberTable,
  bool? isSelected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numberTable': numberTable,
      'isSelected': isSelected,
    }.withoutNulls,
  );

  return firestoreData;
}

class TablesRecordDocumentEquality implements Equality<TablesRecord> {
  const TablesRecordDocumentEquality();

  @override
  bool equals(TablesRecord? e1, TablesRecord? e2) {
    return e1?.numberTable == e2?.numberTable &&
        e1?.isSelected == e2?.isSelected;
  }

  @override
  int hash(TablesRecord? e) =>
      const ListEquality().hash([e?.numberTable, e?.isSelected]);

  @override
  bool isValidKey(Object? o) => o is TablesRecord;
}
