import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';

Widget textField({
  String hint,
  double hintSize,
  TextEditingController fieldController,
  bool filled = false,
  Color filledColor = greyColor01,
  Color borderColor = borderColor01,
  Color hintColor = hintColor,
  bool obscureText = false,
  Widget prefix,
  Widget suffix,
  double vertical,
  Function validate,
  Function onChanged,
  Function onSubmit,
  bool enabled = false,
  bool autoValidate,
  bool errorText = false,
}) {
  return TextFormField(
    controller: fieldController,
    obscureText: obscureText,
    readOnly: enabled,
    style: TextStyle(
      color: hintColor,
      fontSize: hintSize != null ? e : c,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      isDense: true,
      contentPadding:
          EdgeInsets.symmetric(vertical: vertical, horizontal: size),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(6.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(6.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: redColor),
        borderRadius: BorderRadius.circular(6.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: redColor),
        borderRadius: BorderRadius.circular(6.0),
      ),
      filled: filled ? true : false,
      fillColor: filledColor == whiteColor ? filledColor : filledColor,
      hintText: hint,
      hintStyle: TextStyle(
          color: hintColor.withOpacity(0.5),
          fontSize: hintSize != null ? f : b),
      prefixIcon: prefix,
      suffixIcon: suffix,
      errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: size * 0.9,
          height: errorText ? 0.0 : null),
    ),
    autovalidateMode:
        autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
    validator: validate,
    onChanged: onChanged,
    onFieldSubmitted: onSubmit,
  );
}
