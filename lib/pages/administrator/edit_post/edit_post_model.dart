import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
  // State field(s) for Nyoutube widget.
  TextEditingController? nyoutubeController;
  String? Function(BuildContext, String?)? nyoutubeControllerValidator;
  // State field(s) for Naction widget.
  TextEditingController? nactionController;
  String? Function(BuildContext, String?)? nactionControllerValidator;
  // State field(s) for Ntags widget.
  List<String>? ntagsValues;
  FormFieldController<List<String>>? ntagsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nnameController?.dispose();
    ntextController?.dispose();
    nyoutubeController?.dispose();
    nactionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
