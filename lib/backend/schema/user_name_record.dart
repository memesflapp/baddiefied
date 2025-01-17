import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNameRecord extends FirestoreRecord {
  UserNameRecord._(
    super.reference,
    super.data,
  ) {
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
      FirebaseFirestore.instance.collection('userName');

  static Stream<UserNameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNameRecord.fromSnapshot(s));

  static Future<UserNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserNameRecord.fromSnapshot(s));

  static UserNameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNameRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNameRecordDocumentEquality implements Equality<UserNameRecord> {
  const UserNameRecordDocumentEquality();

  @override
  bool equals(UserNameRecord? e1, UserNameRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(UserNameRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is UserNameRecord;
}
