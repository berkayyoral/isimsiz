import 'package:flutter/material.dart';
import 'package:kitaplik1/widgets/widgets.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const ChatAppBar(),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            ChatListWidget(),
          ],
        )
      ],),
    ),);
  }
}
