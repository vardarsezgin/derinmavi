import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_pin_code_widget.dart' show ChangePinCodeWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePinCodeModel extends FlutterFlowModel<ChangePinCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController1;
  String? Function(BuildContext, String?)? pinCodeController1Validator;
  String? _pinCodeController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }
    if (val.length < 4) {
      return 'Requires 4 characters.';
    }
    return null;
  }

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController2;
  String? Function(BuildContext, String?)? pinCodeController2Validator;
  String? _pinCodeController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }
    if (val.length < 4) {
      return 'Requires 4 characters.';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController1 = TextEditingController();
    pinCodeController1Validator = _pinCodeController1Validator;
    pinCodeController2 = TextEditingController();
    pinCodeController2Validator = _pinCodeController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController1?.dispose();
    pinCodeController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
