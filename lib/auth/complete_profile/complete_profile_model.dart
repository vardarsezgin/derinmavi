import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ad widget.
  TextEditingController? adController;
  String? Function(BuildContext, String?)? adControllerValidator;
  // State field(s) for daliskulubu widget.
  TextEditingController? daliskulubuController;
  String? Function(BuildContext, String?)? daliskulubuControllerValidator;
  // State field(s) for federasyon widget.
  String? federasyonValue;
  FormFieldController<String>? federasyonValueController;
  // State field(s) for brove widget.
  String? broveValue;
  FormFieldController<String>? broveValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    adController?.dispose();
    daliskulubuController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
