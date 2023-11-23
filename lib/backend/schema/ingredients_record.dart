import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientsRecord extends FirestoreRecord {
  IngredientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "name_product" field.
  String? _nameProduct;
  String get nameProduct => _nameProduct ?? '';
  bool hasNameProduct() => _nameProduct != null;

  // "category_ref" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "unit_of_measure" field.
  String? _unitOfMeasure;
  String get unitOfMeasure => _unitOfMeasure ?? '';
  bool hasUnitOfMeasure() => _unitOfMeasure != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _nameProduct = snapshotData['name_product'] as String?;
    _categoryRef = snapshotData['category_ref'] as DocumentReference?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _unitOfMeasure = snapshotData['unit_of_measure'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ingredients')
          : FirebaseFirestore.instance.collectionGroup('ingredients');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ingredients').doc();

  static Stream<IngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredientsRecord.fromSnapshot(s));

  static Future<IngredientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngredientsRecord.fromSnapshot(s));

  static IngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredientsRecordData({
  String? image,
  String? nameProduct,
  DocumentReference? categoryRef,
  DocumentReference? productRef,
  double? quantity,
  String? unitOfMeasure,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'name_product': nameProduct,
      'category_ref': categoryRef,
      'product_ref': productRef,
      'quantity': quantity,
      'unit_of_measure': unitOfMeasure,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredientsRecordDocumentEquality implements Equality<IngredientsRecord> {
  const IngredientsRecordDocumentEquality();

  @override
  bool equals(IngredientsRecord? e1, IngredientsRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.nameProduct == e2?.nameProduct &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.unitOfMeasure == e2?.unitOfMeasure;
  }

  @override
  int hash(IngredientsRecord? e) => const ListEquality().hash([
        e?.image,
        e?.nameProduct,
        e?.categoryRef,
        e?.productRef,
        e?.quantity,
        e?.unitOfMeasure
      ]);

  @override
  bool isValidKey(Object? o) => o is IngredientsRecord;
}
