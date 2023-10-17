import '/backend/backend.dart';
import '/components/one_cikan_youtube_popup/one_cikan_youtube_popup_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'one_cikan_popup_model.dart';
export 'one_cikan_popup_model.dart';

class OneCikanPopupWidget extends StatefulWidget {
  const OneCikanPopupWidget({
    Key? key,
    required this.oneCikan,
  }) : super(key: key);

  final DocumentReference? oneCikan;

  @override
  _OneCikanPopupWidgetState createState() => _OneCikanPopupWidgetState();
}

class _OneCikanPopupWidgetState extends State<OneCikanPopupWidget> {
  late OneCikanPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneCikanPopupModel());
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (overlayOneCikanRecord.foto != null &&
                        overlayOneCikanRecord.foto != '')
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ONE_CIKAN_POPUP_Image_1px8yd3n_ON_TAP');
                              logFirebaseEvent('Image_expand_image');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: overlayOneCikanRecord.foto,
                                      fit: BoxFit.contain,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    allowRotation: false,
                                    tag: overlayOneCikanRecord.foto,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: overlayOneCikanRecord.foto,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: overlayOneCikanRecord.foto,
                                  width: 150.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                  'ONE_CIKAN_POPUP_Icon_43our9ze_ON_TAP');
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            overlayOneCikanRecord.baslik,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context).titleMedium,
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
                    if (overlayOneCikanRecord.aciklama != null &&
                        overlayOneCikanRecord.aciklama != '')
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SelectionArea(
                                child: Text(
                              overlayOneCikanRecord.aciklama,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.0,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    if (overlayOneCikanRecord.link != null &&
                        overlayOneCikanRecord.link != '')
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONE_CIKAN_POPUP_COMP_Row_o8lszvm7_ON_TAP');
                          logFirebaseEvent('Row_launch_u_r_l');
                          await launchURL(overlayOneCikanRecord.link);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.link_sharp,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            Flexible(
                              child: SelectionArea(
                                  child: Text(
                                'Bağlantıyı aç',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontStyle: FontStyle.italic,
                                    ),
                              )),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    if (overlayOneCikanRecord.youtube != null &&
                        overlayOneCikanRecord.youtube != '')
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ONE_CIKAN_POPUP_COMP_Row_c3cqfere_ON_TAP');
                          logFirebaseEvent('Row_bottom_sheet');
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: OneCikanYoutubePopupWidget(
                                  oneCikan: overlayOneCikanRecord.reference,
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.youtube,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            Flexible(
                              child: SelectionArea(
                                  child: Text(
                                'Videoyu aç',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontStyle: FontStyle.italic,
                                    ),
                              )),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: SelectionArea(
                              child: Text(
                            '${dateTimeFormat(
                              'yMMMd',
                              overlayOneCikanRecord.tarih,
                              locale: FFLocalizations.of(context).languageCode,
                            )} - ${dateTimeFormat(
                              'Hm',
                              overlayOneCikanRecord.tarih,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                ),
                          )),
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
