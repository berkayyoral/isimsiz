import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kitaplik1/widgets/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(image: 'assets/images/white_background.jpg'),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Profile'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Container(
                  alignment: const Alignment(0.0, 2.5),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    radius: 30,
                  ),
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
              const Card(
                margin: EdgeInsets.all(15.0),
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Arkadaş Ekle",
                    style: TextStyle(
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Takipçi       ||      Takip Edilen",
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
                                  color: Colors.blueAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 7,),
                          ],
                        ),
                      ),
                      Expanded(child: Column(
                        children: const [
                          Text("250", style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                          ),)
                        ],
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
