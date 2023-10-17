import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_result/no_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_menu_widget.dart' show UserMenuWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserMenuModel extends FlutterFlowModel<UserMenuWidget> {
  ///  State fields for stateful widgets in this component.

  var qrShare = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  DivelogsRecord? doc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
