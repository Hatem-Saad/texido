import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/home.dart';
import 'package:texido_app/views/home/grid/grid.dart';
import 'package:texido_app/views/home/table_item.dart';
import 'components.dart';
import 'floor/floor.dart';
import 'member/member.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(bottom: size),
              color: whiteColor,
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        tapItem("Floor", tap1, 0),
                        tapItem("Res.", tap2, 1),
                        tapItem("Grid", tap3, 2),
                      ],
                    ),
                    SizedBox(height: size * 14),
                    Column(
                      children: [
                        tapItem("Members", tap4, 3),
                        tapItem("Reports", tap6, 5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Obx(
              () => controller.category[1] == true
                  ? TableItem()
                  : controller.category[4] == true
                      ? TableItem()
                      : controller.category[2] == true
                          ? GridScreen()
                          : controller.category[0] == true
                              ? FloorScreen()
                              : Member(),
            ),
          ),
        ],
      ),
    );
  }
}
