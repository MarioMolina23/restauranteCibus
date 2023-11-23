import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsInventoryTempRecord extends FirestoreRecord {
  OrderItemsInventoryTempRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menuRef" field.
  DocumentReference? _menuRef;
  DocumentReference? get menuRef => _menuRef;
  bool hasMenuRef() => _menuRef != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "tableNumber" field.
  int? _tableNumber;
  int get tableNumber => _tableNumber ?? 0;
  bool hasTableNumber() => _tableNumber != null;

  void _initializeFields() {
    _menuRef = snapshotData['menuRef'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _tableNumber = castToType<int>(snapshotData['tableNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderItemsInventoryTemp');

  static Stream<OrderItemsInventoryTempRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => OrderItemsInventoryTempRecord.fromSnapshot(s));

  static Future<OrderItemsInventoryTempRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OrderItemsInventoryTempRecord.fromSnapshot(s));

  static OrderItemsInventoryTempRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      OrderItemsInventoryTempRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderItemsInventoryTempRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderItemsInventoryTempRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderItemsInventoryTempRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderItemsInventoryTempRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderItemsInventoryTempRecordData({
  DocumentReference? menuRef,
  int? cantidad,
  int? tableNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'menuRef': menuRef,
      'cantidad': cantidad,
      'tableNumber': tableNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderItemsInventoryTempRecordDocumentEquality
    implements Equality<OrderItemsInventoryTempRecord> {
  const OrderItemsInventoryTempRecordDocumentEquality();

  @override
  bool equals(
      OrderItemsInventoryTempRecord? e1, OrderItemsInventoryTempRecord? e2) {
    return e1?.menuRef == e2?.menuRef &&
        e1?.cantidad == e2?.cantidad &&
        e1?.tableNumber == e2?.tableNumber;
  }

  @override
  int hash(OrderItemsInventoryTempRecord? e) =>
      const ListEquality().hash([e?.menuRef, e?.cantidad, e?.tableNumber]);

  @override
  bool isValidKey(Object? o) => o is OrderItemsInventoryTempRecord;
}
