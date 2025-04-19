import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  String? message;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  UserNameRecord? userName;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  // Stores action output result for [Custom Action - generateRandomUsername] action in TextField widget.
  String? randomUserName;

  // Add username error field
  String? usernameError;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController?.dispose();

    textFieldFocusNode2?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode3?.dispose();
    passwordTextController?.dispose();

    textFieldFocusNode4?.dispose();
    nameTextController?.dispose();
  }
}
