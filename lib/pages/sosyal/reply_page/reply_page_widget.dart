import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sosyal/ek_yanitlar/ek_yanitlar_widget.dart';
import '/pages/sosyal/reply_to_reply/reply_to_reply_widget.dart';
import '/pages/sosyal/yanit/yanit_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reply_page_model.dart';
export 'reply_page_model.dart';

class ReplyPageWidget extends StatefulWidget {
  const ReplyPageWidget({
    Key? key,
    this.threadId,
    required this.replyId,
  }) : super(key: key);

  final DocumentReference? threadId;
  final DocumentReference? replyId;

  @override
  _ReplyPageWidgetState createState() => _ReplyPageWidgetState();
}

class _ReplyPageWidgetState extends State<ReplyPageWidget> {
  late ReplyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'replyPage'});
    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TestForumRecord>(
      stream: TestForumRecord.getDocument(widget.threadId!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
              ),
            ),
          );
        }
        final replyPageTestForumRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: StreamBuilder<TestForumRepliesRecord>(
              stream: TestForumRepliesRecord.getDocument(widget.replyId!),
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
                final containerTestForumRepliesRecord = snapshot.data!;
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        containerTestForumRepliesRecord.replyUser!),
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
                      final columnUsersRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              controller: _model.all,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 60.0, 20.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -1.00, -1.00),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'REPLY_Container_rtaajqda_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_navigate_back');
                                              context.safePop();
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.chevron_left_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: SingleChildScrollView(
                                      controller: _model.content,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model.yanitModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: YanitWidget(
                                              replyId:
                                                  containerTestForumRepliesRecord
                                                      .reference,
                                              threadId: replyPageTestForumRecord
                                                  .reference,
                                              isIconActive: false,
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final ekyanitlar =
                                                  containerTestForumRepliesRecord
                                                      .replyReplies
                                                      .map((e) => e)
                                                      .toList();
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        ekyanitlar.length,
                                                        (ekyanitlarIndex) {
                                                  final ekyanitlarItem =
                                                      ekyanitlar[
                                                          ekyanitlarIndex];
                                                  return StreamBuilder<
                                                      TestForumRepliesRecord>(
                                                    stream:
                                                        TestForumRepliesRecord
                                                            .getDocument(
                                                                ekyanitlarItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            child:
                                                                SpinKitThreeBounce(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final ekYanitlarTestForumRepliesRecord =
                                                          snapshot.data!;
                                                      return EkYanitlarWidget(
                                                        key: Key(
                                                            'Keyaza_${ekyanitlarIndex}_of_${ekyanitlar.length}'),
                                                        replyId:
                                                            ekYanitlarTestForumRepliesRecord
                                                                .reference,
                                                      );
                                                    },
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(height: 10.0))
                                                    .around(
                                                        SizedBox(height: 10.0)),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 90.0)),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x44CCCCCC),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/diver_(1).png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                if (currentUserPhoto != null &&
                                                    currentUserPhoto != '')
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            currentUserPhoto,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(milliseconds: 500),
                                                    () async {
                                                      logFirebaseEvent(
                                                          'REPLY_TextField_hm5z8sz4_ON_TEXTFIELD_CH');
                                                      if (_model.textController
                                                                  .text !=
                                                              null &&
                                                          _model.textController
                                                                  .text !=
                                                              '') {
                                                        logFirebaseEvent(
                                                            'TextField_update_page_state');
                                                        setState(() {
                                                          _model.enrtyText =
                                                              true;
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'TextField_update_page_state');
                                                        setState(() {
                                                          _model.enrtyText =
                                                              false;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                  textInputAction:
                                                      TextInputAction.send,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintText:
                                                        '${columnUsersRecord.displayName}\'e yanıt ver',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              fontSize: 12.0,
                                                            ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 15.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  maxLines: null,
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'REPLY_PAGE_PAGE_Icon_vqit7z0l_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_bottom_sheet');
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          child:
                                                              ReplyToReplyWidget(
                                                            threadId:
                                                                widget.threadId,
                                                            replyId:
                                                                widget.replyId,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Icon(
                                                Icons.perm_media,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 18.0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30.0,
                                              child: VerticalDivider(
                                                thickness: 0.2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'REPLY_PAGE_PAGE_Icon_mmi4ffn8_ON_TAP');
                                                if (_model.enrtyText != false) {
                                                  logFirebaseEvent(
                                                      'Icon_backend_call');

                                                  var testForumRepliesRecordReference =
                                                      TestForumRepliesRecord
                                                          .collection
                                                          .doc();
                                                  await testForumRepliesRecordReference
                                                      .set({
                                                    ...createTestForumRepliesRecordData(
                                                      replyContent: _model
                                                          .textController.text,
                                                      replyUser:
                                                          currentUserReference,
                                                      replyTo:
                                                          containerTestForumRepliesRecord
                                                              .replyUser,
                                                      parentReply:
                                                          containerTestForumRepliesRecord
                                                              .reference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'time_replied': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.output =
                                                      TestForumRepliesRecord
                                                          .getDocumentFromData({
                                                    ...createTestForumRepliesRecordData(
                                                      replyContent: _model
                                                          .textController.text,
                                                      replyUser:
                                                          currentUserReference,
                                                      replyTo:
                                                          containerTestForumRepliesRecord
                                                              .replyUser,
                                                      parentReply:
                                                          containerTestForumRepliesRecord
                                                              .reference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'time_replied':
                                                            DateTime.now(),
                                                      },
                                                    ),
                                                  }, testForumRepliesRecordReference);
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  setState(() {
                                                    _model.enrtyText = false;
                                                  });
                                                  logFirebaseEvent(
                                                      'Icon_backend_call');

                                                  await containerTestForumRepliesRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'replied_by': FieldValue
                                                            .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                        'reply_replies':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .output?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'Icon_backend_call');

                                                  await NotificationsRecord
                                                      .collection
                                                      .doc()
                                                      .set({
                                                    ...createNotificationsRecordData(
                                                      notText: _model
                                                          .textController.text,
                                                      notHeader:
                                                          '${currentUserDisplayName} bir yorumuna yanıt verdi.',
                                                      actionLink:
                                                          'derinmavi://derinmavi.app${GoRouter.of(context).location}',
                                                      isReaded: false,
                                                      gonderen:
                                                          currentUserReference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'timestamp': FieldValue
                                                            .serverTimestamp(),
                                                        'alicilar':
                                                            containerTestForumRepliesRecord
                                                                .repliedBy,
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'Icon_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        '${currentUserDisplayName} ilgilendiğin bir gönderiye yanıt verdi.',
                                                    notificationText:
                                                        '\"${_model.textController.text}\"',
                                                    notificationSound:
                                                        'default',
                                                    userRefs:
                                                        containerTestForumRepliesRecord
                                                            .repliedBy
                                                            .toList(),
                                                    initialPageName:
                                                        'replyPage',
                                                    parameterData: {
                                                      'threadId':
                                                          replyPageTestForumRecord
                                                              .reference,
                                                      'replyId':
                                                          containerTestForumRepliesRecord
                                                              .reference,
                                                    },
                                                  );
                                                  logFirebaseEvent(
                                                      'Icon_trigger_push_notification');
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        '${currentUserDisplayName} bir yorumuna yanıt verdi.',
                                                    notificationText:
                                                        '\"${_model.textController.text}\"',
                                                    notificationSound:
                                                        'default',
                                                    userRefs: [
                                                      containerTestForumRepliesRecord
                                                          .replyUser!
                                                    ],
                                                    initialPageName:
                                                        'replyPage',
                                                    parameterData: {
                                                      'threadId':
                                                          replyPageTestForumRecord
                                                              .reference,
                                                      'replyId':
                                                          containerTestForumRepliesRecord
                                                              .reference,
                                                    },
                                                  );
                                                  logFirebaseEvent(
                                                      'Icon_clear_text_fields_pin_codes');
                                                  setState(() {
                                                    _model.textController
                                                        ?.clear();
                                                  });
                                                  logFirebaseEvent(
                                                      'Icon_scroll_to');
                                                  await _model.content
                                                      ?.animateTo(
                                                    _model.content!.position
                                                        .maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  setState(() {
                                                    _model.enrtyText = false;
                                                  });
                                                }

                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.send,
                                                color: _model.enrtyText == true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .accent3,
                                                size: 24.0,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
                            child: wrapWithModel(
                              model: _model.navBarModel,
                              updateCallback: () => setState(() {}),
                              child: NavBarWidget(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
