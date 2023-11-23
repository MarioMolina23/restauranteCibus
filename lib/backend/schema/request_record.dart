import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menuDish" field.
  DocumentReference? _menuDish;
  DocumentReference? get menuDish => _menuDish;
  bool hasMenuDish() => _menuDish != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "subtotal" field.
  int? _subtotal;
  int get subtotal => _subtotal ?? 0;
  bool hasSubtotal() => _subtotal != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _menuDish = snapshotData['menuDish'] as DocumentReference?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _subtotal = castToType<int>(snapshotData['subtotal']);
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  DocumentReference? menuDish,
  int? cantidad,
  int? subtotal,
  DocumentReference? productRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'menuDish': menuDish,
      'cantidad': cantidad,
      'subtotal': subtotal,
      'productRef': productRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    return e1?.menuDish == e2?.menuDish &&
        e1?.cantidad == e2?.cantidad &&
        e1?.subtotal == e2?.subtotal &&
        e1?.productRef == e2?.productRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality()
      .hash([e?.menuDish, e?.cantidad, e?.subtotal, e?.productRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
