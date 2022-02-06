import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitaplik1/data.dart';
import 'package:kitaplik1/model/message.dart';
import 'package:kitaplik1/model/user.dart';

import '../utils.dart';

class FirebaseApi {
  static Future uploadMessage(String uid, String message) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$uid/messages');

    final newMessage = Message(
      uid: myId,
      url: myUrlAvatar,
      username: myUsername,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers.doc(uid).update({UserField.lastMessageTime: DateTime.now()});
  }

  static Stream<List<Message>> getMessages(String uid) =>
      FirebaseFirestore.instance
          .collection('chats/$uid/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
