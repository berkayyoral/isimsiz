import 'package:flutter/material.dart';

class BottomBarProfile extends StatelessWidget {
  const BottomBarProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {Navigator.pushNamed(context, 'Profile');},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.assignment_ind_outlined,
            color: Colors.white70,)
        ],
      ),
    );
  }
}
