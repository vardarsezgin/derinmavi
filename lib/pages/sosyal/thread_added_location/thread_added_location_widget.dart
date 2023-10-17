import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thread_added_location_model.dart';
export 'thread_added_location_model.dart';

class ThreadAddedLocationWidget extends StatefulWidget {
  const ThreadAddedLocationWidget({
    Key? key,
    required this.threadId,
  }) : super(key: key);

  final DocumentReference? threadId;

  @override
  _ThreadAddedLocationWidgetState createState() =>
      _ThreadAddedLocationWidgetState();
}

class _ThreadAddedLocationWidgetState extends State<ThreadAddedLocationWidget> {
  late ThreadAddedLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadAddedLocationModel());
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: StreamBuilder<TestForumRecord>(
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
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: 420.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 40.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDADADA),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                containerTestForumRecord.locationName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'THREAD_ADDED_LOCATION_Card_p3d4pcs6_ON_T');
                                  logFirebaseEvent('Card_launch_map');
                                  await launchMap(
                                    location:
                                        containerTestForumRecord.locationLatLng,
                                    title:
                                        containerTestForumRecord.locationName,
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.locationArrow,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Container(
                            width: double.infinity,
                            height: 350.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFDADADA),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Builder(builder: (context) {
                              final _googleMapMarker =
                                  containerTestForumRecord.locationLatLng;
                              return FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    containerTestForumRecord.locationLatLng!,
                                markers: [
                                  if (_googleMapMarker != null)
                                    FlutterFlowMarker(
                                      _googleMapMarker.serialize(),
                                      _googleMapMarker,
                                    ),
                                ],
                                markerColor: GoogleMarkerColor.blue,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 12.0,
                                allowInteraction: false,
                                allowZoom: false,
                                showZoomControls: true,
                                showLocation: false,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              );
                            }),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
