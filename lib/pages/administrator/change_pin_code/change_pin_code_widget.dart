import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_pin_code_model.dart';
export 'change_pin_code_model.dart';

class ChangePinCodeWidget extends StatefulWidget {
  const ChangePinCodeWidget({Key? key}) : super(key: key);

  @override
  _ChangePinCodeWidgetState createState() => _ChangePinCodeWidgetState();
}

class _ChangePinCodeWidgetState extends State<ChangePinCodeWidget> {
  late ChangePinCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePinCodeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'changePinCode'});
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
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<DatasRecord>>(
                        stream: queryDatasRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                              ),
                            );
                          }
                          List<DatasRecord> pageViewDatasRecordList =
                              snapshot.data!;
                          final pageViewDatasRecord =
                              pageViewDatasRecordList.isNotEmpty
                                  ? pageViewDatasRecordList.first
                                  : null;
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: PageView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Form(
                                        key: _model.formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Eski şifreyi girin',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 24.0),
                                                  child: Text(
                                                    '4 haneli pin girin.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                                PinCodeTextField(
                                                  autoDisposeControllers: false,
                                                  appContext: context,
                                                  length: 4,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  enableActiveFill: true,
                                                  autoFocus: false,
                                                  enablePinAutofill: false,
                                                  errorTextSpace: 16.0,
                                                  showCursor: true,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  obscureText: true,
                                                  obscuringCharacter: '*',
                                                  hintCharacter: '●',
                                                  pinTheme: PinTheme(
                                                    fieldHeight: 44.0,
                                                    fieldWidth: 44.0,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape:
                                                        PinCodeFieldShape.box,
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
                                                  controller:
                                                      _model.pinCodeController1,
                                                  onChanged: (_) {},
                                                  onCompleted: (_) async {
                                                    logFirebaseEvent(
                                                        'CHANGE_PIN_CODE_PinCode_b1hc5ewo_ON_PINC');
                                                    logFirebaseEvent(
                                                        'PinCode_validate_form');
                                                    if (_model.formKey1
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey1
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .pinCodeController1!
                                                            .text ==
                                                        pageViewDatasRecord
                                                            ?.pinCode
                                                            .toString()) {
                                                      logFirebaseEvent(
                                                          'PinCode_page_view');
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'PinCode_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Hatalı şifre girdiniz.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: _model
                                                      .pinCodeController1Validator
                                                      .asValidator(context),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'CHANGE_PIN_CODE_PAGE_DOĞRULA_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_validate_form');
                                                      if (_model.formKey1
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey1
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .pinCodeController1!
                                                              .text ==
                                                          pageViewDatasRecord
                                                              ?.pinCode
                                                              .toString()) {
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Hatalı şifre girdiniz.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    text: 'Doğrula',
                                                    options: FFButtonOptions(
                                                      width: 370.0,
                                                      height: 44.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Yeni şifre girin',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 24.0),
                                                  child: Text(
                                                    '4 haneli pin girin.',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                                PinCodeTextField(
                                                  autoDisposeControllers: false,
                                                  appContext: context,
                                                  length: 4,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  enableActiveFill: true,
                                                  autoFocus: false,
                                                  enablePinAutofill: false,
                                                  errorTextSpace: 16.0,
                                                  showCursor: true,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  obscureText: true,
                                                  obscuringCharacter: '*',
                                                  hintCharacter: '●',
                                                  pinTheme: PinTheme(
                                                    fieldHeight: 44.0,
                                                    fieldWidth: 44.0,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape:
                                                        PinCodeFieldShape.box,
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
                                                  controller:
                                                      _model.pinCodeController2,
                                                  onChanged: (_) {},
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: _model
                                                      .pinCodeController2Validator
                                                      .asValidator(context),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'CHANGE_PIN_CODE_PAGE_DEĞIŞTIR_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_validate_form');
                                                      if (_model.formKey2
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey2
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await pageViewDatasRecord!
                                                          .reference
                                                          .update(
                                                              createDatasRecordData(
                                                        pinCode: int.tryParse(_model
                                                            .pinCodeController2!
                                                            .text),
                                                      ));
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.goNamed(
                                                          'adminPanel');

                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Şifre değiştirildi.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    },
                                                    text: 'Değiştir',
                                                    options: FFButtonOptions(
                                                      width: 370.0,
                                                      height: 44.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 16.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 2,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 3.0,
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 16.0,
                                        dotHeight: 8.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .accent3,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
