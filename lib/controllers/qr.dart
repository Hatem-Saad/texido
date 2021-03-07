import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/views/qr/qr_verified/qr_verified.dart';
import 'package:texido_app/widgets/custom_text.dart';

class QRController extends GetxController {
  RxBool scanned = false.obs;
  String qrCode = "unknown";

  Future<void> scanQRCode() async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#35A900", "Cancel", false, ScanMode.QR);
    if (this.qrCode == qrCode)
      Get.dialog(
        QRVerified(),
        barrierColor: blackColor.withOpacity(0.8),
      );
    else {
      Get.defaultDialog(
        title: "",
        content: Column(
          children: [
            CircleAvatar(
              radius: size * 1.8,
              backgroundColor: redColor,
              child: Icon(Icons.close, color: whiteColor, size: size * 1.3),
            ),
            SizedBox(height: size),
            MediumText(
              text: "Wrong code",
              color: whiteColor,
            ),
          ],
        ),
        backgroundColor: blackColor.withOpacity(0.2),
      );
    }
  }
}
