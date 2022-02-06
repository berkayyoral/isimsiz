import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: buildChats(),
      ),
    );
  }

  Widget buildChats() {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: usersRef.snapshots(),
            builder: (context, snapshot) {
              List<DocumentSnapshot> listOfDocumentSnap =
                  (snapshot.data! as QuerySnapshot).docs;

              return ListView.builder(
                itemCount: listOfDocumentSnap.length,
                itemBuilder: (context, index) {
                  final user = listOfDocumentSnap[index];

                  return Container(
                    height: 75,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatPage(user: user),
                        ));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(user['url']),
                      ),
                      title: Text(user['name']),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
