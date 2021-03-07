import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/qr.dart';
import 'components.dart';

class QRScanning extends StatelessWidget {
  final controller = Get.put(QRController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: QRBody(),
      ),
    );
  }
}
