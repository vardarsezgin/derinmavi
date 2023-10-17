import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/check_connection/check_connection_widget.dart';
import '/components/user_blocked/user_blocked_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future girisDogrulama(BuildContext context) async {
  if (loggedIn == false) {
    logFirebaseEvent('girisDogrulama_navigate_to');

    context.goNamed('getStarted');
  }
}

Future kullaniciAdiDogrulama(BuildContext context) async {
  if (currentUserDisplayName == null || currentUserDisplayName == '') {
    logFirebaseEvent('kullaniciAdiDogrulama_navigate_to');

    context.goNamed('selectUsername');
  }
}

Future checkConnection(BuildContext context) async {
  bool? checkStatus;

  logFirebaseEvent('checkConnection_custom_action');
  checkStatus = await actions.checkConnection();
  if (!checkStatus!) {
    logFirebaseEvent('checkConnection_bottom_sheet');
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: CheckConnectionWidget(),
        );
      },
    );
  }
}

Future isBlocked(BuildContext context) async {
  if (valueOrDefault<bool>(currentUserDocument?.isBlocked, false)) {
    logFirebaseEvent('isBlocked_navigate_to');

    context.goNamed('getStarted');

    logFirebaseEvent('isBlocked_bottom_sheet');
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: UserBlockedWidget(),
          ),
        );
      },
    );
  }
}
