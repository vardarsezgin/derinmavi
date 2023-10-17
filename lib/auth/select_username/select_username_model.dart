import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'select_username_widget.dart' show SelectUsernameWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectUsernameModel extends FlutterFlowModel<SelectUsernameWidget> {
  ///  Local state fields for this page.

  bool dataExist = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for displayname widget.
  TextEditingController? displaynameController;
  String? Function(BuildContext, String?)? displaynameControllerValidator;
  String? _displaynameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu alan';
    }

    if (val.length < 4) {
      return 'Minimum 4 karakter olmalıdır';
    }
    if (val.length > 25) {
      return 'Maksimum 25 karakter olmalıdır';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    displaynameControllerValidator = _displaynameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    displaynameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
