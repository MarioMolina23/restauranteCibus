import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "min_available_stock" field.
  int? _minAvailableStock;
  int get minAvailableStock => _minAvailableStock ?? 0;
  bool hasMinAvailableStock() => _minAvailableStock != null;

  // "unit_of_measure" field.
  String? _unitOfMeasure;
  String get unitOfMeasure => _unitOfMeasure ?? '';
  bool hasUnitOfMeasure() => _unitOfMeasure != null;

  // "category_ref" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "currently_available_stock" field.
  double? _currentlyAvailableStock;
  double get currentlyAvailableStock => _currentlyAvailableStock ?? 0.0;
  bool hasCurrentlyAvailableStock() => _currentlyAvailableStock != null;

  // "one_item_equals_to" field.
  double? _oneItemEqualsTo;
  double get oneItemEqualsTo => _oneItemEqualsTo ?? 0.0;
  bool hasOneItemEqualsTo() => _oneItemEqualsTo != null;

  void _initializeFields() {
    _productName = snapshotData['product_name'] as String?;
    _productImage = snapshotData['product_image'] as String?;
    _minAvailableStock = castToType<int>(snapshotData['min_available_stock']);
    _unitOfMeasure = snapshotData['unit_of_measure'] as String?;
    _categoryRef = snapshotData['category_ref'] as DocumentReference?;
    _currentlyAvailableStock =
        castToType<double>(snapshotData['currently_available_stock']);
    _oneItemEqualsTo = castToType<double>(snapshotData['one_item_equals_to']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productName,
  String? productImage,
  int? minAvailableStock,
  String? unitOfMeasure,
  DocumentReference? categoryRef,
  double? currentlyAvailableStock,
  double? oneItemEqualsTo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_name': productName,
      'product_image': productImage,
      'min_available_stock': minAvailableStock,
      'unit_of_measure': unitOfMeasure,
      'category_ref': categoryRef,
      'currently_available_stock': currentlyAvailableStock,
      'one_item_equals_to': oneItemEqualsTo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.productImage == e2?.productImage &&
        e1?.minAvailableStock == e2?.minAvailableStock &&
        e1?.unitOfMeasure == e2?.unitOfMeasure &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.currentlyAvailableStock == e2?.currentlyAvailableStock &&
        e1?.oneItemEqualsTo == e2?.oneItemEqualsTo;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.productImage,
        e?.minAvailableStock,
        e?.unitOfMeasure,
        e?.categoryRef,
        e?.currentlyAvailableStock,
        e?.oneItemEqualsTo
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
