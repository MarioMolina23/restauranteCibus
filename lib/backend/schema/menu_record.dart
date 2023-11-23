import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dish_name" field.
  String? _dishName;
  String get dishName => _dishName ?? '';
  bool hasDishName() => _dishName != null;

  // "dish_url" field.
  String? _dishUrl;
  String get dishUrl => _dishUrl ?? '';
  bool hasDishUrl() => _dishUrl != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "being_edited" field.
  bool? _beingEdited;
  bool get beingEdited => _beingEdited ?? false;
  bool hasBeingEdited() => _beingEdited != null;

  // "subtractedFromInventory" field.
  bool? _subtractedFromInventory;
  bool get subtractedFromInventory => _subtractedFromInventory ?? false;
  bool hasSubtractedFromInventory() => _subtractedFromInventory != null;

  void _initializeFields() {
    _dishName = snapshotData['dish_name'] as String?;
    _dishUrl = snapshotData['dish_url'] as String?;
    _type = getDataList(snapshotData['type']);
    _price = castToType<int>(snapshotData['price']);
    _beingEdited = snapshotData['being_edited'] as bool?;
    _subtractedFromInventory = snapshotData['subtractedFromInventory'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? dishName,
  String? dishUrl,
  int? price,
  bool? beingEdited,
  bool? subtractedFromInventory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dish_name': dishName,
      'dish_url': dishUrl,
      'price': price,
      'being_edited': beingEdited,
      'subtractedFromInventory': subtractedFromInventory,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dishName == e2?.dishName &&
        e1?.dishUrl == e2?.dishUrl &&
        listEquality.equals(e1?.type, e2?.type) &&
        e1?.price == e2?.price &&
        e1?.beingEdited == e2?.beingEdited &&
        e1?.subtractedFromInventory == e2?.subtractedFromInventory;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality().hash([
        e?.dishName,
        e?.dishUrl,
        e?.type,
        e?.price,
        e?.beingEdited,
        e?.subtractedFromInventory
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
