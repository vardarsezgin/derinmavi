import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'verify_s_m_s_model.dart';
export 'verify_s_m_s_model.dart';

class VerifySMSWidget extends StatefulWidget {
  const VerifySMSWidget({Key? key}) : super(key: key);

  @override
  _VerifySMSWidgetState createState() => _VerifySMSWidgetState();
}

class _VerifySMSWidgetState extends State<VerifySMSWidget>
    with TickerProviderStateMixin {
  late VerifySMSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.9, 0.9),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.9, 0.9),
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.9, 0.9),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifySMSModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'verifySMS'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFY_S_M_S_verifySMS_ON_INIT_STATE');
      logFirebaseEvent('verifySMS_timer');
      _model.timerController.onStartTimer();
    });

    authManager.handlePhoneAuthStateChanges(context);
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['iconButtonOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 180.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/dernmavilogo1.png',
                      width: 300.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.00, 1.00),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 400.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Gelen şifreyi girin',
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25.0,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation']!),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Desteğe mi ihtiyacınız var?',
                                                    style: GoogleFonts.getFont(
                                                      'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'VERIFY_S_M_S_PAGE_Text_ufl51dd1_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Text_send_email');
                                                      await launchUrl(Uri(
                                                          scheme: 'mailto',
                                                          path:
                                                              'derinmavi@sezginvardar.com',
                                                          query: {
                                                            'subject':
                                                                'Problem Bildirimi',
                                                            'body':
                                                                'Lütfen yaşadığınız problemi açıklayınız:',
                                                          }
                                                              .entries
                                                              .map((MapEntry<
                                                                          String,
                                                                          String>
                                                                      e) =>
                                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                              .join('&')));
                                                    },
                                                    child: Text(
                                                      'Bize ulaşın',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ).animateOnPageLoad(animationsMap[
                                                  'rowOnPageLoadAnimation1']!),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  20.0),
                                                      child: PinCodeTextField(
                                                        autoDisposeControllers:
                                                            false,
                                                        appContext: context,
                                                        length: 6,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        enableActiveFill: true,
                                                        autoFocus: true,
                                                        enablePinAutofill: true,
                                                        errorTextSpace: 16.0,
                                                        showCursor: true,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        obscureText: false,
                                                        hintCharacter: '-',
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        pinTheme: PinTheme(
                                                          fieldHeight: 44.0,
                                                          fieldWidth: 44.0,
                                                          borderWidth: 2.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          shape:
                                                              PinCodeFieldShape
                                                                  .box,
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          selectedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeFillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          inactiveFillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          selectedFillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                        controller: _model
                                                            .pinCodeController,
                                                        onChanged: (_) {},
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        validator: _model
                                                            .pinCodeControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    if (_model
                                                            .timerMilliseconds !=
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    38.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FlutterFlowTimer(
                                                              initialTime: _model
                                                                  .timerMilliseconds,
                                                              getDisplayTime: (value) =>
                                                                  StopWatchTimer
                                                                      .getDisplayTime(
                                                                value,
                                                                hours: false,
                                                                minute: false,
                                                                milliSecond:
                                                                    false,
                                                              ),
                                                              controller: _model
                                                                  .timerController,
                                                              updateStateInterval:
                                                                  Duration(
                                                                      milliseconds:
                                                                          1000),
                                                              onChanged: (value,
                                                                  displayTime,
                                                                  shouldUpdate) {
                                                                _model.timerMilliseconds =
                                                                    value;
                                                                _model.timerValue =
                                                                    displayTime;
                                                                if (shouldUpdate)
                                                                  setState(
                                                                      () {});
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'sonra yeniden gönderebilirsiniz.',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 5.0)),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation2']!),
                                                      ),
                                                    if (_model
                                                            .timerMilliseconds ==
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    38.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Kodu almadınız mı?',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'VERIFY_S_M_S_PAGE_Text_ubtd03tb_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Text_auth');
                                                                  final phoneNumberVal =
                                                                      FFAppState()
                                                                          .phoneNumber;
                                                                  if (phoneNumberVal ==
                                                                          null ||
                                                                      phoneNumberVal
                                                                          .isEmpty ||
                                                                      !phoneNumberVal
                                                                          .startsWith(
                                                                              '+')) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text('Telefon numarası + şeklinde alan kodu ile başlamalıdır'),
                                                                      ),
                                                                    );
                                                                    return;
                                                                  }
                                                                  await authManager
                                                                      .beginPhoneAuth(
                                                                    context:
                                                                        context,
                                                                    phoneNumber:
                                                                        phoneNumberVal,
                                                                    onCodeSent:
                                                                        (context) async {
                                                                      context
                                                                          .goNamedAuth(
                                                                        'verifySMS',
                                                                        context
                                                                            .mounted,
                                                                        ignoreRedirect:
                                                                            true,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Tekrar gönder',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'rowOnPageLoadAnimation3']!),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation']!),
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 20.0))
                                          .addToEnd(SizedBox(height: 70.0)),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 40.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VERIFY_S_M_S_PAGE_DOĞRULA_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_validate_form');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              logFirebaseEvent('Button_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final smsCodeVal = _model
                                                  .pinCodeController!.text;
                                              if (smsCodeVal == null ||
                                                  smsCodeVal.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Gelen doğrulama kodunu girin'),
                                                  ),
                                                );
                                                return;
                                              }
                                              final phoneVerifiedUser =
                                                  await authManager
                                                      .verifySmsCode(
                                                context: context,
                                                smsCode: smsCodeVal,
                                              );
                                              if (phoneVerifiedUser == null) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamedAuth(
                                                  'anasayfa', context.mounted);
                                            },
                                            text: 'Doğrula',
                                            options: FFButtonOptions(
                                              width: 220.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle: GoogleFonts.getFont(
                                                'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19.0,
                                              ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'buttonOnActionTriggerAnimation']!,
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ).animateOnPageLoad(animationsMap[
                                          'rowOnPageLoadAnimation4']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondary,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('VERIFY_S_M_S_arrow_back_rounded_ICN_ON_T');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              )
                  .animateOnPageLoad(
                      animationsMap['iconButtonOnPageLoadAnimation']!)
                  .animateOnActionTrigger(
                    animationsMap['iconButtonOnActionTriggerAnimation']!,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
