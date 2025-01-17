import '/components/block_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

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
