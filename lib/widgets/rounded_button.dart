


import 'package:flutter/material.dart';


import '../renkler.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.8,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(16), color: kWhite),
        child: Center(
          child: Text(
            buttonName,
            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      );
  }
}
