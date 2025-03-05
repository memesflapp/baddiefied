import 'package:flapp/utils/generics.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
          () async {
        _model.message = null;
        safeSetState(() {});
        _model.userName = await queryUserNameRecordOnce(
          queryBuilder: (userNameRecord) =>
              userNameRecord.where(
                'name',
                isEqualTo: _model.textController.text,
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.userName != null) {
          _model.message = null;
          safeSetState(() {});
          _model.message = 'Username already used by other user';
          safeSetState(() {});
          safeSetState(() {
            _model.textController?.clear();
          });
        }

        safeSetState(() {});
      },
    );
    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme
            .of(context)
            .purpleBackgroundColor,
        // appBar: PreferredSize(
        //   preferredSize:
        //       Size.fromHeight(MediaQuery.sizeOf(context).height * 0.16),
        //   child: AppBar(
        //     backgroundColor: FlutterFlowTheme.of(context).primary,
        //     automaticallyImplyLeading: false,
        //     actions: const [],
        //     flexibleSpace: FlexibleSpaceBar(
        //       background: ClipRRect(
        //         borderRadius: BorderRadius.circular(8.0),
        //         child: Image.asset(
        //           Theme.of(context).brightness == Brightness.dark
        //               ? 'assets/images/trasnaparent.png'
        //               : 'assets/images/trasnaparent.png',
        //           width: 136.0,
        //           height: 0.0,
        //           fit: BoxFit.contain,
        //         ),
        //       ),
        //     ),
        //     centerTitle: true,
        //     elevation: 0.0,
        //   ),
        // ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_purple.webp"),
                  fit: BoxFit.fill)),
          child: Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    'FLAPPMEME',
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyMedium
                        .override(
                      color: valueOrDefault<Color>(
                        Theme
                            .of(context)
                            .brightness == Brightness.dark
                            ? FlutterFlowTheme
                            .of(context)
                            .primaryGreenColor
                            : FlutterFlowTheme
                            .of(context)
                            .primaryGreenColor,
                        FlutterFlowTheme
                            .of(context)
                            .primaryText,
                      ),
                      fontSize: 48.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth(context) * 0.75,
                  // height: screenHeight(context) * 0.35,
                  // padding: EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    //   color: FlutterFlowTheme.of(context).purpleBackgroundColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/dialog_background.webp"),
                        fit: BoxFit.fill
                      )
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(0.0),
                    //   bottomRight: Radius.circular(0.0),
                    //   topLeft: Radius.circular(20.0),
                    //   topRight: Radius.circular(20.0),
                  ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'SIGN UP',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .bodyMedium
                                  .override(
                                color: valueOrDefault<Color>(
                                  Theme
                                      .of(context)
                                      .brightness ==
                                      Brightness.dark
                                      ? Colors.black
                                      : Colors.white,
                                  FlutterFlowTheme
                                      .of(context)
                                      .primaryText,
                                ),
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          // Text(
                          //   'Username',
                          //   style: FlutterFlowTheme.of(context)
                          //       .bodyMedium
                          //       .override(
                          //         fontSize: 14.0,
                          //         letterSpacing: 0.0,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          // ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/text_box_background.webp"),
                                    fit: BoxFit.fill,
                                  )),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                    letterSpacing: 0.0,
                                  ),
                                  hintText: 'Enter your username',
                                  hintStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .hintColor
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x5257636C),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  // filled: true,
                                  // fillColor: FlutterFlowTheme.of(context)
                                  //     .secondaryBackground,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium
                                    .override(
                                  letterSpacing: 0.0,
                                ),
                                cursorColor:
                                FlutterFlowTheme
                                    .of(context)
                                    .primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          if (_model.message != null && _model.message != '')
                            Text(
                              'Username already present.',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .bodyMedium
                                  .override(
                                color: const Color(0xFFFD1846),
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                            ),
                          // Text(
                          //   'Email',
                          //   style: FlutterFlowTheme.of(context)
                          //       .bodyMedium
                          //       .override(
                          //         letterSpacing: 0.0,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          // ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/text_box_background.webp"),
                                    fit: BoxFit.fill,
                                  )),
                              child: TextFormField(
                                controller: _model.emailTextController,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                    letterSpacing: 0.0,
                                  ),
                                  hintText: 'Enter you Email',
                                  hintStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .hintColor
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x5257636C),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  // filled: true,
                                  // fillColor: FlutterFlowTheme.of(context)
                                  //     .secondaryBackground,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium
                                    .override(
                                  letterSpacing: 0.0,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor:
                                FlutterFlowTheme
                                    .of(context)
                                    .primaryText,
                                validator: _model.emailTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          // Text(
                          //   'Password',
                          //   style: FlutterFlowTheme.of(context)
                          //       .bodyMedium
                          //       .override(
                          //         letterSpacing: 0.0,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          // ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/text_box_background.webp"),
                                    fit: BoxFit.fill,
                                  )),
                              child: TextFormField(
                                controller: _model.passwordTextController,
                                focusNode: _model.textFieldFocusNode3,
                                autofocus: false,
                                obscureText: !_model.passwordVisibility,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                    letterSpacing: 0.0,
                                  ),
                                  hintText: 'Enter your password',
                                  hintStyle: FlutterFlowTheme
                                      .of(context)
                                      .labelMedium
                                      .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .hintColor
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x5257636C),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                      FlutterFlowTheme
                                          .of(context)
                                          .error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  // filled: true,
                                  // fillColor: FlutterFlowTheme.of(context)
                                  //     .secondaryBackground,
                                  suffixIcon: InkWell(
                                    onTap: () =>
                                        safeSetState(
                                              () =>
                                          _model.passwordVisibility =
                                          !_model.passwordVisibility,
                                        ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 19.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium
                                    .override(
                                  letterSpacing: 0.0,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor:
                                FlutterFlowTheme
                                    .of(context)
                                    .primaryText,
                                validator: _model
                                    .passwordTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await UserNameRecord.collection
                                    .doc()
                                    .set(createUserNameRecordData(
                                  name: _model.textController.text,
                                ));
                                GoRouter.of(context).prepareAuthEvent();

                                final user =
                                await authManager.createAccountWithEmail(
                                  context,
                                  _model.emailTextController.text,
                                  _model.passwordTextController.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                await UserRecord.collection
                                    .doc(user.uid)
                                    .update(createUserRecordData(
                                  username: _model.textController.text,
                                ));

                                context.goNamedAuth(
                                    'HomePage', context.mounted);
                              },
                              text: 'Register',
                              options: FFButtonOptions(
                                // width: 148.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme
                                    .of(context)
                                    .primary,
                                textStyle: FlutterFlowTheme
                                    .of(context)
                                    .titleSmall
                                    .override(
                                    color: FlutterFlowTheme
                                        .of(context)
                                        .buttonTextColor,
                                    letterSpacing: 0.0,
                                    fontSize: 20, fontWeight: FontWeight.w900
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 18.0)),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with existing account ?',
                          style: FlutterFlowTheme
                              .of(context)
                              .bodyMedium
                              .override(
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme
                                .of(context)
                                .info,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.textController.text != '') {
                            await UserNameRecord.collection
                                .doc()
                                .set(createUserNameRecordData(
                              name: _model.textController.text,
                            ));
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                            await authManager.signInWithGoogle(context);
                            if (user == null) {
                              return;
                            }

                            await currentUserReference!.update(
                                createUserRecordData(
                                  username: _model.textController.text,
                                ));

                            context.goNamedAuth('HomePage', context.mounted);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Enter username first.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme
                                        .of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                FlutterFlowTheme
                                    .of(context)
                                    .secondary,
                              ),
                            );
                          }
                        },
                        text: 'Continue with Google',
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Color(0xFFF41420),
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          color: FlutterFlowTheme
                              .of(context)
                              .primary,
                          textStyle:
                          FlutterFlowTheme
                              .of(context)
                              .titleSmall
                              .override(
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontSize: 20, fontWeight: FontWeight.w900
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: FlutterFlowTheme
                              .of(context)
                              .bodyMedium
                              .override(
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme
                                .of(context)
                                .info,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('LoginPage');
                      },
                      text: 'Signin',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme
                            .of(context)
                            .primaryBackground,
                        textStyle: FlutterFlowTheme
                            .of(context)
                            .titleSmall
                            .override(
                            color: FlutterFlowTheme
                                .of(context)
                                .buttonTextColor,
                            letterSpacing: 0.0,
                            fontSize: 20, fontWeight: FontWeight.w900
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
