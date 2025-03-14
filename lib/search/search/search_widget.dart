import 'package:cached_network_image/cached_network_image.dart';
import 'package:flapp/utils/generics.dart';

import '/backend/backend.dart';
import '/components/block_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:text_search/text_search.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.user = await queryUserRecordOnce();
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            height: screenHeight(context),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/images/background_white.webp",
              ),
              fit: BoxFit.fill,
            )),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/text_box_background.webp"),
                                  fit: BoxFit.fill)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    const Duration(milliseconds: 0),
                                        () async {
                                      await queryUserRecordOnce()
                                          .then(
                                            (records) => _model
                                            .simpleSearchResults =
                                            TextSearch(
                                              records
                                                  .map(
                                                    (record) =>
                                                    TextSearchItem
                                                        .fromTerms(
                                                        record, [
                                                      record.displayName,
                                                      record.username
                                                    ]),
                                              )
                                                  .toList(),
                                            )
                                                .search(_model
                                                .textController
                                                .text)
                                                .map((r) => r.object)
                                                .toList(),
                                      )
                                          .onError((_, __) => _model
                                          .simpleSearchResults = [])
                                          .whenComplete(
                                              () => safeSetState(() {}));
                                    },
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                      letterSpacing: 0.0,
                                    ),
                                    hintText: 'Search memes or people',
                                    hintStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                        color:
                                        FlutterFlowTheme.of(
                                            context)
                                            .hintColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x5257636C),
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder:
                                    OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context)
                                            .error,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    letterSpacing: 0.0,
                                  ),
                                  validator: _model
                                      .textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 44.0),
                        child: Builder(
                          builder: (context) {
                            final search = _model.simpleSearchResults.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: search.length,
                              itemBuilder: (context, searchIndex) {
                                final searchItem = search[searchIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                            searchItem.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 51.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x32000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(26.0),
                                              child: CachedNetworkImage(
                                                imageUrl: searchItem.photoUrl,
                                                width: 36.0,
                                                height: 36.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searchItem.displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            letterSpacing: 0.0,
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
                              },
                            );
                          },
                        ),
                      ),
                    ].addToStart(const SizedBox(height: 20.0)),
                  ),
                ),
                wrapWithModel(
                  model: _model.blockModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const BlockWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
