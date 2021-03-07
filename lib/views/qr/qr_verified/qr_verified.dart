import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'components.dart';

class QRVerified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SemiBoldText(
              text: "Member Reservation confirmed",
              size: c,
              color: whiteColor,
            ),
            SizedBox(height: size * 3),
            Container(
              height: size * 24,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: size * 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size * 2.8),
                    child: Container(
                      color: whiteColor,
                      child: Column(
                        children: [
                          UserInfo(),
                          SizedBox(height: size),
                          ScanningData(),
                        ],
                      ),
                    ),
                  ),
                  UserImage(),
                ],
              ),
            ),
            SizedBox(height: size * 1.5),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
