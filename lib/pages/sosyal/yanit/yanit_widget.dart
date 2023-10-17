import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/begeniler/begeniler_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'yanit_model.dart';
export 'yanit_model.dart';

class YanitWidget extends StatefulWidget {
  const YanitWidget({
    Key? key,
    required this.replyId,
    required this.threadId,
    bool? isIconActive,
  })  : this.isIconActive = isIconActive ?? false,
        super(key: key);

  final DocumentReference? replyId;
  final DocumentReference? threadId;
  final bool isIconActive;

  @override
  _YanitWidgetState createState() => _YanitWidgetState();
}

class _YanitWidgetState extends State<YanitWidget> {
  late YanitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YanitModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

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
        final containerTestForumRecord = snapshot.data!;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
            child: StreamBuilder<TestForumRepliesRecord>(
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
                final listItemContainerTestForumRepliesRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          listItemContainerTestForumRepliesRecord.replyUser!),
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
                        final contentabovedividerUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.isIconActive == true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.subdirectory_arrow_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, -1.00),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'YANIT_COMP_Stack_vs17ezw2_ON_TAP');
                                      if (listItemContainerTestForumRepliesRecord
                                              .replyUser ==
                                          currentUserReference) {
                                        logFirebaseEvent('Stack_navigate_to');

                                        context.pushNamed('myProfilePage');
                                      } else {
                                        logFirebaseEvent('Stack_navigate_to');

                                        context.pushNamed(
                                          'profileOther',
                                          queryParameters: {
                                            'userId': serializeParam(
                                              listItemContainerTestForumRepliesRecord
                                                  .replyUser,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/diver_(1).png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        if (currentUserPhoto != null &&
                                            currentUserPhoto != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      contentabovedividerUsersRecord
                                                          .photoUrl,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 6.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'YANIT_COMP_Text_cuo341nf_ON_TAP');
                                              if (listItemContainerTestForumRepliesRecord
                                                      .replyUser ==
                                                  currentUserReference) {
                                                logFirebaseEvent(
                                                    'Text_navigate_to');

                                                context
                                                    .pushNamed('myProfilePage');
                                              } else {
                                                logFirebaseEvent(
                                                    'Text_navigate_to');

                                                context.pushNamed(
                                                  'profileOther',
                                                  queryParameters: {
                                                    'userId': serializeParam(
                                                      listItemContainerTestForumRepliesRecord
                                                          .replyUser,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Text(
                                              contentabovedividerUsersRecord
                                                  .displayName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (listItemContainerTestForumRepliesRecord
                                                    .replyContent !=
                                                null &&
                                            listItemContainerTestForumRepliesRecord
                                                    .replyContent !=
                                                '')
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 2.0),
                                              child: Text(
                                                listItemContainerTestForumRepliesRecord
                                                    .replyContent,
                                                textAlign: TextAlign.start,
                                                maxLines: 6,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (listItemContainerTestForumRepliesRecord
                                                .replyPhoto !=
                                            null &&
                                        listItemContainerTestForumRepliesRecord
                                                .replyPhoto !=
                                            '')
                                      Container(
                                        width: 200.0,
                                        height: 200.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 280.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'YANIT_COMP_Image_z7fusmo9_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_expand_image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        listItemContainerTestForumRepliesRecord
                                                            .replyPhoto,
                                                    fit: BoxFit.contain,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  allowRotation: true,
                                                  tag:
                                                      listItemContainerTestForumRepliesRecord
                                                          .replyPhoto,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag:
                                                listItemContainerTestForumRepliesRecord
                                                    .replyPhoto,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    listItemContainerTestForumRepliesRecord
                                                        .replyPhoto,
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.jpg',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        );
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ToggleIcon(
                                  onPressed: () async {
                                    final likedByElement = currentUserReference;
                                    final likedByUpdate =
                                        listItemContainerTestForumRepliesRecord
                                                .likedBy
                                                .contains(likedByElement)
                                            ? FieldValue.arrayRemove(
                                                [likedByElement])
                                            : FieldValue.arrayUnion(
                                                [likedByElement]);
                                    await listItemContainerTestForumRepliesRecord
                                        .reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'liked_by': likedByUpdate,
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'YANIT_COMP_ToggleIcon_a1fcmrzu_ON_TOGGLE');
                                    if (listItemContainerTestForumRepliesRecord
                                        .likedBy
                                        .contains(currentUserReference)) {
                                      logFirebaseEvent(
                                          'ToggleIcon_backend_call');

                                      await listItemContainerTestForumRepliesRecord
                                          .reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'liked_by': FieldValue.arrayRemove(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'ToggleIcon_backend_call');

                                      await listItemContainerTestForumRepliesRecord
                                          .reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'liked_by': FieldValue.arrayUnion(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'ToggleIcon_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            '${currentUserDisplayName} bir yorumunu beğendi.',
                                        notificationText:
                                            listItemContainerTestForumRepliesRecord
                                                .replyContent,
                                        notificationImageUrl:
                                            listItemContainerTestForumRepliesRecord
                                                .replyPhoto,
                                        notificationSound: 'default',
                                        userRefs: [
                                          listItemContainerTestForumRepliesRecord
                                              .replyUser!
                                        ],
                                        initialPageName: 'replyPage',
                                        parameterData: {
                                          'threadId': containerTestForumRecord
                                              .reference,
                                          'replyId':
                                              listItemContainerTestForumRepliesRecord
                                                  .reference,
                                        },
                                      );
                                      logFirebaseEvent(
                                          'ToggleIcon_backend_call');

                                      await NotificationsRecord.collection
                                          .doc()
                                          .set({
                                        ...createNotificationsRecordData(
                                          notText:
                                              listItemContainerTestForumRepliesRecord
                                                  .replyContent,
                                          notHeader:
                                              '${currentUserDisplayName} bir yorumunu beğendi.',
                                          actionLink:
                                              'derinmavi://derinmavi.app${GoRouter.of(context).location}',
                                          isReaded: false,
                                          alici:
                                              listItemContainerTestForumRepliesRecord
                                                  .replyUser,
                                          gonderen: currentUserReference,
                                          photo:
                                              listItemContainerTestForumRepliesRecord
                                                  .replyPhoto,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'timestamp':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                    }
                                  },
                                  value: listItemContainerTestForumRepliesRecord
                                      .likedBy
                                      .contains(currentUserReference),
                                  onIcon: Icon(
                                    Icons.favorite_sharp,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 18.0,
                                  ),
                                  offIcon: Icon(
                                    Icons.favorite_border_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'YANIT_COMP_Text_v8we65vm_ON_TAP');
                                    if (containerTestForumRecord
                                            .likedBy.length >
                                        0) {
                                      logFirebaseEvent('Text_bottom_sheet');
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: BegenilerWidget(
                                                replyId:
                                                    listItemContainerTestForumRepliesRecord
                                                        .reference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                  child: Text(
                                    listItemContainerTestForumRepliesRecord
                                        .likedBy.length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 5.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                Text(
                                  listItemContainerTestForumRepliesRecord
                                      .replyReplies.length
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat(
                                'relative',
                                containerTestForumRecord.timePosted!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            if ((currentUserReference ==
                                    listItemContainerTestForumRepliesRecord
                                        .replyUser) ||
                                (valueOrDefault(
                                        currentUserDocument?.userPermissions,
                                        '') ==
                                    'Admin'))
                              AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'YANIT_COMP_SideButton_ON_TAP');
                                    logFirebaseEvent('SideButton_alert_dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'İlgili yanıt silinecek, emin misiniz?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Vazgeç'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Evet'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      logFirebaseEvent(
                                          'SideButton_backend_call');

                                      await containerTestForumRecord.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'replies': FieldValue.arrayRemove([
                                              listItemContainerTestForumRepliesRecord
                                                  .reference
                                            ]),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'SideButton_navigate_to');

                                      context.goNamed(
                                        'threadPage',
                                        queryParameters: {
                                          'threadId': serializeParam(
                                            containerTestForumRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      logFirebaseEvent(
                                          'SideButton_backend_call');
                                      await listItemContainerTestForumRepliesRecord
                                          .reference
                                          .delete();
                                    }
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
