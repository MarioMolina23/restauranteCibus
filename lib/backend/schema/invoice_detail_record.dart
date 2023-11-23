import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceDetailRecord extends FirestoreRecord {
  InvoiceDetailRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quantity_ordered" field.
  int? _quantityOrdered;
  int get quantityOrdered => _quantityOrdered ?? 0;
  bool hasQuantityOrdered() => _quantityOrdered != null;

  // "plate_name" field.
  String? _plateName;
  String get plateName => _plateName ?? '';
  bool hasPlateName() => _plateName != null;

  // "plate_price" field.
  double? _platePrice;
  double get platePrice => _platePrice ?? 0.0;
  bool hasPlatePrice() => _platePrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _quantityOrdered = castToType<int>(snapshotData['quantity_ordered']);
    _plateName = snapshotData['plate_name'] as String?;
    _platePrice = castToType<double>(snapshotData['plate_price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('invoice_detail')
          : FirebaseFirestore.instance.collectionGroup('invoice_detail');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('invoice_detail').doc();

  static Stream<InvoiceDetailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoiceDetailRecord.fromSnapshot(s));

  static Future<InvoiceDetailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoiceDetailRecord.fromSnapshot(s));

  static InvoiceDetailRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoiceDetailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoiceDetailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoiceDetailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoiceDetailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoiceDetailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoiceDetailRecordData({
  int? quantityOrdered,
  String? plateName,
  double? platePrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quantity_ordered': quantityOrdered,
      'plate_name': plateName,
      'plate_price': platePrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoiceDetailRecordDocumentEquality
    implements Equality<InvoiceDetailRecord> {
  const InvoiceDetailRecordDocumentEquality();

  @override
  bool equals(InvoiceDetailRecord? e1, InvoiceDetailRecord? e2) {
    return e1?.quantityOrdered == e2?.quantityOrdered &&
        e1?.plateName == e2?.plateName &&
        e1?.platePrice == e2?.platePrice;
  }

  @override
  int hash(InvoiceDetailRecord? e) => const ListEquality()
      .hash([e?.quantityOrdered, e?.plateName, e?.platePrice]);

  @override
  bool isValidKey(Object? o) => o is InvoiceDetailRecord;
}
