import 'package:flutter/material.dart';
import 'package:kitaplik1/widgets/widgets.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  ChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context,index) => ChatItemWidget(index),
    itemCount: 20,
    reverse: true,
    controller: listScrollController,));
  }
}
