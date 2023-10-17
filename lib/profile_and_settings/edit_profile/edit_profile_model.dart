import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ad widget.
  TextEditingController? adController;
  String? Function(BuildContext, String?)? adControllerValidator;
  // State field(s) for biyografi widget.
  TextEditingController? biyografiController;
  String? Function(BuildContext, String?)? biyografiControllerValidator;
  // State field(s) for link widget.
  TextEditingController? linkController;
  String? Function(BuildContext, String?)? linkControllerValidator;
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
    biyografiController?.dispose();
    linkController?.dispose();
    daliskulubuController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
