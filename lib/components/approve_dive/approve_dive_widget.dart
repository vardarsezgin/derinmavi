import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'approve_dive_model.dart';
export 'approve_dive_model.dart';

class ApproveDiveWidget extends StatefulWidget {
  const ApproveDiveWidget({
    Key? key,
    required this.diveRefNumber,
    this.diveId,
  }) : super(key: key);

  final String? diveRefNumber;
  final DocumentReference? diveId;

  @override
  _ApproveDiveWidgetState createState() => _ApproveDiveWidgetState();
}

class _ApproveDiveWidgetState extends State<ApproveDiveWidget> {
  late ApproveDiveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveDiveModel());
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
        child: Container(
          width: double.infinity,
          height: 250.0,
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
          child: StreamBuilder<List<DivelogsRecord>>(
            stream: queryDivelogsRecord(
              queryBuilder: (divelogsRecord) => divelogsRecord.where(
                'diveRefNumber',
                isEqualTo: widget.diveRefNumber,
              ),
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
              List<DivelogsRecord> columnDivelogsRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnDivelogsRecord = columnDivelogsRecordList.isNotEmpty
                  ? columnDivelogsRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        columnDivelogsRecord!.parentReference),
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
                        height: 250.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Onayla',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                          'APPROVE_DIVE_COMP_Icon_57ir9nef_ON_TAP');
                                      logFirebaseEvent('Icon_bottom_sheet');
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      'Onaylamadan önce dalış bilgilerini doğrulamayı unutma!\n\nUyarı: Bu işlemi geri alamazsınız.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      'Dalıcı:',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      containerUsersRecord.displayName,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      'Ref:',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      columnDivelogsRecord!.diveRefNumber,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'APPROVE_DIVE_COMP_ONAYLA_BTN_ON_TAP');
                                  if (valueOrDefault(
                                          currentUserDocument
                                              ?.gecerliSertifikaSev,
                                          '') ==
                                      '1 Yıldız') {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Uyarı'),
                                          content: Text(
                                              'Seviyeniz dalış onaylamaya uygun değildir.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Tamam'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  } else {
                                    if (valueOrDefault(
                                            currentUserDocument
                                                ?.gecerliSertifikaSev,
                                            '') ==
                                        '2 Yıldız') {
                                      if (containerUsersRecord
                                              .gecerliSertifikaSev ==
                                          '1 Yıldız') {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Uyarı'),
                                              content: Text(
                                                  '1 Yıldız Seviyesi bir dalıcının dalışını onaylayamazsınız.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Tamam'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      }
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument
                                                  ?.gecerliSertifikaSev,
                                              '') !=
                                          '3 Yıldız') {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Şu anda sana yardımcı olamıyoruz.'),
                                              content: Text(
                                                  ' Problemin için profil ayarlarındaki destek kısmından bize ulaşabilirsin.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Tamam'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        return;
                                      } else if (valueOrDefault(
                                              currentUserDocument
                                                  ?.gecerliSertifikaSev,
                                              '') ==
                                          '1 Yıldız Eğitmen') {
                                      } else if (valueOrDefault(
                                              currentUserDocument
                                                  ?.gecerliSertifikaSev,
                                              '') ==
                                          '2 Yıldız Eğitmen') {
                                      } else if (valueOrDefault(
                                              currentUserDocument
                                                  ?.gecerliSertifikaSev,
                                              '') ==
                                          '3 Yıldız Eğitmen') {}
                                    }

                                    logFirebaseEvent('Button_backend_call');

                                    await columnDivelogsRecord!.reference
                                        .update({
                                      ...createDivelogsRecordData(
                                        leaderApproval: true,
                                        approvedBy: currentUserReference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'approvedDate':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent(
                                        'Button_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle: 'Dalışın onaylandı.',
                                      notificationText:
                                          'Tebrikler, dalışın ${currentUserDisplayName} tarafından onaylandı.',
                                      notificationSound: 'default',
                                      userRefs: [
                                        columnDivelogsRecord!.parentReference
                                      ],
                                      initialPageName: 'diveInfo',
                                      parameterData: {
                                        'diveId':
                                            columnDivelogsRecord?.reference,
                                      },
                                    );
                                    return;
                                  }
                                },
                                text: 'Onayla',
                                options: FFButtonOptions(
                                  width: 120.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 10.0))
                                .around(SizedBox(height: 10.0)),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
