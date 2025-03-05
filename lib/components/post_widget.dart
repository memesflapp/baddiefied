import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/menu/menu_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.postRef,
  });

  final DocumentReference? postRef;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostRecord>(
      stream: _model.component(
        requestFn: () => PostRecord.getDocument(widget.postRef!),
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

        final columnPostRecord = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: StreamBuilder<UserRecord>(
                stream: _model.user(
                  requestFn: () =>
                      UserRecord.getDocument(columnPostRecord.userRef!),
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

                  final rowUserRecord = snapshot.data!;

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (columnPostRecord.userRef ==
                              currentUserReference) {
                            context.pushNamed('Profile');

                            return;
                          } else {
                            context.pushNamed(
                              'UserProfile',
                              queryParameters: {
                                'userRef': serializeParam(
                                  rowUserRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.1,
                          height: MediaQuery.sizeOf(context).width * 0.1,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: rowUserRecord.photoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'UserProfile',
                              queryParameters: {
                                'userRef': serializeParam(
                                  rowUserRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rowUserRecord.username,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(

                                      letterSpacing: 0.0,
                                    ),
                              ),
                              if (rowUserRecord.followers.isNotEmpty)
                                Text(
                                  rowUserRecord.followers.length.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(

                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                            ].divide(const SizedBox(height: 6.0)),
                          ),
                        ),
                      ),
                      if (columnPostRecord.userRef != currentUserReference)
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 40.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.more_vert,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height: 400.0,
                                    child: MenuWidget(
                                      userREf: columnPostRecord.userRef!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                    ].divide(const SizedBox(width: 10.0)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: OctoImage(
                  placeholderBuilder: (_) => SizedBox.expand(
                    child: Image(
                      image: BlurHashImage(columnPostRecord.imageblurhash),
                      fit: BoxFit.cover,
                    ),
                  ),
                  image: NetworkImage(
                    columnPostRecord.postPhoto,
                  ),
                  width: 1000.0,
                  height: 605.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (!columnPostRecord.likes
                              .contains(currentUserReference)) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.heavyImpact();

                                await widget.postRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'likes': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              },
                              child: FaIcon(
                                FontAwesomeIcons.solidMeh,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            );
                          } else {
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.postRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'likes': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.solidSmile,
                                color: Color(0xFFFD1846),
                                size: 24.0,
                              ),
                            );
                          }
                        },
                      ),
                      Text(
                        columnPostRecord.likes.length.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(

                              fontSize: 17.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height: 500.0,
                                  child: CommentPostWidget(
                                    post: columnPostRecord.reference,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              valueOrDefault<String>(
                                columnPostRecord.comments.length.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(

                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (!(currentUserDocument?.saved.toList() ?? [])
                              .contains(widget.postRef)) {
                            return FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: const Icon(
                                Icons.bookmark_border,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            );
                          } else {
                            return FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: const Icon(
                                Icons.bookmark_rounded,
                                color: Color(0xFFFB4852),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved': FieldValue.arrayRemove(
                                          [widget.postRef]),
                                    },
                                  ),
                                });
                              },
                            );
                          }
                        },
                      ),
                    ].divide(const SizedBox(width: 5.0)),
                  ),
                ].divide(const SizedBox(width: 20.0)),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Text(
                  columnPostRecord.postDescription.maybeHandleOverflow(
                    maxChars: 60,
                    replacement: '…',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(

                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: 500.0,
                              child: CommentPostWidget(
                                post: columnPostRecord.reference,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Text(
                      'View All Comment',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(

                            fontSize: 12.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 25.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dateTimeFormat("relative", columnPostRecord.timePosted!),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(

                          fontSize: 10.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ].divide(const SizedBox(width: 25.0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
