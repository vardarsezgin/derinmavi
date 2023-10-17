import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sosyal/gonderi/gonderi_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sosyal_model.dart';
export 'sosyal_model.dart';

class SosyalWidget extends StatefulWidget {
  const SosyalWidget({Key? key}) : super(key: key);

  @override
  _SosyalWidgetState createState() => _SosyalWidgetState();
}

class _SosyalWidgetState extends State<SosyalWidget> {
  late SosyalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SosyalModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'sosyal'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/dernmavilogo1.png',
                                    width: 200.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 22.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent('SOSYAL_PAGE_add_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed('newThreadPage');
                          },
                        ),
                      ].addToStart(SizedBox(width: 20.0)),
                    ),
                  ),
                  StreamBuilder<List<TestForumRecord>>(
                    stream: queryTestForumRecord(
                      queryBuilder: (testForumRecord) => testForumRecord
                          .orderBy('time_posted', descending: true),
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
                      List<TestForumRecord> columnTestForumRecordList =
                          snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(columnTestForumRecordList.length,
                                    (columnIndex) {
                          final columnTestForumRecord =
                              columnTestForumRecordList[columnIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'SOSYAL_PAGE_Container_fle3uyhh_ON_TAP');
                              logFirebaseEvent('gonderi_navigate_to');

                              context.pushNamed(
                                'threadPage',
                                queryParameters: {
                                  'threadId': serializeParam(
                                    columnTestForumRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: GonderiWidget(
                              key: Key(
                                  'Keyfle_${columnIndex}_of_${columnTestForumRecordList.length}'),
                              thread: columnTestForumRecord.reference,
                            ),
                          );
                        })
                                .divide(SizedBox(height: 10.0))
                                .addToStart(SizedBox(height: 10.0))
                                .addToEnd(SizedBox(height: 20.0)),
                      );
                    },
                  ),
                ].addToEnd(SizedBox(height: 70.0)),
              ),
            ),
            wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: NavBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
