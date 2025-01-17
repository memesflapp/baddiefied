import '/backend/backend.dart';
import '/components/block_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shorts_widget.dart' show ShortsWidget;
import 'package:flutter/material.dart';

class ShortsModel extends FlutterFlowModel<ShortsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Shorts widget.
  VideoPostRecord? vgvg;
  // Model for Block component.
  late BlockModel blockModel;

  @override
  void initState(BuildContext context) {
    blockModel = createModel(context, () => BlockModel());
  }

  @override
  void dispose() {
    blockModel.dispose();
  }
}
