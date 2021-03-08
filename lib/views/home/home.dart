import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/home.dart';
import 'package:texido_app/views/home/grid/grid.dart';
import 'package:texido_app/views/home/table_item.dart';
import 'components.dart';
import 'floor/floor.dart';
import 'list/list_screen.dart';
import 'member/member.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Obx(
                  () => controller.category[1] == true
                      ? ListScreen()
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
        ],
      ),
    );
  }
}
