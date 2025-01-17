import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_post_widget.dart' show CommentPostWidget;
import 'package:flutter/material.dart';

class CommentPostModel extends FlutterFlowModel<CommentPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CommentRecord? ggggg;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
