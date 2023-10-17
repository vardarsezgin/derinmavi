import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sosyal/ek_yanitlar/ek_yanitlar_widget.dart';
import '/pages/sosyal/reply_to_reply/reply_to_reply_widget.dart';
import '/pages/sosyal/yanit/yanit_widget.dart';
import 'reply_page_widget.dart' show ReplyPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReplyPageModel extends FlutterFlowModel<ReplyPageWidget> {
  ///  Local state fields for this page.

  bool enrtyText = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for all widget.
  ScrollController? all;
  // State field(s) for content widget.
  ScrollController? content;
  // Model for yanit component.
  late YanitModel yanitModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  TestForumRepliesRecord? output;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    all = ScrollController();
    content = ScrollController();
    yanitModel = createModel(context, () => YanitModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    all?.dispose();
    content?.dispose();
    yanitModel.dispose();
    textController?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
