import 'package:flutter/material.dart';

import '../utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String uid; //uid
  final String url;
  final String username;
  final String message;
  final DateTime createdAt;

  const Message({
    required this.uid,
    required this.url,
    required this.username,
    required this.message,
    required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        uid: json['uid'],
        url: json['url'],
        username: json['username'],
        message: json['message'],
        createdAt: DateTime.parse(json['sendDate']),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'url': url,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt),
      };
}
