import '../../utils/generics.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).purpleBackgroundColor,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    'FLAPP.MEME',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          color: valueOrDefault<Color>(
                            Theme.of(context).brightness == Brightness.dark
                                ? FlutterFlowTheme.of(context).primaryGreenColor
                                : FlutterFlowTheme.of(context)
                                    .primaryGreenColor,
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                          fontSize: 48.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: screenWidth(context) * 0.75,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/dialog_background.webp"),
                              fit: BoxFit.fill)),
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
                                  'LOGIN',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        color: valueOrDefault<Color>(
                                          Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Colors.white,
                                          FlutterFlowTheme.of(context).primaryText,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
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
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Enter your Email',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              color: FlutterFlowTheme.of(context)
                                                  .hintColor),
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
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primaryText,
                                    validator: _model.emailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
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
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: false,
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: '..........',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              color: FlutterFlowTheme.of(context)
                                                  .hintColor),
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
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).error,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      // filled: true,
                                      // fillColor: FlutterFlowTheme.of(context)
                                      //     .secondaryBackground,
                                      suffixIcon: InkWell(
                                        onTap: () => safeSetState(
                                          () => _model.passwordVisibility =
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
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primaryText,
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
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user = await authManager.signInWithEmail(
                                      context,
                                      _model.emailTextController.text,
                                      _model.passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    context.goNamedAuth(
                                        'HomePage', context.mounted);
                                  },
                                  text: 'Sign in',
                                  options: FFButtonOptions(
                                    // width: 148.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                            color: FlutterFlowTheme.of(context)
                                                .buttonTextColor,
                                            letterSpacing: 0.0,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          final user = await authManager.signInWithGoogle(context);
                          if (user == null) {
                            return;
                          }

                          context.goNamedAuth('HomePage', context.mounted);
                        },
                        text: 'Sign In with Google',
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
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ? ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).info,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('SignUp');
                      },
                      text: 'Sign up',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                            color: FlutterFlowTheme.of(context)
                                .buttonTextColor,
                            letterSpacing: 0.0,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
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
