import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoPostRecord extends FirestoreRecord {
  VideoPostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _saved = getDataList(snapshotData['saved']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _comments = getDataList(snapshotData['comments']);
    _imageblurhash = snapshotData['imageblurhash'] as String?;
    _height = castToType<double>(snapshotData['height']);
    _width = castToType<double>(snapshotData['width']);
    _video = snapshotData['video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video_post');

  static Stream<VideoPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoPostRecord.fromSnapshot(s));

  static Future<VideoPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoPostRecord.fromSnapshot(s));

  static VideoPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoPostRecordData({
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? userRef,
  String? imageblurhash,
  double? height,
  double? width,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_description': postDescription,
      'time_posted': timePosted,
      'user_ref': userRef,
      'imageblurhash': imageblurhash,
      'height': height,
      'width': width,
      'video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoPostRecordDocumentEquality implements Equality<VideoPostRecord> {
  const VideoPostRecordDocumentEquality();

  @override
  bool equals(VideoPostRecord? e1, VideoPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.saved, e2?.saved) &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.imageblurhash == e2?.imageblurhash &&
        e1?.height == e2?.height &&
        e1?.width == e2?.width &&
        e1?.video == e2?.video;
  }

  @override
  int hash(VideoPostRecord? e) => const ListEquality().hash([
        e?.postDescription,
        e?.timePosted,
        e?.saved,
        e?.userRef,
        e?.likes,
        e?.comments,
        e?.imageblurhash,
        e?.height,
        e?.width,
        e?.video
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoPostRecord;
}
