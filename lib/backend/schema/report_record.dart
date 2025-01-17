import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportRecord extends FirestoreRecord {
  ReportRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reportId" field.
  String? _reportId;
  String get reportId => _reportId ?? '';
  bool hasReportId() => _reportId != null;

  // "reprtProfile" field.
  DocumentReference? _reprtProfile;
  DocumentReference? get reprtProfile => _reprtProfile;
  bool hasReprtProfile() => _reprtProfile != null;

  // "reprotText" field.
  String? _reprotText;
  String get reprotText => _reprotText ?? '';
  bool hasReprotText() => _reprotText != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _reportId = snapshotData['reportId'] as String?;
    _reprtProfile = snapshotData['reprtProfile'] as DocumentReference?;
    _reprotText = snapshotData['reprotText'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('report');

  static Stream<ReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportRecord.fromSnapshot(s));

  static Future<ReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportRecord.fromSnapshot(s));

  static ReportRecord fromSnapshot(DocumentSnapshot snapshot) => ReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportRecordData({
  String? reportId,
  DocumentReference? reprtProfile,
  String? reprotText,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportId': reportId,
      'reprtProfile': reprtProfile,
      'reprotText': reprotText,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportRecordDocumentEquality implements Equality<ReportRecord> {
  const ReportRecordDocumentEquality();

  @override
  bool equals(ReportRecord? e1, ReportRecord? e2) {
    return e1?.reportId == e2?.reportId &&
        e1?.reprtProfile == e2?.reprtProfile &&
        e1?.reprotText == e2?.reprotText &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(ReportRecord? e) => const ListEquality()
      .hash([e?.reportId, e?.reprtProfile, e?.reprotText, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is ReportRecord;
}
