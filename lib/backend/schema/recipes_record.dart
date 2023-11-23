import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "minimum_quantity" field.
  int? _minimumQuantity;
  int get minimumQuantity => _minimumQuantity ?? 0;
  bool hasMinimumQuantity() => _minimumQuantity != null;

  // "available_quantity" field.
  int? _availableQuantity;
  int get availableQuantity => _availableQuantity ?? 0;
  bool hasAvailableQuantity() => _availableQuantity != null;

  // "unit_of_measure" field.
  String? _unitOfMeasure;
  String get unitOfMeasure => _unitOfMeasure ?? '';
  bool hasUnitOfMeasure() => _unitOfMeasure != null;

  // "being_edited" field.
  bool? _beingEdited;
  bool get beingEdited => _beingEdited ?? false;
  bool hasBeingEdited() => _beingEdited != null;

  // "one_item_equals_to" field.
  double? _oneItemEqualsTo;
  double get oneItemEqualsTo => _oneItemEqualsTo ?? 0.0;
  bool hasOneItemEqualsTo() => _oneItemEqualsTo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _minimumQuantity = castToType<int>(snapshotData['minimum_quantity']);
    _availableQuantity = castToType<int>(snapshotData['available_quantity']);
    _unitOfMeasure = snapshotData['unit_of_measure'] as String?;
    _beingEdited = snapshotData['being_edited'] as bool?;
    _oneItemEqualsTo = castToType<double>(snapshotData['one_item_equals_to']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  String? image,
  int? minimumQuantity,
  int? availableQuantity,
  String? unitOfMeasure,
  bool? beingEdited,
  double? oneItemEqualsTo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'minimum_quantity': minimumQuantity,
      'available_quantity': availableQuantity,
      'unit_of_measure': unitOfMeasure,
      'being_edited': beingEdited,
      'one_item_equals_to': oneItemEqualsTo,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.minimumQuantity == e2?.minimumQuantity &&
        e1?.availableQuantity == e2?.availableQuantity &&
        e1?.unitOfMeasure == e2?.unitOfMeasure &&
        e1?.beingEdited == e2?.beingEdited &&
        e1?.oneItemEqualsTo == e2?.oneItemEqualsTo;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.minimumQuantity,
        e?.availableQuantity,
        e?.unitOfMeasure,
        e?.beingEdited,
        e?.oneItemEqualsTo
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
