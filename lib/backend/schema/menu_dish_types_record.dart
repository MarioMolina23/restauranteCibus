import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuDishTypesRecord extends FirestoreRecord {
  MenuDishTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu_dish_types');

  static Stream<MenuDishTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuDishTypesRecord.fromSnapshot(s));

  static Future<MenuDishTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuDishTypesRecord.fromSnapshot(s));

  static MenuDishTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuDishTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuDishTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuDishTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuDishTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuDishTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuDishTypesRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuDishTypesRecordDocumentEquality
    implements Equality<MenuDishTypesRecord> {
  const MenuDishTypesRecordDocumentEquality();

  @override
  bool equals(MenuDishTypesRecord? e1, MenuDishTypesRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(MenuDishTypesRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is MenuDishTypesRecord;
}
