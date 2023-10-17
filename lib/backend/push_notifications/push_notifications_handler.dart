import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).alternate,
          child: Image.asset(
            'assets/images/splashscreen.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'addDive': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'diveId': getParameter<DocumentReference>(data, 'diveId'),
        },
      ),
  'divePoint': (data) async => ParameterData(
        allParams: {
          'pointId': getParameter<DocumentReference>(data, 'pointId'),
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'myDiveChart': ParameterData.none(),
  'getStarted': ParameterData.none(),
  'registerOrSignIn': ParameterData.none(),
  'registerPage': ParameterData.none(),
  'signInPage': ParameterData.none(),
  'recoveryPassword': ParameterData.none(),
  'diveLogs': ParameterData.none(),
  'diveInfo': (data) async => ParameterData(
        allParams: {
          'diveId': getParameter<DocumentReference>(data, 'diveId'),
        },
      ),
  'addPost': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'postId': getParameter<DocumentReference>(data, 'postId'),
        },
      ),
  'profilePage': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'editDive': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'diveId': getParameter<DocumentReference>(data, 'diveId'),
        },
      ),
  'addDiveFromQR': (data) async => ParameterData(
        allParams: {
          'diveRefNumber': getParameter<String>(data, 'diveRefNumber'),
        },
      ),
  'addDivePoint': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'Settings': ParameterData.none(),
  'selectUserImage': ParameterData.none(),
  'adminPanel': ParameterData.none(),
  'sendNotificationToAll': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'notId': getParameter<DocumentReference>(data, 'notId'),
        },
      ),
  'oneCikanlar': ParameterData.none(),
  'users': ParameterData.none(),
  'termsconditions': ParameterData.none(),
  'editDivePoints': ParameterData.none(),
  'editModules': ParameterData.none(),
  'singlePost': (data) async => ParameterData(
        allParams: {
          'postId': getParameter<DocumentReference>(data, 'postId'),
        },
      ),
  'editTags': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'postId': getParameter<DocumentReference>(data, 'postId'),
        },
      ),
  'editContent': ParameterData.none(),
  'approvePosts': ParameterData.none(),
  'sendNotificationToUser': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'editFederations': ParameterData.none(),
  'editCertLevels': (data) async => ParameterData(
        allParams: {
          'fedRef': getParameter<DocumentReference>(data, 'fedRef'),
        },
      ),
  'addCertificate': ParameterData.none(),
  'myCertificates': ParameterData.none(),
  'approveCertificates': ParameterData.none(),
  'certificateInfo': (data) async => ParameterData(
        allParams: {
          'certId': getParameter<DocumentReference>(data, 'certId'),
        },
      ),
  'sendNotificationToRef': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'contactPage': ParameterData.none(),
  'editPost': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'postId': getParameter<DocumentReference>(data, 'postId'),
        },
      ),
  'editDivePoint': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'divePointId': getParameter<DocumentReference>(data, 'divePointId'),
        },
      ),
  'moderatorPage': ParameterData.none(),
  'approveAllContent': ParameterData.none(),
  'profileOther': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
        },
      ),
  'sosyal': ParameterData.none(),
  'threadPage': (data) async => ParameterData(
        allParams: {
          'threadId': getParameter<DocumentReference>(data, 'threadId'),
        },
      ),
  'phoneAuth': ParameterData.none(),
  'verifySMS': ParameterData.none(),
  'pinCode': ParameterData.none(),
  'changePinCode': ParameterData.none(),
  'newThreadPage': ParameterData.none(),
  'addLocationToPost': ParameterData.none(),
  'addTaggedUserToPost': ParameterData.none(),
  'tagUsersToPost': (data) async => ParameterData(
        allParams: {
          'thread': getParameter<DocumentReference>(data, 'thread'),
        },
      ),
  'myProfilePage': ParameterData.none(),
  'phoneAuthRegister': ParameterData.none(),
  'verifySMSRegister': ParameterData.none(),
  'selectUsername': ParameterData.none(),
  'completeProfile': ParameterData.none(),
  'RegisterSuccessPage': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'anasayfa': ParameterData.none(),
  'oneCikan': (data) async => ParameterData(
        allParams: {
          'userId': getParameter<DocumentReference>(data, 'userId'),
          'postId': getParameter<DocumentReference>(data, 'postId'),
        },
      ),
  'allPosts': ParameterData.none(),
  'divePoints': ParameterData.none(),
  'bookmarkedPoints': ParameterData.none(),
  'nearPoints': ParameterData.none(),
  'sikayetler': ParameterData.none(),
  'userAdd': ParameterData.none(),
  'bildirimler': ParameterData.none(),
  'editThread': (data) async => ParameterData(
        allParams: {
          'threadId': getParameter<DocumentReference>(data, 'threadId'),
        },
      ),
  'replyPage': (data) async => ParameterData(
        allParams: {
          'threadId': getParameter<DocumentReference>(data, 'threadId'),
          'replyId': getParameter<DocumentReference>(data, 'replyId'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
