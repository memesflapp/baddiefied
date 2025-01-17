import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'post_widget.dart' show PostWidget;
import 'package:flutter/material.dart';

class PostModel extends FlutterFlowModel<PostWidget> {
  /// Query cache managers for this widget.

  final _componentManager = StreamRequestManager<PostRecord>();
  Stream<PostRecord> component({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<PostRecord> Function() requestFn,
  }) =>
      _componentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearComponentCache() => _componentManager.clear();
  void clearComponentCacheKey(String? uniqueKey) =>
      _componentManager.clearRequest(uniqueKey);

  final _userManager = StreamRequestManager<UserRecord>();
  Stream<UserRecord> user({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UserRecord> Function() requestFn,
  }) =>
      _userManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserCache() => _userManager.clear();
  void clearUserCacheKey(String? uniqueKey) =>
      _userManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearComponentCache();

    clearUserCache();
  }
}
