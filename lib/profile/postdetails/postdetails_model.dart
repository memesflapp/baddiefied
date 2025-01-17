import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'postdetails_widget.dart' show PostdetailsWidget;
import 'package:flutter/material.dart';

class PostdetailsModel extends FlutterFlowModel<PostdetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Post component.
  late PostModel postModel;

  @override
  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    postModel.dispose();
  }
}
