// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_mentions/flutter_mentions.dart';

class UserMentions extends StatefulWidget {
  const UserMentions({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _UserMentionsState createState() => _UserMentionsState();
}

class _UserMentionsState extends State<UserMentions> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlutterMentions(
          key: key,
          suggestionPosition: SuggestionPosition.Top,
          maxLines: 5,
          minLines: 1,
          decoration: InputDecoration(hintText: 'hello'),
          mentions: [
            Mention(
                trigger: '@',
                style: TextStyle(
                  color: Colors.amber,
                ),
                data: [
                  {
                    'id': '61as61fsa',
                    'display': 'fayeedP',
                    'full_name': 'Fayeed Pawaskar',
                    'photo':
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  },
                  {
                    'id': '61asasgasgsag6a',
                    'display': 'khaled',
                    'full_name': 'DJ Khaled',
                    'style': TextStyle(color: Colors.purple),
                    'photo':
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  },
                  {
                    'id': 'asfgasga41',
                    'display': 'markT',
                    'full_name': 'Mark Twain',
                    'photo':
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  },
                  {
                    'id': 'asfsaf451a',
                    'display': 'JhonL',
                    'full_name': 'Jhon Legend',
                    'photo':
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  },
                ],
                matchAll: false,
                suggestionBuilder: (data) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            data['photo'],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(data['full_name']),
                            Text('@${data['display']}'),
                          ],
                        )
                      ],
                    ),
                  );
                }),
            Mention(
              trigger: '#',
              disableMarkup: true,
              style: TextStyle(
                color: Colors.blue,
              ),
              data: [
                {'id': 'reactjs', 'display': 'reactjs'},
                {'id': 'javascript', 'display': 'javascript'},
              ],
              matchAll: true,
            )
          ],
        ),
      ),
    );
  }
}
