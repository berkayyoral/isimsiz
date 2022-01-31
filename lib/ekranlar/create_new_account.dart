import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitaplik1/classes/authentication.dart';
import 'package:kitaplik1/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../renkler.dart';
import 'main_page.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  File? image;
  TextEditingController kEmail = TextEditingController();
  TextEditingController kPassword = TextEditingController();
  TextEditingController kNameSur = TextEditingController();

  //final FotografEkle image = new FotografEkle();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/white_background.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: size.width * 0.3,
              ),
              Stack(
                children: [
                  Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey[400],
                          child: image != null
                              ? Image.file(image!)
                              : Icon(
                                  FontAwesomeIcons.user,
                                  color: kWhite,
                                  size: size.width * 0.1,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Profil fotoğrafı seçiniz'),
                textColor: Colors.white,
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                    controller: kNameSur,
                  ),
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
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    textColor: Colors.red, // foreground
                    onPressed: () {
                      AuthenticationHelper()
                          .signUp(email: kEmail.text, password: kPassword.text)
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
                    child: Text('Register'),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: kBodyText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      'Login',
                      style: kBodyText.copyWith(
                          color: kWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
        ),
      ],
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
