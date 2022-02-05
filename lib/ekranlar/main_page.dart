import 'package:flutter/material.dart';
import 'package:kitaplik1/widgets/BottomBar/BottomBarHome.dart';
import 'package:kitaplik1/widgets/BottomBar/BottomBarProfile.dart';
import 'package:kitaplik1/widgets/background_image.dart';

import 'chat_page.dart';
import 'chats_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/white_background.jpg'),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("SocialChat"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatsPage()));
                },
                icon: const Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: const Center(
            child: Text("Anasayfa"),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Color(0x11aaaaff),
            child: Container(
              height: 60,
              width: Checkbox.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  BottomBarHome(),
                  BottomBarProfile(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
