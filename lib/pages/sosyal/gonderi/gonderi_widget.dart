import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/begeniler/begeniler_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/sosyal/etiketli_kullanicilar/etiketli_kullanicilar_widget.dart';
import '/pages/sosyal/thread_added_location/thread_added_location_widget.dart';
import '/pages/sosyal/thread_options/thread_options_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'gonderi_model.dart';
export 'gonderi_model.dart';

class GonderiWidget extends StatefulWidget {
  const GonderiWidget({
    Key? key,
    required this.thread,
    bool? navigate,
  })  : this.navigate = navigate ?? false,
        super(key: key);

  final DocumentReference? thread;
  final bool navigate;

  @override
  _GonderiWidgetState createState() => _GonderiWidgetState();
}

class _GonderiWidgetState extends State<GonderiWidget> {
  late GonderiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GonderiModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: StreamBuilder<TestForumRecord>(
        stream: TestForumRecord.getDocument(widget.thread!),
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(
                      containerTestForumRecord.threadUser!),
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
                    final listItemContainerUsersRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'GONDERI_COMP_Stack_6sbc543z_ON_TAP');
                                      if (containerTestForumRecord.threadUser ==
                                          currentUserReference) {
                                        logFirebaseEvent('Stack_navigate_to');

                                        context.pushNamed(
                                          'myProfilePage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent('Stack_navigate_to');

                                        context.pushNamed(
                                          'profileOther',
                                          queryParameters: {
                                            'userId': serializeParam(
                                              containerTestForumRecord
                                                  .threadUser,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        if (listItemContainerUsersRecord
                                                    .photoUrl ==
                                                null ||
                                            listItemContainerUsersRecord
                                                    .photoUrl ==
                                                '')
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/diver_(1).png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (listItemContainerUsersRecord
                                                    .photoUrl !=
                                                null &&
                                            listItemContainerUsersRecord
                                                    .photoUrl !=
                                                '')
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl:
                                                  listItemContainerUsersRecord
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
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
                                                            'GONDERI_COMP_Text_c4bf9ylx_ON_TAP');
                                                        if (containerTestForumRecord
                                                                .threadUser ==
                                                            currentUserReference) {
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                              'myProfilePage');
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'profileOther',
                                                            queryParameters: {
                                                              'userId':
                                                                  serializeParam(
                                                                containerTestForumRecord
                                                                    .threadUser,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child: Text(
                                                        listItemContainerUsersRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    if (containerTestForumRecord
                                                            .taggedUsers
                                                            .length >
                                                        0)
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
                                                              'GONDERI_COMP_Text_gk982td4_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_bottom_sheet');
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.5,
                                                                  child:
                                                                      EtiketliKullanicilarWidget(
                                                                    threadId:
                                                                        containerTestForumRecord
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Text(
                                                          ' +${valueOrDefault<String>(
                                                            containerTestForumRecord
                                                                .taggedUsers
                                                                .length
                                                                .toString(),
                                                            '0',
                                                          )} ile birlikte',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (containerTestForumRecord
                                                            .locationName !=
                                                        null &&
                                                    containerTestForumRecord
                                                            .locationName !=
                                                        '')
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
                                                          'GONDERI_COMP_Row_1hr12o7j_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_bottom_sheet');
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.5,
                                                              child:
                                                                  ThreadAddedLocationWidget(
                                                                threadId:
                                                                    containerTestForumRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          FFIcons.kdiveflag,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 14.0,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            containerTestForumRecord
                                                                .locationName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (containerTestForumRecord
                                                                .threadContent !=
                                                            null &&
                                                        containerTestForumRecord
                                                                .threadContent !=
                                                            '')
                                                      Expanded(
                                                        child: Text(
                                                          containerTestForumRecord
                                                              .threadContent,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (containerTestForumRecord
                                                            .threadPhoto !=
                                                        null &&
                                                    containerTestForumRecord
                                                            .threadPhoto !=
                                                        '')
                                                  Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 280.0,
                                                      maxHeight: 200.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: InkWell(
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
                                                            'GONDERI_COMP_Image_tkxhs345_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Image_expand_image');
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    containerTestForumRecord
                                                                        .threadPhoto,
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.jpg',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: containerTestForumRecord
                                                                  .threadPhoto,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag:
                                                            containerTestForumRecord
                                                                .threadPhoto,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                containerTestForumRecord
                                                                    .threadPhoto,
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
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
                                              ]
                                                  .divide(SizedBox(height: 5.0))
                                                  .addToStart(
                                                      SizedBox(height: 10.0))
                                                  .addToEnd(
                                                      SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final likedByElement =
                                                        currentUserReference;
                                                    final likedByUpdate =
                                                        containerTestForumRecord
                                                                .likedBy
                                                                .contains(
                                                                    likedByElement)
                                                            ? FieldValue
                                                                .arrayRemove([
                                                                likedByElement
                                                              ])
                                                            : FieldValue
                                                                .arrayUnion([
                                                                likedByElement
                                                              ]);
                                                    await containerTestForumRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'liked_by':
                                                              likedByUpdate,
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'GONDERI_ToggleIcon_0t9hgqty_ON_TOGGLE');
                                                    if (containerTestForumRecord
                                                        .likedBy
                                                        .contains(
                                                            currentUserReference)) {
                                                      logFirebaseEvent(
                                                          'ToggleIcon_backend_call');

                                                      await containerTestForumRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'liked_by': FieldValue
                                                                .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      logFirebaseEvent(
                                                          'ToggleIcon_backend_call');

                                                      await containerTestForumRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'liked_by':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'ToggleIcon_trigger_push_notification');
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            '${listItemContainerUsersRecord.displayName} bir gönderini beğendi.',
                                                        notificationText:
                                                            containerTestForumRecord
                                                                .threadContent,
                                                        notificationImageUrl:
                                                            containerTestForumRecord
                                                                .threadPhoto,
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          containerTestForumRecord
                                                              .threadUser!
                                                        ],
                                                        initialPageName:
                                                            'threadPage',
                                                        parameterData: {
                                                          'threadId':
                                                              containerTestForumRecord
                                                                  .reference,
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'ToggleIcon_backend_call');

                                                      await NotificationsRecord
                                                          .collection
                                                          .doc()
                                                          .set({
                                                        ...createNotificationsRecordData(
                                                          notText:
                                                              containerTestForumRecord
                                                                  .threadContent,
                                                          notHeader:
                                                              '${listItemContainerUsersRecord.displayName} bir gönderini beğendi.',
                                                          photo:
                                                              containerTestForumRecord
                                                                  .threadPhoto,
                                                          actionLink:
                                                              'derinmavi://derinmavi.app${GoRouter.of(context).location}',
                                                          isReaded: false,
                                                          alici:
                                                              containerTestForumRecord
                                                                  .threadUser,
                                                          gonderen:
                                                              currentUserReference,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'timestamp': FieldValue
                                                                .serverTimestamp(),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  },
                                                  value: containerTestForumRecord
                                                      .likedBy
                                                      .contains(
                                                          currentUserReference),
                                                  onIcon: Icon(
                                                    Icons.favorite_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 18.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 18.0,
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
                                                        'GONDERI_COMP_Text_dypnva0z_ON_TAP');
                                                    if (containerTestForumRecord
                                                            .likedBy.length >
                                                        0) {
                                                      logFirebaseEvent(
                                                          'Text_bottom_sheet');
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              child:
                                                                  BegenilerWidget(
                                                                threadId:
                                                                    containerTestForumRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                  child: Text(
                                                    containerTestForumRecord
                                                        .likedBy.length
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.mode_comment_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                Text(
                                                  containerTestForumRecord
                                                      .replies.length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                'yMMMd',
                                                containerTestForumRecord
                                                    .timePosted!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                    'GONDERI_COMP_SideButton_ON_TAP');
                                                logFirebaseEvent(
                                                    'SideButton_bottom_sheet');
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.4,
                                                        child:
                                                            ThreadOptionsWidget(
                                                          threadId:
                                                              containerTestForumRecord
                                                                  .reference,
                                                          navigate:
                                                              widget.navigate,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                logFirebaseEvent(
                                                    'SideButton_update_app_state');
                                                FFAppState().update(() {
                                                  FFAppState().taggedUsers =
                                                      containerTestForumRecord
                                                          .taggedUsers
                                                          .toList()
                                                          .cast<
                                                              DocumentReference>();
                                                  FFAppState()
                                                          .placePickerThread =
                                                      containerTestForumRecord
                                                          .locationLatLng;
                                                  FFAppState()
                                                          .placePickerNameThread =
                                                      containerTestForumRecord
                                                          .locationName;
                                                });
                                              },
                                              child: Icon(
                                                Icons.settings_ethernet_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
