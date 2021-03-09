import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/grid/grid.dart';
import 'package:texido_app/views/home/table_item.dart';
import 'components.dart';
import 'floor/floor.dart';
import 'list/list_screen.dart';
import 'member/member.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: Stack(
          children: [
            Container(
              width: size * 5.5,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      tapItem("Floor", tap1, 0),
                      tapItem("Res.", tap2, 1),
                      tapItem("Grid", tap3, 2),
                    ],
                  ),
                  Column(
                    children: [
                      tapItem("Members", tap4, 3),
                      tapItem("Reports", tap6, 5),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(width: size * 5.5),
                VerticalDivider(width: 0.0),
                Expanded(
                  child: controller.category[1] == true
                      ? ListScreen()
                      : controller.category[2] == true
                          ? GridScreen()
                          : controller.category[3] == true
                              ? Member()
                              : controller.category[0] == true
                                  ? FloorScreen()
                                  : Center(child: Text("Under Development")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
