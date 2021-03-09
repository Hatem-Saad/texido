import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class SearchBar extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: size * 5,
        color: darkBlueColor,
        padding:
            EdgeInsets.only(left: size, top: size * 1.2, bottom: size * 1.2),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: textField(
                hint: "Search Guest",
                vertical: size,
                filled: true,
                errorText: true,
                filledColor: whiteColor,
                prefix: Icon(Icons.search, size: size * 1.5),
                fieldController: controller.searchController.value,
                onChanged: (newValue) {
                  controller.searchValidator.value = true;
                  controller.searched4AMGuests.clear();
                  controller.searched5AMGuests.clear();
                  controller.searched6AMGuests.clear();
                  if (newValue == "") {
                    controller.searched4AMGuests.clear();
                    controller.searched5AMGuests.clear();
                    controller.searched6AMGuests.clear();
                  } else {
                    controller.tables.forEach(
                      (e) {
                        if (e.name
                            .toLowerCase()
                            .contains(newValue.toLowerCase())) {
                          if (e.time == "4:00 AM")
                            controller.searched4AMGuests.add(e);
                          else if (e.time == "5:00 AM")
                            controller.searched5AMGuests.add(e);
                          else
                            controller.searched6AMGuests.add(e);
                        }
                      },
                    );
                  }
                },
                validate: (newValue) {
                  if (controller.searched4AMGuests.isEmpty &&
                      controller.searched5AMGuests.isEmpty &&
                      controller.searched6AMGuests.isEmpty &&
                      newValue != "") {
                    return "";
                  }
                },
                autoValidate: controller.searchValidator.value,
              ),
            ),
            SizedBox(width: size * 2),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  customButton(
                      label: "Arrived (5)",
                      labelSize: e,
                      buttonColor: whiteColor,
                      labelColor: controller.selected[0]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        controller.selected.value = List.filled(3, false);
                        controller.selected[0] = true;
                        controller.getTablesData();
                      }),
                  SizedBox(width: size * 0.8),
                  customButton(
                      label: "Seated (12)",
                      labelSize: e,
                      buttonColor: whiteColor,
                      labelColor: controller.selected[1]
                          ? redColor
                          : blackColor03.withOpacity(0.5),
                      onPressed: () {
                        controller.selected.value = List.filled(3, false);
                        controller.selected[1] = true;
                        controller.getTablesData();
                      }),
                  SizedBox(width: size * 0.8),
                  customButton(
                    label: "Upcoming (3)",
                    labelSize: e,
                    buttonColor: whiteColor,
                    labelColor: controller.selected[2]
                        ? redColor
                        : blackColor03.withOpacity(0.5),
                    onPressed: () {
                      controller.selected.value = List.filled(3, false);
                      controller.selected[2] = true;
                      controller.getTablesData();
                    },
                  ),
                  SizedBox(width: size * 0.8),
                  Container(
                    height: Get.height,
                    padding: EdgeInsets.all(size * 0.7),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RegularText(
                          text: "Reservation time",
                          size: e,
                          color: darkGrey03,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: darkGrey03,
                          size: size * 1.3,
                        )
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
