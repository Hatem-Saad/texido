import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/floor/table_details.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import '../edit_reservation.dart';
import 'list_details.dart';
import 'list_item.dart';
import 'search_bar.dart';

class ListScreen extends StatelessWidget {
  final controller = Get.put(TableController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueGrey3,
      child: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: whiteColor,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 20,
                      separatorBuilder: (context, index) {
                        return Divider(
                            color: blackColor02.withOpacity(0.05),
                            thickness: 1.5);
                      },
                      itemBuilder: (context, index) {
                        return controller.searchedList.isEmpty
                            ? ListItem(
                                controller.tables[index],
                                index,
                              )
                            : ListItem(
                                controller.searchedList[index],
                                index,
                              );
                      },
                    ),
                  ),
                ),
                SizedBox(width: size),
                Obx(
                  () => Expanded(
                    flex: 4,
                    child: controller.edit.value
                        ? EditReservation()
                        : ListDetails(
                            controller.tables[controller.index.value]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
