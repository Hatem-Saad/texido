import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/home.dart';
import 'package:texido_app/views/qr/qr_scanning/qr_scanning.dart';
import 'package:texido_app/widgets/custom_text.dart';

Widget tapItem(label, String icon, int index) {
  final controller = Get.find<HomeController>();
  return GestureDetector(
    onTap: () {
      for (int i = 0; i < controller.category.length; ++i)
        controller.category[i] = false;
      controller.category[index] = true;
    },
    child: Obx(
      () => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size * 4.5,
              width: size * 0.3,
              color: controller.category[index] ? redColor : transparentColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  height: size * 1.3,
                  color: controller.category[index] ? redColor : blackColor,
                ),
                SizedBox(height: size * 0.5),
                RegularText(
                  text: label,
                  size: a,
                  color: controller.category[index] ? redColor : darkGrey03,
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    ),
  );
}

Widget appBar() {
  List<String> items = ["Karem Doe", "Samer Doe", "Faris Doe"];
  final controller = Get.find<HomeController>();
  return AppBar(
    toolbarHeight: size * 4,
    backgroundColor: whiteColor,
    elevation: 1.0,
    leading: SvgPicture.asset(logeIcon),
    title: Container(
      width: size * 9,
      height: size * 2.2,
      padding: EdgeInsets.symmetric(horizontal: size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: redColor),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(calendar, color: redColor, height: size * 1.2),
          SizedBox(width: size * 0.5),
          RegularText(
            text: "Tue Jan 2021",
            size: a,
            color: redColor,
          ),
        ],
      ),
    ),
    centerTitle: true,
    actions: [
      SvgPicture.asset(notification, height: size * 1.2),
      Align(
        alignment: Alignment.center,
        child: flatButton(
          child: SvgPicture.asset(qrIcon, height: size),
          color: blueGrey2.withOpacity(0.2),
          height: size * 2.2,
          width: size * 2,
          onPressed: () => Get.dialog(
            QRScanning(),
            barrierColor: blackColor.withOpacity(0.7),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          flatButton(
            child: Row(
              children: [
                SizedBox(width: size * 0.5),
                Icon(Icons.add, color: whiteColor, size: size),
                SizedBox(width: size * 0.5),
                RegularText(
                  text: "New Reservation",
                  size: a,
                  color: whiteColor,
                ),
                SizedBox(width: size * 0.5),
              ],
            ),
            height: size * 2.2,
            color: greenColor,
            label: "New Reservation",
            onPressed: () {},
          ),
        ],
      ),
      SizedBox(width: size * 0.5),
      CircleAvatar(
        backgroundImage: NetworkImage(
            "https://dq1eylutsoz4u.cloudfront.net/2016/12/07190305/not-so-nice-nice-guy.jpg"),
        radius: size * 1.2,
      ),
      SizedBox(width: size * 0.5),
      Center(
        child: DropdownButtonHideUnderline(
          child: Obx(
            () => DropdownButton(
              icon: Icon(Icons.keyboard_arrow_down,
                  color: blackColor01, size: size * 1.5),
              value: controller.selected.value,
              dropdownColor: Colors.grey[200],
              items: items
                  .map<DropdownMenuItem<String>>(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: MediumText(
                        text: value,
                        size: a,
                        color: blackColor01,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                controller.selected.value = newValue;
              },
            ),
          ),
        ),
      )
    ],
  );
}

Widget flatButton(
    {Widget child,
    double height,
    bool padding = false,
    bool hasBorder = false,
    String label = "",
    double width,
    Function onPressed,
    Color color = primaryColor}) {
  final controller = Get.find<HomeController>();
  return FlatButton(
    padding: padding ? EdgeInsets.all(size * 0.6) : EdgeInsets.all(0.0),
    onPressed: onPressed,
    // onPressed: () {
    //   if (label == "Edit")
    //     controller.edit.value = !controller.edit.value;
    //   else if (label == "Cancel")
    //     controller.edit.value = !controller.edit.value;
    //   else if (label == "New Reservation")
    //     Get.dialog(
    //       QRScanning(),
    //       barrierColor: blackColor.withOpacity(0.7),
    //     );
    // },
    child: child,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    height: height,
    minWidth: width,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(color: hasBorder ? blackColor : transparentColor),
    ),
  );
}
