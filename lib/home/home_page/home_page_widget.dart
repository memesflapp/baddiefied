import '/backend/backend.dart';
import '/components/block_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flapp.Meme',
                style: FlutterFlowTheme.of(context).bodyMedium.override(

                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 26.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 40.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.person_2,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('Profile');
                    },
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              StreamBuilder<List<PostRecord>>(
                stream: queryPostRecord(
                  queryBuilder: (postRecord) =>
                      postRecord.orderBy('time_posted', descending: true),
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
                  List<PostRecord> columnPostRecordList = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnPostRecordList.length,
                          (columnIndex) {
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
    );
  }
}
