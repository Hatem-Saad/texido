import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';

class SemiBoldText extends StatelessWidget {
  String text;
  double size;
  Color color = blueGrey;
  SemiBoldText({this.text, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  String text;
  double size;
  Color color = blueGrey;
  MediumText({this.text, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class RegularText extends StatelessWidget {
  String text;
  double size;
  Color color = blackColor;
  RegularText({this.text, this.size, this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
