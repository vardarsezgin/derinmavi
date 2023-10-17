import '/backend/backend.dart';
import '/components/icerik_bulunamadi/icerik_bulunamadi_widget.dart';
import '/components/user/user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'begeniler_model.dart';
export 'begeniler_model.dart';

class BegenilerWidget extends StatefulWidget {
  const BegenilerWidget({
    Key? key,
    this.threadId,
    this.replyId,
    this.post,
    this.divepoint,
    this.onecikan,
  }) : super(key: key);

  final DocumentReference? threadId;
  final DocumentReference? replyId;
  final DocumentReference? post;
  final DocumentReference? divepoint;
  final DocumentReference? onecikan;

  @override
  _BegenilerWidgetState createState() => _BegenilerWidgetState();
}

class _BegenilerWidgetState extends State<BegenilerWidget> {
  late BegenilerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BegenilerModel());
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
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.5,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 50.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'BEGENILER_COMP_Icon_j9wgvixe_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Beğeniler',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.threadId != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: StreamBuilder<TestForumRecord>(
                            stream:
                                TestForumRecord.getDocument(widget.threadId!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final threadTestForumRecord = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final threadbegenenKisiler =
                                      threadTestForumRecord.likedBy
                                          .map((e) => e)
                                          .toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          threadbegenenKisiler.length,
                                          (threadbegenenKisilerIndex) {
                                        final threadbegenenKisilerItem =
                                            threadbegenenKisiler[
                                                threadbegenenKisilerIndex];
                                        return UserWidget(
                                          key: Key(
                                              'Keybbl_${threadbegenenKisilerIndex}_of_${threadbegenenKisiler.length}'),
                                          user: threadbegenenKisilerItem,
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else if (widget.replyId != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: StreamBuilder<TestForumRepliesRecord>(
                            stream: TestForumRepliesRecord.getDocument(
                                widget.replyId!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final replyTestForumRepliesRecord =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final replybegenenKisiler =
                                      replyTestForumRepliesRecord.likedBy
                                          .map((e) => e)
                                          .toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          replybegenenKisiler.length,
                                          (replybegenenKisilerIndex) {
                                        final replybegenenKisilerItem =
                                            replybegenenKisiler[
                                                replybegenenKisilerIndex];
                                        return UserWidget(
                                          key: Key(
                                              'Keybxn_${replybegenenKisilerIndex}_of_${replybegenenKisiler.length}'),
                                          user: replybegenenKisilerItem,
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else if (widget.post != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: StreamBuilder<AllPostsRecord>(
                            stream: AllPostsRecord.getDocument(widget.post!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final postAllPostsRecord = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final postbegenenKisiler = postAllPostsRecord
                                      .likes
                                      .map((e) => e)
                                      .toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          postbegenenKisiler.length,
                                          (postbegenenKisilerIndex) {
                                        final postbegenenKisilerItem =
                                            postbegenenKisiler[
                                                postbegenenKisilerIndex];
                                        return UserWidget(
                                          key: Key(
                                              'Keyrmc_${postbegenenKisilerIndex}_of_${postbegenenKisiler.length}'),
                                          user: postbegenenKisilerItem,
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else if (widget.divepoint != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: StreamBuilder<DivePointsRecord>(
                            stream:
                                DivePointsRecord.getDocument(widget.divepoint!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final divepointDivePointsRecord = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final divepointbegenenKisiler =
                                      divepointDivePointsRecord.favList
                                          .map((e) => e)
                                          .toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          divepointbegenenKisiler.length,
                                          (divepointbegenenKisilerIndex) {
                                        final divepointbegenenKisilerItem =
                                            divepointbegenenKisiler[
                                                divepointbegenenKisilerIndex];
                                        return UserWidget(
                                          key: Key(
                                              'Key6b2_${divepointbegenenKisilerIndex}_of_${divepointbegenenKisiler.length}'),
                                          user: divepointbegenenKisilerItem,
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else if (widget.onecikan != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: StreamBuilder<OneCikanRecord>(
                            stream:
                                OneCikanRecord.getDocument(widget.onecikan!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final onecikanOneCikanRecord = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final onecikanBegeni = onecikanOneCikanRecord
                                      .likes
                                      .map((e) => e)
                                      .toList();
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children:
                                          List.generate(onecikanBegeni.length,
                                              (onecikanBegeniIndex) {
                                        final onecikanBegeniItem =
                                            onecikanBegeni[onecikanBegeniIndex];
                                        return UserWidget(
                                          key: Key(
                                              'Keypy5_${onecikanBegeniIndex}_of_${onecikanBegeni.length}'),
                                          user: onecikanBegeniItem,
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.icerikBulunamadiModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: IcerikBulunamadiWidget(),
                        );
                      }
                    },
                  ),
                ]
                    .divide(SizedBox(height: 10.0))
                    .addToStart(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
