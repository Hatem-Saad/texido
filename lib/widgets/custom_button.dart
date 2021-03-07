import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';

Widget customButton({
  String label,
  bool hasBorder = false,
  Color labelColor = whiteColor,
  Color borderColor = blackColor,
  Color buttonColor = greenColor,
  double height,
  double labelSize,
  Function onPressed,
}) {
  return FlatButton(
    padding: EdgeInsets.symmetric(horizontal: size, vertical: 0.0),
    onPressed: onPressed,
    child: RegularText(
      text: label,
      size: labelSize,
      color: labelColor,
    ),
    height: height,
    color: buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0),
      side: BorderSide(color: hasBorder ? borderColor : transparentColor),
    ),
  );
}
