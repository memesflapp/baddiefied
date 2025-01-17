import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "liked" field.
  List<DocumentReference>? _liked;
  List<DocumentReference> get liked => _liked ?? const [];
  bool hasLiked() => _liked != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "is_reported" field.
  bool? _isReported;
  bool get isReported => _isReported ?? false;
  bool hasIsReported() => _isReported != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "pos_ref" field.
  DocumentReference? _posRef;
  DocumentReference? get posRef => _posRef;
  bool hasPosRef() => _posRef != null;

  // "videoPost" field.
  DocumentReference? _videoPost;
  DocumentReference? get videoPost => _videoPost;
  bool hasVideoPost() => _videoPost != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _liked = getDataList(snapshotData['liked']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _isReported = snapshotData['is_reported'] as bool?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _posRef = snapshotData['pos_ref'] as DocumentReference?;
    _videoPost = snapshotData['videoPost'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? text,
  DocumentReference? userRef,
  bool? isReported,
  DateTime? dateTime,
  DocumentReference? posRef,
  DocumentReference? videoPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'userRef': userRef,
      'is_reported': isReported,
      'date_time': dateTime,
      'pos_ref': posRef,
      'videoPost': videoPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.text == e2?.text &&
        listEquality.equals(e1?.liked, e2?.liked) &&
        e1?.userRef == e2?.userRef &&
        e1?.isReported == e2?.isReported &&
        e1?.dateTime == e2?.dateTime &&
        e1?.posRef == e2?.posRef &&
        e1?.videoPost == e2?.videoPost;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality().hash([
        e?.text,
        e?.liked,
        e?.userRef,
        e?.isReported,
        e?.dateTime,
        e?.posRef,
        e?.videoPost
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
