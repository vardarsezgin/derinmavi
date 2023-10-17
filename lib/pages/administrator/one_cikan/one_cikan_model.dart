import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'one_cikan_widget.dart' show OneCikanWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OneCikanModel extends FlutterFlowModel<OneCikanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nname widget.
  TextEditingController? nnameController;
  String? Function(BuildContext, String?)? nnameControllerValidator;
  // State field(s) for Ntext widget.
  TextEditingController? ntextController;
  String? Function(BuildContext, String?)? ntextControllerValidator;
  // State field(s) for Ntext2 widget.
  TextEditingController? ntext2Controller;
  String? Function(BuildContext, String?)? ntext2ControllerValidator;
  // State field(s) for Naction widget.
  TextEditingController? nactionController;
  String? Function(BuildContext, String?)? nactionControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nnameController?.dispose();
    ntextController?.dispose();
    ntext2Controller?.dispose();
    nactionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}