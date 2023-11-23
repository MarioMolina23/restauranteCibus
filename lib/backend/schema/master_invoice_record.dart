import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasterInvoiceRecord extends FirestoreRecord {
  MasterInvoiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "number_table" field.
  int? _numberTable;
  int get numberTable => _numberTable ?? 0;
  bool hasNumberTable() => _numberTable != null;

  // "waiter" field.
  String? _waiter;
  String get waiter => _waiter ?? '';
  bool hasWaiter() => _waiter != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "taxes" field.
  double? _taxes;
  double get taxes => _taxes ?? 0.0;
  bool hasTaxes() => _taxes != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _numberTable = castToType<int>(snapshotData['number_table']);
    _waiter = snapshotData['waiter'] as String?;
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _discount = castToType<double>(snapshotData['discount']);
    _taxes = castToType<double>(snapshotData['taxes']);
    _total = castToType<double>(snapshotData['total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('master_invoice');

  static Stream<MasterInvoiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MasterInvoiceRecord.fromSnapshot(s));

  static Future<MasterInvoiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MasterInvoiceRecord.fromSnapshot(s));

  static MasterInvoiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MasterInvoiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MasterInvoiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MasterInvoiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MasterInvoiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MasterInvoiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMasterInvoiceRecordData({
  int? numberTable,
  String? waiter,
  DateTime? creationDate,
  double? subtotal,
  double? discount,
  double? taxes,
  double? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number_table': numberTable,
      'waiter': waiter,
      'creation_date': creationDate,
      'subtotal': subtotal,
      'discount': discount,
      'taxes': taxes,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class MasterInvoiceRecordDocumentEquality
    implements Equality<MasterInvoiceRecord> {
  const MasterInvoiceRecordDocumentEquality();

  @override
  bool equals(MasterInvoiceRecord? e1, MasterInvoiceRecord? e2) {
    return e1?.numberTable == e2?.numberTable &&
        e1?.waiter == e2?.waiter &&
        e1?.creationDate == e2?.creationDate &&
        e1?.subtotal == e2?.subtotal &&
        e1?.discount == e2?.discount &&
        e1?.taxes == e2?.taxes &&
        e1?.total == e2?.total;
  }

  @override
  int hash(MasterInvoiceRecord? e) => const ListEquality().hash([
        e?.numberTable,
        e?.waiter,
        e?.creationDate,
        e?.subtotal,
        e?.discount,
        e?.taxes,
        e?.total
      ]);

  @override
  bool isValidKey(Object? o) => o is MasterInvoiceRecord;
}
