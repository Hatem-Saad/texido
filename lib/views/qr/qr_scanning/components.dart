import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/qr.dart';
import 'package:texido_app/widgets/custom_text.dart';

class QRBody extends StatelessWidget {
  final controller = Get.find<QRController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SemiBoldText(
          text: "Scan QR Code",
          color: whiteColor,
          size: c,
        ),
        MediumText(
          text: "Wednesday, Nov 20 2020",
          color: whiteColor.withOpacity(0.5),
          size: a,
        ),
        SizedBox(height: size * 2),
        qrButton(),
        SizedBox(height: size * 2),
        qrContainer(),
      ],
    );
  }

  Widget qrButton() {
    return MaterialButton(
      onPressed: () {
        Get.close(1);
        controller.scanQRCode();
      },
      child: RegularText(
        text: "Align QR Code/Barcode within\nFrame to scan",
        size: a,
        color: darkGrey03,
      ),
      color: whiteColor,
      elevation: 0.0,
      highlightElevation: 0.0,
      padding: EdgeInsets.symmetric(vertical: size * 1.5, horizontal: size * 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget qrContainer() {
    return Container(
      height: size * 12,
      width: size * 12,
      alignment: Alignment.center,
      color: blackColor.withOpacity(0.2),
      child: Container(
        height: size * 8,
        width: size * 8,
        padding: EdgeInsets.all(size),
        decoration: BoxDecoration(
          color: greyColor04,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SvgPicture.asset(qr, color: blackColor.withOpacity(0.3)),
      ),
    );
  }
}
