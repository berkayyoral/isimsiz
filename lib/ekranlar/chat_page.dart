import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitaplik1/model/user.dart';
import 'package:kitaplik1/widgets/chats/messages_widget.dart';
import 'package:kitaplik1/widgets/chats/new_message_widget.dart';
import 'package:kitaplik1/widgets/chats/profile_header_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final DocumentSnapshot<Object?> user;

  const ChatPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(name: widget.user['name']),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(uid: widget.user['uid']),
                ),
              ),
              NewMessageWidget(uid: widget.user['uid'])
            ],
          ),
        ),
      );
}
