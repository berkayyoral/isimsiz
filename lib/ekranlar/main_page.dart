import 'package:flutter/material.dart';
import 'package:kitaplik1/widgets/BottomBar/BottomBarHome.dart';
import 'package:kitaplik1/widgets/BottomBar/BottomBarProfile.dart';
import 'package:kitaplik1/widgets/background_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
            title: const Text("Anasayfa"),
            actions: [
              IconButton(
                onPressed: () {Navigator.pushNamed(context, 'Chat');},
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
