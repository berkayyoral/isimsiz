import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitaplik1/users.dart';
import 'classes/firebase_api.dart';
import 'ekranlar/screens.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Firebase Chat';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: LoginScreen(),
      );
}
