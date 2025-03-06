import 'package:flapp/utils/generics.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'comment_post_model.dart';
export 'comment_post_model.dart';

class CommentPostWidget extends StatefulWidget {
  /// Design an Instagram-inspired comment component for a social app in
  /// FlutterFlow. The component should feature a compact layout with a user
  /// profile picture (small circular avatar) on the left, followed by the
  /// username in bold text, then the comment text. Below the comment, add a
  /// timestamp (e.g., '2h ago') and a 'Reply' option in light gray. On the
  /// right side, include a heart icon for likes and display the like count next
  /// to it. For comments with replies, add a collapsible 'View X replies' link
  /// below the original comment that reveals nested replies when tapped. Each
  /// nested reply should be indented slightly, with a smaller avatar, username,
  /// and individual like button. At the bottom of the component, create an
  /// input field with 'Add a comment…' placeholder text and a 'Post' button
  /// that becomes active when text is entered. Use FlutterFlow’s native UI
  /// elements and styling options to achieve a clean, user-friendly look,
  /// similar to Instagram, with a soft color palette and smooth animations for
  /// interactions.
  const CommentPostWidget({
    super.key,
    required this.post,
  });

  final DocumentReference? post;

  @override
  State<CommentPostWidget> createState() => _CommentPostWidgetState();
}

class _CommentPostWidgetState extends State<CommentPostWidget> {
  late CommentPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentPostModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<List<CommentRecord>>(
                    stream: queryCommentRecord(
                      queryBuilder: (commentRecord) => commentRecord.where(
                        'pos_ref',
                        isEqualTo: widget.post,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CommentRecord> columnCommentRecordList = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(columnCommentRecordList.length,
                            (columnIndex) {
                          final columnCommentRecord =
                              columnCommentRecordList[columnIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder<UserRecord>(
                                stream: UserRecord.getDocument(
                                    columnCommentRecord.userRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context).primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final containerUserRecord = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'UserProfile',
                                        queryParameters: {
                                          'userRef': serializeParam(
                                            containerUserRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            containerUserRecord.photoUrl,
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Expanded(
                                child: StreamBuilder<UserRecord>(
                                  stream: UserRecord.getDocument(
                                      columnCommentRecord.userRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context).primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final columnUserRecord = snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              columnUserRecord.username,
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(

                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (!columnCommentRecord.liked
                                                        .contains(
                                                            currentUserReference)) {
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await columnCommentRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'liked': FieldValue
                                                                    .arrayUnion([
                                                                  columnUserRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      );
                                                    } else {
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await columnCommentRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'liked': FieldValue
                                                                    .arrayRemove([
                                                                  columnUserRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: const Icon(
                                                          Icons.favorite_sharp,
                                                          color: Color(0xFFE40030),
                                                          size: 20.0,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                Text(
                                                  columnCommentRecord.liked.length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(

                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Text(
                                          columnCommentRecord.text,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(

                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              dateTimeFormat("relative",
                                                  columnCommentRecord.dateTime!),
                                              style: FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .override(

                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        ),
                                      ].divide(const SizedBox(height: 3.0)),
                                    );
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          );
                        }).divide(const SizedBox(height: 12.0)),
                      );
                    },
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Add a comment...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      letterSpacing: 0.0,
                    ),
                    maxLines: 100,
                    minLines: 1,
                    validator:
                    _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var commentRecordReference =
                      CommentRecord.collection.doc();
                      await commentRecordReference.set(createCommentRecordData(
                        text: _model.textController.text,
                        userRef: currentUserReference,
                        isReported: false,
                        dateTime: getCurrentTimestamp,
                        posRef: widget.post,
                      ));
                      _model.ggggg = CommentRecord.getDocumentFromData(
                          createCommentRecordData(
                            text: _model.textController.text,
                            userRef: currentUserReference,
                            isReported: false,
                            dateTime: getCurrentTimestamp,
                            posRef: widget.post,
                          ),
                          commentRecordReference);

                      await widget.post!.update({
                        ...mapToFirestore(
                          {
                            'comments': FieldValue.arrayUnion(
                                [_model.ggggg?.reference]),
                          },
                        ),
                      });

                      safeSetState(() {});
                    },
                    text: 'Post',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(

                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
