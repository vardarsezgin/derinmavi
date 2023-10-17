import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_permission_edit_model.dart';
export 'user_permission_edit_model.dart';

class UserPermissionEditWidget extends StatefulWidget {
  const UserPermissionEditWidget({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final DocumentReference? userId;

  @override
  _UserPermissionEditWidgetState createState() =>
      _UserPermissionEditWidgetState();
}

class _UserPermissionEditWidgetState extends State<UserPermissionEditWidget>
    with TickerProviderStateMixin {
  late UserPermissionEditModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPermissionEditModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.userId!),
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
            final overlayUsersRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'Şu kullanıcı görüntüleniyor: ',
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 0.0, 0.0),
                          child: AutoSizeText(
                            '${overlayUsersRecord.displayName}',
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 0.0, 0.0),
                          child: Text(
                            overlayUsersRecord.reference.id,
                            style: FlutterFlowTheme.of(context).labelSmall,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (currentUserPhoto != null &&
                                currentUserPhoto != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 2.0, 2.0, 2.0),
                                          child: Container(
                                            width: 70.0,
                                            height: 70.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                overlayUsersRecord.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dive-maps-iavvjm/assets/kuikwb78wnql/diver_(1).png',
                                              ),
                                              fit: BoxFit.fitWidth,
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.jpg',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??=
                                      overlayUsersRecord.userPermissions,
                                ),
                                options: [
                                  'Admin',
                                  'Instructor',
                                  'User',
                                  'Moderator',
                                  'Editor'
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: double.infinity,
                                height: 40.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                textStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Seçin...',
                                searchHintText: 'Ara',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderWidth: 1.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 10.0, 0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            'Bu hesap için kullanılan e-posta adresi:',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          )),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            overlayUsersRecord.email,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            'Kayıt:',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall,
                                          )),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                dateTimeFormat(
                                                  'yMMMd',
                                                  overlayUsersRecord
                                                      .createdTime!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              )),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                dateTimeFormat(
                                                  'Hm',
                                                  overlayUsersRecord
                                                      .createdTime!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.05),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'USER_PERMISSION_EDIT_VAZGEÇ_BTN_ON_TAP');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                  text: 'Vazgeç',
                                  options: FFButtonOptions(
                                    height: 44.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.05),
                                child: StreamBuilder<List<AdminsRecord>>(
                                  stream: queryAdminsRecord(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<AdminsRecord> buttonAdminsRecordList =
                                        snapshot.data!;
                                    final buttonAdminsRecord =
                                        buttonAdminsRecordList.isNotEmpty
                                            ? buttonAdminsRecordList.first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_PERMISSION_EDIT_KAYDET_BTN_ON_TAP');
                                        logFirebaseEvent('Button_backend_call');

                                        await overlayUsersRecord.reference
                                            .update(createUsersRecordData(
                                          userPermissions: _model.dropDownValue,
                                        ));
                                        logFirebaseEvent(
                                            'Button_trigger_push_notification');
                                        triggerPushNotification(
                                          notificationTitle:
                                              'Yetki değişikliği yapıldı!',
                                          notificationText:
                                              '${overlayUsersRecord.displayName} kişisinin yetkisi ${currentUserDisplayName} tarafından${_model.dropDownValue} olarak değiştirildi.',
                                          notificationSound: 'default',
                                          userRefs: buttonAdminsRecord!
                                              .yoneticilerRef
                                              .toList(),
                                          initialPageName: 'users',
                                          parameterData: {},
                                        );
                                        if (_model.dropDownValue ==
                                            'Moderator') {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await overlayUsersRecord.reference
                                              .update(createUsersRecordData(
                                            isModerator: true,
                                            isAdmin: false,
                                            isEditor: false,
                                          ));
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await buttonAdminsRecord!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'yoneticilerRef':
                                                    FieldValue.arrayUnion([
                                                  overlayUsersRecord.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          if (_model.dropDownValue == 'Admin') {
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await overlayUsersRecord.reference
                                                .update(createUsersRecordData(
                                              isModerator: false,
                                              isAdmin: true,
                                              isEditor: false,
                                            ));
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await buttonAdminsRecord!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'yoneticilerRef':
                                                      FieldValue.arrayUnion([
                                                    overlayUsersRecord.reference
                                                  ]),
                                                },
                                              ),
                                            });
                                          } else {
                                            if (_model.dropDownValue ==
                                                'Editor') {
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await overlayUsersRecord.reference
                                                  .update(createUsersRecordData(
                                                isModerator: false,
                                                isAdmin: false,
                                                isEditor: true,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await buttonAdminsRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'yoneticilerRef':
                                                        FieldValue.arrayUnion([
                                                      overlayUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              if (_model.dropDownValue ==
                                                  'Instructor') {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await overlayUsersRecord
                                                    .reference
                                                    .update(
                                                        createUsersRecordData(
                                                  isInstructor: true,
                                                ));
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await overlayUsersRecord
                                                    .reference
                                                    .update(
                                                        createUsersRecordData(
                                                  isModerator: false,
                                                  isAdmin: false,
                                                  isInstructor: false,
                                                  isEditor: false,
                                                ));
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await buttonAdminsRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'yoneticilerRef':
                                                          FieldValue
                                                              .arrayRemove([
                                                        overlayUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }
                                            }
                                          }
                                        }

                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Kullanıcı yetkisi güncellendi.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                        );
                                      },
                                      text: 'Kaydet',
                                      options: FFButtonOptions(
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
