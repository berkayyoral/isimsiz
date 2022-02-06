import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitaplik1/classes/authentication.dart';
import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/classes/firebase_api.dart';
import 'package:kitaplik1/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:io' as io;
import 'package:uuid/uuid.dart';

import '../renkler.dart';
import 'main_page.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  FirebaseApi firebaseApi = new FirebaseApi();

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
                      uploadImageToFirebase(context);
                      /* AuthenticationHelper()
                          .signUp(email: kEmail.text, password: kPassword.text)
                          .then((result) {
                        if (result == null) {
                          Map<String, dynamic> userInfoMap = {
                            "name": kNameSur.text,
                             "url": dowurl,
                            /*"urlAvatar": image != null
                                ? Image.file(image!)
                                : 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Andrea_Appiani_Napoleon_K%C3%B6nig_von_Rom.jpg',*/
                            //lastMessageTime: DateTime.now(),
                          };

                          FirebaseApi.uploadUserInfo(userInfoMap);

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
                      });*/
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

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(image!.path);
    Reference ref =
        FirebaseStorage.instance.ref().child('uploads').child('/$fileName');

    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    UploadTask uploadTask;
    //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    uploadTask = ref.putFile(File(image!.path));

    UploadTask task = await Future.value(uploadTask);
    Future.value(uploadTask)
        .then((value) => {print("Upload file path ${value.ref.fullPath}")})
        .onError((error, stackTrace) =>
            {print("Upload file path error ${error.toString()} ")});

    var dowurl = (await ref.getDownloadURL()).toString();
    var uuid = Uuid();

    //return dowurl;

    AuthenticationHelper()
        .signUp(email: kEmail.text, password: kPassword.text)
        .then((result) {
      if (result == null) {
        Map<String, dynamic> userInfoMap = {
          "name": kNameSur.text,
          "url": dowurl,
          "uid": uuid.v1(),
          "lastMessageTime": DateTime.now(),
        };

        FirebaseApi.uploadUserInfo(userInfoMap);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            result,
            style: TextStyle(fontSize: 16),
          ),
        ));
      }
    });
    //await FirebaseFirestore.instance.collection("users").add({"url": dowurl});
  }
}
