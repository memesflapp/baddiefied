import 'package:cached_network_image/cached_network_image.dart';
import 'package:flapp/auth/firebase_auth/auth_util.dart';

import '/backend/backend.dart';
import '/components/block_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/images/background_white.webp",
              ),
              fit: BoxFit.fill,
            )),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  // color: Colors.white, // Background color
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FLAPP.MEME',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w900,
                              useGoogleFonts: false,
                            ),
                      ),
                      InkWell(
                        onTap: () => context.pushNamed('Profile'),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.065,
                          height: MediaQuery.sizeOf(context).width * 0.065,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: valueOrDefault<String>(
                              currentUserPhoto,
                              'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StreamBuilder<List<PostRecord>>(
                          stream: queryPostRecord(
                            queryBuilder: (postRecord) => postRecord
                                .orderBy('time_posted', descending: true),
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
                            List<PostRecord> columnPostRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnPostRecordList.length, (columnIndex) {
                                  final columnPostRecord =
                                      columnPostRecordList[columnIndex];
                                  return Hero(
                                    tag: '',
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: PostWidget(
                                        key: Key(
                                            'Keyd3m_${columnIndex}_of_${columnPostRecordList.length}'),
                                        postRef: columnPostRecord.reference,
                                      ),
                                    ),
                                  );
                                }).divide(const SizedBox(height: 20.0)),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.03, 0.07),
                          child: wrapWithModel(
                            model: _model.blockModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const BlockWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
