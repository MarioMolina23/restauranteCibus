import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "table_number" field.
  int? _tableNumber;
  int get tableNumber => _tableNumber ?? 0;
  bool hasTableNumber() => _tableNumber != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "order_detail" field.
  String? _orderDetail;
  String get orderDetail => _orderDetail ?? '';
  bool hasOrderDetail() => _orderDetail != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "stateFood" field.
  Color? _stateFood;
  Color? get stateFood => _stateFood;
  bool hasStateFood() => _stateFood != null;

  // "stateOrder" field.
  int? _stateOrder;
  int get stateOrder => _stateOrder ?? 0;
  bool hasStateOrder() => _stateOrder != null;

  // "percentageDiscount" field.
  String? _percentageDiscount;
  String get percentageDiscount => _percentageDiscount ?? '';
  bool hasPercentageDiscount() => _percentageDiscount != null;

  // "taxes" field.
  int? _taxes;
  int get taxes => _taxes ?? 0;
  bool hasTaxes() => _taxes != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  bool hasTotal() => _total != null;

  // "subtotal" field.
  int? _subtotal;
  int get subtotal => _subtotal ?? 0;
  bool hasSubtotal() => _subtotal != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  void _initializeFields() {
    _tableNumber = castToType<int>(snapshotData['table_number']);
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _orderDetail = snapshotData['order_detail'] as String?;
    _image = snapshotData['image'] as String?;
    _stateFood = getSchemaColor(snapshotData['stateFood']);
    _stateOrder = castToType<int>(snapshotData['stateOrder']);
    _percentageDiscount = snapshotData['percentageDiscount'] as String?;
    _taxes = castToType<int>(snapshotData['taxes']);
    _total = castToType<int>(snapshotData['total']);
    _subtotal = castToType<int>(snapshotData['subtotal']);
    _discount = castToType<int>(snapshotData['discount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? tableNumber,
  DateTime? creationDate,
  String? orderDetail,
  String? image,
  Color? stateFood,
  int? stateOrder,
  String? percentageDiscount,
  int? taxes,
  int? total,
  int? subtotal,
  int? discount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'table_number': tableNumber,
      'creation_date': creationDate,
      'order_detail': orderDetail,
      'image': image,
      'stateFood': stateFood,
      'stateOrder': stateOrder,
      'percentageDiscount': percentageDiscount,
      'taxes': taxes,
      'total': total,
      'subtotal': subtotal,
      'discount': discount,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.tableNumber == e2?.tableNumber &&
        e1?.creationDate == e2?.creationDate &&
        e1?.orderDetail == e2?.orderDetail &&
        e1?.image == e2?.image &&
        e1?.stateFood == e2?.stateFood &&
        e1?.stateOrder == e2?.stateOrder &&
        e1?.percentageDiscount == e2?.percentageDiscount &&
        e1?.taxes == e2?.taxes &&
        e1?.total == e2?.total &&
        e1?.subtotal == e2?.subtotal &&
        e1?.discount == e2?.discount;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.tableNumber,
        e?.creationDate,
        e?.orderDetail,
        e?.image,
        e?.stateFood,
        e?.stateOrder,
        e?.percentageDiscount,
        e?.taxes,
        e?.total,
        e?.subtotal,
        e?.discount
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
