import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  /// Query cache managers for this widget.

  final _uuuManager = StreamRequestManager<List<PostRecord>>();
  Stream<List<PostRecord>> uuu({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostRecord>> Function() requestFn,
  }) =>
      _uuuManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUuuCache() => _uuuManager.clear();
  void clearUuuCacheKey(String? uniqueKey) =>
      _uuuManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearUuuCache();
  }
}
