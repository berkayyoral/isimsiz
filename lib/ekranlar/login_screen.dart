import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kitaplik1/classes/authentication.dart';
import 'package:kitaplik1/ekranlar/screens.dart';
import 'package:kitaplik1/renkler.dart';
import 'package:kitaplik1/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController kEmail = TextEditingController();
  TextEditingController kPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/white_background.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'SOCIALCHAT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    controller: kEmail,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    controller: kPassword,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'MainPage'),
                    child: FlatButton(
                      textColor: Colors.red, // foreground
                      onPressed: () {
                        AuthenticationHelper()
                            .signIn(
                                email: kEmail.text, password: kPassword.text)
                            .then((result) {
                          if (result == null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      },
                      child: Text('Login'),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateNewAccount())),
                    child: Text('Create New Account'),
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: kWhite),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        )
      ],
    );
  }
}
