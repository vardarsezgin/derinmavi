import '/backend/backend.dart';
import '/components/user/user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'etiketli_kullanicilar_model.dart';
export 'etiketli_kullanicilar_model.dart';

class EtiketliKullanicilarWidget extends StatefulWidget {
  const EtiketliKullanicilarWidget({
    Key? key,
    required this.threadId,
  }) : super(key: key);

  final DocumentReference? threadId;

  @override
  _EtiketliKullanicilarWidgetState createState() =>
      _EtiketliKullanicilarWidgetState();
}

class _EtiketliKullanicilarWidgetState
    extends State<EtiketliKullanicilarWidget> {
  late EtiketliKullanicilarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EtiketliKullanicilarModel());
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 50.0, 0.0),
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
                                    'ETIKETLI_KULLANICILAR_Icon_v0um6j9q_ON_T');
                                logFirebaseEvent('Icon_navigate_back');
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Etiketli kişiler',
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 24.0),
                          child: Builder(
                            builder: (context) {
                              final etiketliKisiler = containerTestForumRecord
                                  .taggedUsers
                                  .map((e) => e)
                                  .toList();
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      List.generate(etiketliKisiler.length,
                                          (etiketliKisilerIndex) {
                                    final etiketliKisilerItem =
                                        etiketliKisiler[etiketliKisilerIndex];
                                    return UserWidget(
                                      key: Key(
                                          'Key3dt_${etiketliKisilerIndex}_of_${etiketliKisiler.length}'),
                                      user: etiketliKisilerItem,
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .addToStart(SizedBox(height: 50.0)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
