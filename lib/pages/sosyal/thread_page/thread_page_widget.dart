import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sosyal/gonderi/gonderi_widget.dart';
import '/pages/sosyal/reply_to_thread/reply_to_thread_widget.dart';
import '/pages/sosyal/yanit/yanit_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thread_page_model.dart';
export 'thread_page_model.dart';

class ThreadPageWidget extends StatefulWidget {
  const ThreadPageWidget({
    Key? key,
    required this.threadId,
  }) : super(key: key);

  final DocumentReference? threadId;

  @override
  _ThreadPageWidgetState createState() => _ThreadPageWidgetState();
}

class _ThreadPageWidgetState extends State<ThreadPageWidget> {
  late ThreadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'threadPage'});
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
        final threadPageTestForumRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(
                  threadPageTestForumRecord.threadUser!),
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
                final containerUsersRecord = snapshot.data!;
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _model.all,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      alignment:
                                          AlignmentDirectional(-1.00, -1.00),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'THREAD_Container_knmv1ugy_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_navigate_back');
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.chevron_left_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                controller: _model.content,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.gonderiModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: GonderiWidget(
                                        thread:
                                            threadPageTestForumRecord.reference,
                                        navigate: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final replies =
                                              threadPageTestForumRecord.replies
                                                  .map((e) => e)
                                                  .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List
                                                    .generate(replies.length,
                                                        (repliesIndex) {
                                              final repliesItem =
                                                  replies[repliesIndex];
                                              return StreamBuilder<
                                                  TestForumRepliesRecord>(
                                                stream: TestForumRepliesRecord
                                                    .getDocument(repliesItem),
                                                builder: (context, snapshot) {
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
                                                  final yanitTestForumRepliesRecord =
                                                      snapshot.data!;
                                                  return InkWell(
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
                                                          'THREAD_Container_qixfyq0r_ON_TAP');
                                                      logFirebaseEvent(
                                                          'yanit_navigate_to');

                                                      context.pushNamed(
                                                        'replyPage',
                                                        queryParameters: {
                                                          'threadId':
                                                              serializeParam(
                                                            threadPageTestForumRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'replyId':
                                                              serializeParam(
                                                            yanitTestForumRepliesRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: YanitWidget(
                                                      key: Key(
                                                          'Keyqix_${repliesIndex}_of_${replies.length}'),
                                                      replyId:
                                                          yanitTestForumRepliesRecord
                                                              .reference,
                                                      threadId:
                                                          threadPageTestForumRecord
                                                              .reference,
                                                      isIconActive: true,
                                                    ),
                                                  );
                                                },
                                              );
                                            })
                                                .divide(SizedBox(height: 10.0))
                                                .around(SizedBox(height: 10.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
                                    borderRadius: BorderRadius.circular(30.0),
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
                                                builder: (context) => Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl: currentUserPhoto,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  logFirebaseEvent(
                                                      'THREAD_TextField_ocoiokxu_ON_TEXTFIELD_C');
                                                  if (_model.textController
                                                              .text !=
                                                          null &&
                                                      _model.textController
                                                              .text !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'TextField_update_page_state');
                                                    setState(() {
                                                      _model.enrtyText = true;
                                                    });
                                                  } else {
                                                    logFirebaseEvent(
                                                        'TextField_update_page_state');
                                                    setState(() {
                                                      _model.enrtyText = false;
                                                    });
                                                  }
                                                },
                                              ),
                                              textInputAction:
                                                  TextInputAction.send,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintText:
                                                    '${containerUsersRecord.displayName}\'e yanıt ver',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      fontSize: 12.0,
                                                    ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0, 0.0,
                                                            15.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'THREAD_PAGE_PAGE_Icon_sypp7hqe_ON_TAP');
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
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child:
                                                          ReplyToThreadWidget(
                                                        threadId:
                                                            threadPageTestForumRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            Icons.perm_media,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                          child: VerticalDivider(
                                            thickness: 0.2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'THREAD_PAGE_PAGE_Icon_8p8yhpwv_ON_TAP');
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
                                                  replyThread:
                                                      threadPageTestForumRecord
                                                          .reference,
                                                  replyUser:
                                                      currentUserReference,
                                                  replyTo:
                                                      threadPageTestForumRecord
                                                          .threadUser,
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
                                                  replyThread:
                                                      threadPageTestForumRecord
                                                          .reference,
                                                  replyUser:
                                                      currentUserReference,
                                                  replyTo:
                                                      threadPageTestForumRecord
                                                          .threadUser,
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

                                              await threadPageTestForumRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'replied_by':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                    'replies':
                                                        FieldValue.arrayUnion([
                                                      _model.output?.reference
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
                                                      '${currentUserDisplayName} ilgilendiğin bir gönderiye yanıt verdi.',
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
                                                        threadPageTestForumRecord
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
                                                notificationSound: 'default',
                                                userRefs:
                                                    threadPageTestForumRecord
                                                        .repliedBy
                                                        .toList(),
                                                initialPageName: 'threadPage',
                                                parameterData: {
                                                  'threadId':
                                                      threadPageTestForumRecord
                                                          .reference,
                                                },
                                              );
                                              logFirebaseEvent(
                                                  'Icon_trigger_push_notification');
                                              triggerPushNotification(
                                                notificationTitle:
                                                    '${currentUserDisplayName} bir gönderine yanıt verdi.',
                                                notificationText:
                                                    '\"${_model.textController.text}\"',
                                                notificationSound: 'default',
                                                userRefs: [
                                                  threadPageTestForumRecord
                                                      .threadUser!
                                                ],
                                                initialPageName: 'threadPage',
                                                parameterData: {
                                                  'threadId':
                                                      threadPageTestForumRecord
                                                          .reference,
                                                },
                                              );
                                              logFirebaseEvent(
                                                  'Icon_clear_text_fields_pin_codes');
                                              setState(() {
                                                _model.textController?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Icon_scroll_to');
                                              await _model.content?.animateTo(
                                                _model.content!.position
                                                    .maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 100),
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
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
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
