import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatItemWidget extends StatelessWidget {
  final f = DateFormat('yyyy-MM-dd hh:mm');
  var index;
  ChatItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'This is a sent message',
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    f.format(
                        DateTime.fromMillisecondsSinceEpoch(1645118473555)),
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12.0,
                        fontStyle: FontStyle.normal),
                  ),
                  margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(),
      );
    }
  }
}
