import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'add_dive_point_widget.dart' show AddDivePointWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDivePointModel extends FlutterFlowModel<AddDivePointWidget> {
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
  // State field(s) for pLocation widget.
  var pLocationValue = FFPlace();
  // State field(s) for pName widget.
  TextEditingController? pNameController;
  String? Function(BuildContext, String?)? pNameControllerValidator;
  String? _pNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length > 15) {
      return 'Maksimum 15 karakter girilmelidir.';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for youtube widget.
  TextEditingController? youtubeController;
  String? Function(BuildContext, String?)? youtubeControllerValidator;
  // State field(s) for maxDepth widget.
  TextEditingController? maxDepthController;
  String? Function(BuildContext, String?)? maxDepthControllerValidator;
  // State field(s) for avgTemp widget.
  TextEditingController? avgTempController;
  String? Function(BuildContext, String?)? avgTempControllerValidator;
  // State field(s) for pointRate widget.
  double? pointRateValue;
  // State field(s) for visibilityRate widget.
  double? visibilityRateValue;
  // State field(s) for pText widget.
  TextEditingController? pTextController;
  String? Function(BuildContext, String?)? pTextControllerValidator;
  String? _pTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu alan';
    }

    if (val.length > 450) {
      return 'Maksimum karakter sayısını aştınız.';
    }

    return null;
  }

  // State field(s) for tags widget.
  List<String>? tagsValues;
  FormFieldController<List<String>>? tagsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pNameControllerValidator = _pNameControllerValidator;
    pTextControllerValidator = _pTextControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    pNameController?.dispose();
    youtubeController?.dispose();
    maxDepthController?.dispose();
    avgTempController?.dispose();
    pTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
