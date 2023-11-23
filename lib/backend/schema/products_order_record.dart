import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsOrderRecord extends FirestoreRecord {
  ProductsOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menuDish" field.
  DocumentReference? _menuDish;
  DocumentReference? get menuDish => _menuDish;
  bool hasMenuDish() => _menuDish != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "table_number" field.
  int? _tableNumber;
  int get tableNumber => _tableNumber ?? 0;
  bool hasTableNumber() => _tableNumber != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  bool hasIsSelected() => _isSelected != null;

  void _initializeFields() {
    _menuDish = snapshotData['menuDish'] as DocumentReference?;
    _amount = castToType<int>(snapshotData['amount']);
    _tableNumber = castToType<int>(snapshotData['table_number']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _price = castToType<int>(snapshotData['price']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _isSelected = snapshotData['isSelected'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('productsOrder');

  static Stream<ProductsOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsOrderRecord.fromSnapshot(s));

  static Future<ProductsOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsOrderRecord.fromSnapshot(s));

  static ProductsOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsOrderRecordData({
  DocumentReference? menuDish,
  int? amount,
  int? tableNumber,
  DateTime? createdTime,
  DocumentReference? orderRef,
  int? price,
  DocumentReference? userRef,
  bool? isSelected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'menuDish': menuDish,
      'amount': amount,
      'table_number': tableNumber,
      'createdTime': createdTime,
      'orderRef': orderRef,
      'price': price,
      'userRef': userRef,
      'isSelected': isSelected,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsOrderRecordDocumentEquality
    implements Equality<ProductsOrderRecord> {
  const ProductsOrderRecordDocumentEquality();

  @override
  bool equals(ProductsOrderRecord? e1, ProductsOrderRecord? e2) {
    return e1?.menuDish == e2?.menuDish &&
        e1?.amount == e2?.amount &&
        e1?.tableNumber == e2?.tableNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.orderRef == e2?.orderRef &&
        e1?.price == e2?.price &&
        e1?.userRef == e2?.userRef &&
        e1?.isSelected == e2?.isSelected;
  }

  @override
  int hash(ProductsOrderRecord? e) => const ListEquality().hash([
        e?.menuDish,
        e?.amount,
        e?.tableNumber,
        e?.createdTime,
        e?.orderRef,
        e?.price,
        e?.userRef,
        e?.isSelected
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsOrderRecord;
}
