import '/backend/backend.dart';
import '/components/icerik_bulunamadi/icerik_bulunamadi_widget.dart';
import '/components/user/user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'begeniler_widget.dart' show BegenilerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BegenilerModel extends FlutterFlowModel<BegenilerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for icerikBulunamadi component.
  late IcerikBulunamadiModel icerikBulunamadiModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    icerikBulunamadiModel = createModel(context, () => IcerikBulunamadiModel());
  }

  void dispose() {
    icerikBulunamadiModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
