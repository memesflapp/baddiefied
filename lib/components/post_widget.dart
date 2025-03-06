import 'package:flapp/utils/generics.dart';

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
              padding:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
                            imageUrl: valueOrDefault<String>(
                              rowUserRecord.photoUrl,
                              'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg',
                            ),
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
            // post
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
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
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
                        "${columnPostRecord.likes.length.toString()} Reactions",
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w900,
                            color: FlutterFlowTheme.of(context).dividerColor),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
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
                      valueOrDefault<String>(
                        "${columnPostRecord.comments.length.toString()} Comment${columnPostRecord.comments.length > 1 ? 's' : ''}",
                        '0 Comments',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                          color: FlutterFlowTheme.of(context).dividerColor),
                    ),
                  ),
                ].divide(const SizedBox(width: 20.0)),
              ),
            ),
            // divider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: FlutterFlowTheme.of(context).dividerColor,
                thickness: 1,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async => {
                      if (!columnPostRecord.likes
                          .contains(currentUserReference))
                        {
                          HapticFeedback.heavyImpact(),
                          await widget.postRef!.update({
                            ...mapToFirestore(
                              {
                                'likes': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              },
                            ),
                          })
                        }
                      else
                        {
                          await widget.postRef!.update({
                            ...mapToFirestore(
                              {
                                'likes': FieldValue.arrayRemove(
                                    [currentUserReference]),
                              },
                            ),
                          })
                        }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 24, right: 24),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/white_small_background.webp"),
                            fit: BoxFit.fill),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              !columnPostRecord.likes
                                      .contains(currentUserReference)
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: !columnPostRecord.likes
                                      .contains(currentUserReference)
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : const Color(0xFFFD1846),
                              size: 16.0,
                            ),
                            Text(
                              !columnPostRecord.likes
                                      .contains(currentUserReference)
                                  ? 'Like'
                                  : 'Liked',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                      color: FlutterFlowTheme.of(context)
                                          .dividerColor),
                            ),
                          ].divide(const SizedBox(width: 7.0)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
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
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 24, right: 24),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/white_small_background.webp"),
                            fit: BoxFit.fitHeight),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.comment,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 16.0,
                            ),
                            Text(
                              "Comment",
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                      color: FlutterFlowTheme.of(context)
                                          .dividerColor),
                            ),
                          ].divide(const SizedBox(width: 7.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 24, right: 24),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/white_small_background.webp"),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                          Text(
                            "Share",
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                    color: FlutterFlowTheme.of(context)
                                        .dividerColor),
                          ),
                        ].divide(const SizedBox(width: 7.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Divider(
                color: FlutterFlowTheme.of(context).thickDividerColor,
                thickness: 4,
                height: 4,
              ),
            ),
          ],
        );
      },
    );
  }
}
