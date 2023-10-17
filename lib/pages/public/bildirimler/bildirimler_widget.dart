import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bildirim/bildirim_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bildirimler_model.dart';
export 'bildirimler_model.dart';

class BildirimlerWidget extends StatefulWidget {
  const BildirimlerWidget({Key? key}) : super(key: key);

  @override
  _BildirimlerWidgetState createState() => _BildirimlerWidgetState();
}

class _BildirimlerWidgetState extends State<BildirimlerWidget> {
  late BildirimlerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BildirimlerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bildirimler'});
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.00, -1.00),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BILDIRIMLER_Container_8xfp61t7_ON_TAP');
                            logFirebaseEvent('Container_navigate_back');
                            context.safePop();
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
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
                      Text(
                        'Bildirimler',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                            ),
                      ),
                      FutureBuilder<int>(
                        future: (_model.firestoreRequestCompleter ??=
                                Completer<int>()
                                  ..complete(queryNotificationsRecordCount(
                                    queryBuilder: (notificationsRecord) =>
                                        notificationsRecord
                                            .where(
                                              'alici',
                                              isEqualTo: currentUserReference,
                                            )
                                            .where(
                                              'isReaded',
                                              isEqualTo: false,
                                            ),
                                  )))
                            .future,
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
                          int badgeCount = snapshot.data!;
                          return badges.Badge(
                            badgeContent: Text(
                              badgeCount.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                            ),
                            showBadge: true,
                            shape: badges.BadgeShape.circle,
                            badgeColor: FlutterFlowTheme.of(context).secondary,
                            elevation: 1.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            position: badges.BadgePosition.topEnd(),
                            animationType: badges.BadgeAnimationType.scale,
                            toAnimate: true,
                            child: Icon(
                              Icons.notifications,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<NotificationsRecord>>(
                    future: queryNotificationsRecordOnce(
                      queryBuilder: (notificationsRecord) => notificationsRecord
                          .orderBy('timestamp', descending: true),
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
                      List<NotificationsRecord> repliesNotificationsRecordList =
                          snapshot.data!;
                      return RefreshIndicator(
                        onRefresh: () async {
                          logFirebaseEvent(
                              'BILDIRIMLER_replies_ON_PULL_TO_REFRESH');
                          logFirebaseEvent('replies_refresh_database_request');
                          setState(
                              () => _model.firestoreRequestCompleter = null);
                          await _model.waitForFirestoreRequestCompleted(
                              minWait: 200);
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                    repliesNotificationsRecordList.length,
                                    (repliesIndex) {
                              final repliesNotificationsRecord =
                                  repliesNotificationsRecordList[repliesIndex];
                              return BildirimWidget(
                                key: Key(
                                    'Key28k_${repliesIndex}_of_${repliesNotificationsRecordList.length}'),
                                notId: repliesNotificationsRecord.reference,
                              );
                            })
                                .divide(SizedBox(height: 10.0))
                                .addToEnd(SizedBox(height: 90.0)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
      ),
    );
  }
}
