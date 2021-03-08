import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'search_bar.dart';
import 'grid_item.dart';

class GridScreen extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: blueGrey3,
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "4:00 AM",
                          size: a,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: controller.searched4AMGuests.isEmpty
                              ? GridItem(controller.tables4AM)
                              : GridItem(controller.searched4AMGuests),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: greyColor01.withOpacity(0.5)),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "5:00 AM",
                          size: a,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: controller.searched5AMGuests.isEmpty
                              ? GridItem(controller.tables5AM)
                              : GridItem(controller.searched5AMGuests),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: greyColor01.withOpacity(0.5)),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: size * 0.5),
                        RegularText(
                          text: "6:00 AM",
                          size: a,
                          color: greyColor07,
                        ),
                        SizedBox(height: size * 0.5),
                        Expanded(
                          child: controller.searched6AMGuests.isEmpty
                              ? GridItem(controller.tables6AM)
                              : GridItem(controller.searched6AMGuests),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
