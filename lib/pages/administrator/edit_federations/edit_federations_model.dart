import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_federations_widget.dart' show EditFederationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditFederationsModel extends FlutterFlowModel<EditFederationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fedName widget.
  TextEditingController? fedNameController;
  String? Function(BuildContext, String?)? fedNameControllerValidator;
  String? _fedNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu alan';
    }

    if (val.length < 3) {
      return 'Minimum 3 karakter girilmelidir.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fedNameControllerValidator = _fedNameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    fedNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
