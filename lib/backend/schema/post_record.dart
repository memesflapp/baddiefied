import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "saved" field.
  List<DocumentReference>? _saved;
  List<DocumentReference> get saved => _saved ?? const [];
  bool hasSaved() => _saved != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "imageblurhash" field.
  String? _imageblurhash;
  String get imageblurhash => _imageblurhash ?? '';
  bool hasImageblurhash() => _imageblurhash != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  bool hasWidth() => _width != null;

  // "is_reported" field.
  bool? _isReported;
  bool get isReported => _isReported ?? false;
  bool hasIsReported() => _isReported != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _saved = getDataList(snapshotData['saved']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _comments = getDataList(snapshotData['comments']);
    _imageblurhash = snapshotData['imageblurhash'] as String?;
    _height = castToType<double>(snapshotData['height']);
    _width = castToType<double>(snapshotData['width']);
    _isReported = snapshotData['is_reported'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postPhoto,
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? userRef,
  String? imageblurhash,
  double? height,
  double? width,
  bool? isReported,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_description': postDescription,
      'time_posted': timePosted,
      'user_ref': userRef,
      'imageblurhash': imageblurhash,
      'height': height,
      'width': width,
      'is_reported': isReported,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.saved, e2?.saved) &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.imageblurhash == e2?.imageblurhash &&
        e1?.height == e2?.height &&
        e1?.width == e2?.width &&
        e1?.isReported == e2?.isReported;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postDescription,
        e?.timePosted,
        e?.saved,
        e?.userRef,
        e?.likes,
        e?.comments,
        e?.imageblurhash,
        e?.height,
        e?.width,
        e?.isReported
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
