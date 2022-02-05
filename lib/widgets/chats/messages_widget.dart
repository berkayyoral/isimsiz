import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/model/message.dart';
import 'package:kitaplik1/widgets/chats/message_widget.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;

  const MessagesWidget({
    required this.idUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        stream: FirebaseApi.getMessages(idUser),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;

                if (messages != null && messages.isEmpty) {
                  return ListView.builder(
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
                  );
                }

                return buildText('Say Hi..');
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
              }
          }
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
