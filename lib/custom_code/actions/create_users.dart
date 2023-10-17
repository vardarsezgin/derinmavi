// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:cloud_functions/cloud_functions.dart';

Future createUsers(String email, String password, String displayName) async {
  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
    'createUser',
  );

  try {
    final HttpsCallableResult result = await callable.call({
      'email': email,
      'password': password,
      'displayName': displayName,
    });
    print('Kullanıcı oluşturuldu: ${result.data}');
  } catch (e) {
    print('Hata:: $e');
  }
}
