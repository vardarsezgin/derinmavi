import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
export 'user_model.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late UserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.user!),
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
            final rowUsersRecord = snapshot.data!;
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('USER_COMP_Row_fdm2pzsm_ON_TAP');
                if (rowUsersRecord.reference != currentUserReference) {
                  logFirebaseEvent('Row_navigate_to');

                  context.pushNamed(
                    'profileOther',
                    queryParameters: {
                      'userId': serializeParam(
                        rowUsersRecord.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 35.0,
                        height: 35.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/diver_(1).png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (rowUsersRecord.photoUrl != null &&
                          rowUsersRecord.photoUrl != '')
                        Container(
                          width: 35.0,
                          height: 35.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: rowUsersRecord.photoUrl,
                            fit: BoxFit.cover,
                            errorWidget: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rowUsersRecord.displayName,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                ),
                          ),
                          if (rowUsersRecord.nameSurname != null &&
                              rowUsersRecord.nameSurname != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Text(
                                rowUsersRecord.nameSurname,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (currentUserReference != widget.user)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_COMP_Container_iol2lgcx_ON_TAP');
                              if ((currentUserDocument?.following?.toList() ??
                                      [])
                                  .contains(rowUsersRecord.reference)) {
                                logFirebaseEvent('Container_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'following': FieldValue.arrayRemove(
                                          [rowUsersRecord.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Container_backend_call');

                                await rowUsersRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'followed_by': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              } else {
                                logFirebaseEvent('Container_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'following': FieldValue.arrayUnion(
                                          [rowUsersRecord.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Container_backend_call');

                                await rowUsersRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'followed_by': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                              }
                            },
                            child: Container(
                              width: 110.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: (currentUserDocument?.following
                                                ?.toList() ??
                                            [])
                                        .contains(rowUsersRecord.reference)
                                    ? Color(0xFFEFEFEF)
                                    : FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 6.0, 8.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          () {
                                            if (rowUsersRecord.following
                                                    .contains(
                                                        currentUserReference) &&
                                                !(currentUserDocument?.following
                                                            ?.toList() ??
                                                        [])
                                                    .contains(rowUsersRecord
                                                        .reference)) {
                                              return 'Sen de takip et';
                                            } else if (!rowUsersRecord.following
                                                    .contains(
                                                        currentUserReference) &&
                                                !(currentUserDocument?.following
                                                            ?.toList() ??
                                                        [])
                                                    .contains(rowUsersRecord
                                                        .reference)) {
                                              return 'Takip et';
                                            } else {
                                              return 'Takibi bırak';
                                            }
                                          }(),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: (currentUserDocument
                                                                ?.following
                                                                ?.toList() ??
                                                            [])
                                                        .contains(rowUsersRecord
                                                            .reference)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
    );
  }
}
