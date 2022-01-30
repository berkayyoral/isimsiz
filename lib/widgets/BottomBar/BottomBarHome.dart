import 'package:flutter/material.dart';

class BottomBarHome extends StatelessWidget {
  const BottomBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {Navigator.pushNamed(context, 'MainPage');},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.home,
            color: Colors.white70,)
        ],
      ),
    );
  }
}
