import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/model/user.dart';
import 'package:kitaplik1/widgets/chats/chat_body_widget.dart';
import 'package:kitaplik1/widgets/chats/chat_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:kitaplik1/classes/firebase_api.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: StreamBuilder<List<User>>(
            stream: FirebaseApi.getUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return buildText('Something Went Wrong Try later' +
                        snapshot.error.toString());
                  } else {
                    final users = snapshot.data;

                    if (users != null && users.isEmpty) {
                      return Column(
                        children: [
                          ChatHeaderWidget(users: users),
                          ChatBodyWidget(users: users)
                        ],
                      );
                    } else {
                      return buildText('No Users Found');
                    }
                    /*if (users.isEmpty) {
                      return buildText('No Users Found');
                    } else
                      return Column(
                        children: [
                          ChatHeaderWidget(users: users),
                          ChatBodyWidget(users: users)
                        ],
                      );*/
                  }
              }
            },
          ),
        ),
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
