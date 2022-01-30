import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitaplik1/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(image: 'assets/images/white_background.jpg'),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Profilim'),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Icon(Icons.menu)),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "   Takipçi       ||      Takip Edilen",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "200",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "250",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                          radius: 50,
                        )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () => pickImage(),
                child: Text(
                  'Profil Fotoğrafımı Değiştir',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Erdem Buzluk",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Mamak,Ankara",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const RoundedButton(
                  buttonName: 'Arkadaş Ekle',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
