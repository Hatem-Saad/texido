import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.5,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size * 2,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: size),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F5),
            ),
            child: MediumText(
              text: "History",
              size: a,
              color: greyColor06,
            ),
          ),
          SizedBox(height: size),
          item(),
          SizedBox(height: size),
          item(),
          SizedBox(height: size),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size),
            child: textField(
              hint: "Add notes goes here",
              vertical: size * 1.5,
              autoValidate: false,
              hintSize: f,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: size),
            child: customButton(
              label: "Add notes",
              labelColor: greenColor,
              buttonColor: transparentColor,
              borderColor: greenColor,
              labelSize: e,
              onPressed: () {},
              hasBorder: true,
              height: size * 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget item() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size),
      child: Row(
        children: [
          MediumText(
            text: "Lana Doe",
            color: greyColor06,
            size: f,
          ),
          SizedBox(width: size),
          RegularText(
            text: "Birthday Party 🎉.",
            color: greyColor06,
            size: f,
          ),
          Spacer(),
          RegularText(
            text: "5:00 PM, 27 Jan 2021",
            color: greyColor06.withOpacity(0.4),
            size: f,
          ),
        ],
      ),
    );
  }
}
