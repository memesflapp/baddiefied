import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/generics.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          title: Text(
            'Hossein Darda',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: 400.0,
                                child: MenuWidget(
                                  userREf: widget.userRef!,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.keyboard_control_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                  ),
                ].divide(const SizedBox(width: 4.0)),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<UserRecord>(
            stream: UserRecord.getDocument(widget.userRef!),
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

              final columnUserRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: screenWidth(context) * 0.22,
                    height: screenWidth(context) * 0.22,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context)
                            .purpleBackgroundColor,
                        // Customize the border color
                        width: 2, // Customize the border width
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            8), // Customize the inner border radius
                      ),
                      child: CachedNetworkImage(
                        imageUrl: valueOrDefault<String>(
                          columnUserRecord.photoUrl,
                          'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    columnUserRecord.displayName,
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w900,
                        color: FlutterFlowTheme.of(context)
                            .purpleBackgroundColor
                    ),
                  ),
                  Text(
                    columnUserRecord.bio,
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w400,
                        color: FlutterFlowTheme.of(context)
                            .dividerColor
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        48.0, 16.0, 48.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<PostRecord>>(
                              stream: queryPostRecord(
                                queryBuilder: (postRecord) => postRecord.where(
                                  'user_ref',
                                  isEqualTo: widget.userRef,
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
                                List<PostRecord> textPostRecordList =
                                    snapshot.data!;

                                return Text(
                                  formatNumber(
                                    textPostRecordList.length,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          color: FlutterFlowTheme.of(context)
                                              .dividerColor),
                                );
                              },
                            ),
                            Text(
                              'POSTS',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: FlutterFlowTheme.of(context)
                                          .dividerColor),
                            ),
                          ].divide(const SizedBox(height: 7.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              formatNumber(
                                columnUserRecord.followers.length,
                                formatType: FormatType.compact,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                      color: FlutterFlowTheme.of(context)
                                          .dividerColor),
                            ),
                            Text(
                              'FOLLOWERS',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: FlutterFlowTheme.of(context)
                                          .dividerColor),
                            ),
                          ].divide(const SizedBox(height: 7.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              formatNumber(
                                columnUserRecord.following.length,
                                formatType: FormatType.compact,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                  color:
                                  FlutterFlowTheme.of(context)
                                      .dividerColor
                                  ),
                            ),
                            Text(
                              'FOLLOWING',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                  fontFamily: 'Noto Sans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color:
                                  FlutterFlowTheme.of(context)
                                      .dividerColor),
                            ),
                          ].divide(const SizedBox(height: 7.0)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  if ((currentUserDocument?.following.toList() ?? [])
                      .contains(columnUserRecord.reference))
                    AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'following': FieldValue.arrayRemove(
                                    [columnUserRecord.reference]),
                              },
                            ),
                          });

                          await columnUserRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'followers': FieldValue.arrayRemove(
                                    [currentUserReference]),
                              },
                            ),
                          });
                        },
                        text: 'Unfollow',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            Colors.black,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: FlutterFlowTheme.of(context)
                                        .buttonTextColor,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  if (!(currentUserDocument?.following.toList() ?? [])
                      .contains(columnUserRecord.reference))
                    AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'following': FieldValue.arrayUnion(
                                    [columnUserRecord.reference]),
                              },
                            ),
                          });

                          await columnUserRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'followers': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              },
                            ),
                          });
                        },
                        text: 'Follow',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            Colors.black,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                  color: FlutterFlowTheme.of(context)
                                      .buttonTextColor,
                                  letterSpacing: 0.0,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 10.0, 0.0),
                      child: StreamBuilder<List<PostRecord>>(
                        stream: _model.uuu(
                          requestFn: () => queryPostRecord(
                            queryBuilder: (postRecord) => postRecord.where(
                              'user_ref',
                              isEqualTo: widget.userRef,
                            ),
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
                          List<PostRecord> gridViewPostRecordList =
                              snapshot.data!;

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewPostRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewPostRecord =
                                  gridViewPostRecordList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Postdetails',
                                    queryParameters: {
                                      'post': serializeParam(
                                        gridViewPostRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'userRef': serializeParam(
                                        columnUserRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Hero(
                                  tag: gridViewPostRecord.postPhoto,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: gridViewPostRecord.postPhoto,
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
