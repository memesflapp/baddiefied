// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    String? text,
    DocumentReference? userRef,
    List<DocumentReference>? liked,
    bool? isReported,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _userRef = userRef,
        _liked = liked,
        _isReported = isReported,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "liked" field.
  List<DocumentReference>? _liked;
  List<DocumentReference> get liked => _liked ?? const [];
  set liked(List<DocumentReference>? val) => _liked = val;

  void updateLiked(Function(List<DocumentReference>) updateFn) {
    updateFn(_liked ??= []);
  }

  bool hasLiked() => _liked != null;

  // "is_reported" field.
  bool? _isReported;
  bool get isReported => _isReported ?? false;
  set isReported(bool? val) => _isReported = val;

  bool hasIsReported() => _isReported != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        text: data['text'] as String?,
        userRef: data['userRef'] as DocumentReference?,
        liked: getDataList(data['liked']),
        isReported: data['is_reported'] as bool?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'userRef': _userRef,
        'liked': _liked,
        'is_reported': _isReported,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'liked': serializeParam(
          _liked,
          ParamType.DocumentReference,
          isList: true,
        ),
        'is_reported': serializeParam(
          _isReported,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        liked: deserializeParam<DocumentReference>(
          data['liked'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['user'],
        ),
        isReported: deserializeParam(
          data['is_reported'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CommentStruct &&
        text == other.text &&
        userRef == other.userRef &&
        listEquality.equals(liked, other.liked) &&
        isReported == other.isReported;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([text, userRef, liked, isReported]);
}

CommentStruct createCommentStruct({
  String? text,
  DocumentReference? userRef,
  bool? isReported,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      text: text,
      userRef: userRef,
      isReported: isReported,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? comment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? comment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comment == null) {
    return;
  }
  if (comment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentData = getCommentFirestoreData(comment, forFieldValue);
  final nestedData = commentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? comment, [
  bool forFieldValue = false,
]) {
  if (comment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comment.toMap());

  // Add any Firestore field values
  comment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? comments,
) =>
    comments?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
