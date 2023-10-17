import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'send_notification_to_ref_widget.dart' show SendNotificationToRefWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendNotificationToRefModel
    extends FlutterFlowModel<SendNotificationToRefWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for notName widget.
  TextEditingController? notNameController;
  String? Function(BuildContext, String?)? notNameControllerValidator;
  String? _notNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length < 3) {
      return 'Minimum 3 karakter girilebilir.';
    }
    if (val.length > 70) {
      return 'Maksimum 70 karakter girilebilir.';
    }

    return null;
  }

  // State field(s) for Nottext widget.
  TextEditingController? nottextController;
  String? Function(BuildContext, String?)? nottextControllerValidator;
  String? _nottextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length < 20) {
      return 'Minimum 20 karakter girilebilir.';
    }
    if (val.length > 256) {
      return 'Maksimum 256 karakter girilebilir.';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    notNameControllerValidator = _notNameControllerValidator;
    nottextControllerValidator = _nottextControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    notNameController?.dispose();
    nottextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
