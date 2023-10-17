import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'add_dive_widget.dart' show AddDiveWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDiveModel extends FlutterFlowModel<AddDiveWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for divingPoint widget.
  TextEditingController? divingPointController;
  String? Function(BuildContext, String?)? divingPointControllerValidator;
  String? _divingPointControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length > 15) {
      return 'Maksimum 15 karakter';
    }

    return null;
  }

  // State field(s) for depth widget.
  TextEditingController? depthController;
  String? Function(BuildContext, String?)? depthControllerValidator;
  String? _depthControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length > 2) {
      return 'Maksimum 2 karakter';
    }

    return null;
  }

  // State field(s) for duration widget.
  TextEditingController? durationController;
  String? Function(BuildContext, String?)? durationControllerValidator;
  String? _durationControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Zorunlu';
    }

    if (val.length > 2) {
      return 'Maksimum 2 karakter';
    }

    return null;
  }

  // State field(s) for diveBuddy widget.
  TextEditingController? diveBuddyController;
  String? Function(BuildContext, String?)? diveBuddyControllerValidator;
  // State field(s) for diveLeader widget.
  TextEditingController? diveLeaderController;
  String? Function(BuildContext, String?)? diveLeaderControllerValidator;
  // State field(s) for TankType widget.
  FormFieldController<String>? tankTypeValueController;
  // State field(s) for Weight widget.
  int? weightValue;
  // State field(s) for diveTemp widget.
  TextEditingController? diveTempController;
  String? Function(BuildContext, String?)? diveTempControllerValidator;
  // State field(s) for airConsumption widget.
  TextEditingController? airConsumptionController;
  String? Function(BuildContext, String?)? airConsumptionControllerValidator;
  // State field(s) for secDepth widget.
  TextEditingController? secDepthController;
  String? Function(BuildContext, String?)? secDepthControllerValidator;
  // State field(s) for secDuration widget.
  TextEditingController? secDurationController;
  String? Function(BuildContext, String?)? secDurationControllerValidator;
  // State field(s) for diveRate widget.
  double? diveRateValue;
  // State field(s) for hoveringRate widget.
  double? hoveringRateValue;
  // State field(s) for diveNotes widget.
  TextEditingController? diveNotesController;
  String? Function(BuildContext, String?)? diveNotesControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    divingPointControllerValidator = _divingPointControllerValidator;
    depthControllerValidator = _depthControllerValidator;
    durationControllerValidator = _durationControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    divingPointController?.dispose();
    depthController?.dispose();
    durationController?.dispose();
    diveBuddyController?.dispose();
    diveLeaderController?.dispose();
    diveTempController?.dispose();
    airConsumptionController?.dispose();
    secDepthController?.dispose();
    secDurationController?.dispose();
    diveNotesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get tankTypeValue => tankTypeValueController?.value;
}
