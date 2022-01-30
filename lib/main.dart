import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ekranlar/screens.dart';

Future<void> main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'İsimBulun',
      theme: ThemeData(
        textTheme:
          GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> LoginScreen(),
        'ForgotPassword': (context)=> const ForgotPassword(),
        'CreateNewAccount' : (context)=> const CreateNewAccount(),
        'MainPage' : (context) => const MainPage(),
        'Profile' : (context) => const Profile(),
        'Chat' : (context) => const Chat(),
      },
    );
  }
}

