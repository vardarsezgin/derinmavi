import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'one_cikan_youtube_popup_model.dart';
export 'one_cikan_youtube_popup_model.dart';

class OneCikanYoutubePopupWidget extends StatefulWidget {
  const OneCikanYoutubePopupWidget({
    Key? key,
    required this.oneCikan,
  }) : super(key: key);

  final DocumentReference? oneCikan;

  @override
  _OneCikanYoutubePopupWidgetState createState() =>
      _OneCikanYoutubePopupWidgetState();
}

class _OneCikanYoutubePopupWidgetState
    extends State<OneCikanYoutubePopupWidget> {
  late OneCikanYoutubePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneCikanYoutubePopupModel());
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
        child: StreamBuilder<OneCikanRecord>(
          stream: OneCikanRecord.getDocument(widget.oneCikan!),
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
            final overlayOneCikanRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: 150.0,
                maxHeight: 300.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (overlayOneCikanRecord.foto != null &&
                        overlayOneCikanRecord.foto != '')
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              overlayOneCikanRecord.baslik,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ONE_CIKAN_YOUTUBE_POPUP_Icon_qd4nrc77_ON');
                              logFirebaseEvent('Icon_bottom_sheet');
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.cancel,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    if (overlayOneCikanRecord.aciklama2 != null &&
                        overlayOneCikanRecord.aciklama2 != '')
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              overlayOneCikanRecord.aciklama2,
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowYoutubePlayer(
                          url: overlayOneCikanRecord.youtube,
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          autoPlay: false,
                          looping: true,
                          mute: false,
                          showControls: true,
                          showFullScreen: true,
                          strictRelatedVideos: false,
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
