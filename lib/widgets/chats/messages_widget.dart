import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/model/message.dart';
import 'package:kitaplik1/model/user.dart';
import 'package:kitaplik1/widgets/chats/message_widget.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class MessagesWidget extends StatelessWidget {
  final String uid;

  const MessagesWidget({
    required this.uid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('chats/$uid/messages');

    /*final newMessage = Message(
      uid: myId,
      url: myUrlAvatar,
      username: myUsername,
      message: message,
      createdAt: DateTime.now(),
    );
    usersRef.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('users');
    refUsers.doc(uid).update({UserField.lastMessageTime: DateTime.now()});*/

    return StreamBuilder<QuerySnapshot>(
        stream: usersRef
            .orderBy(MessageField.createdAt, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          List<DocumentSnapshot> listOfDocumentSnap2 =
              (snapshot.data! as QuerySnapshot).docs;

          //final messages = snapshot.data;

          //if (messages != null && messages.isEmpty) {
          return ListView.builder(
              //physics: BouncingScrollPhysics(),
              //reverse: true,
              itemCount: listOfDocumentSnap2.length,
              itemBuilder: (context, index) {
                final message = listOfDocumentSnap2[index];

                return MessageWidget(
                  message: message,
                  isMe: message['uid'] == myId,
                );
              });
        }

        //return buildText('Say Hi..');
        /*return messages.isEmpty
                    ? buildText('Say Hi..')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];

                          return MessageWidget(
                            message: message,
                            isMe: message.idUser == myId,
                          );
                        },
                      );*/

        );

    Widget buildText(String text) => Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        );
  }
}
