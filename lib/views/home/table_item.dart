import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/home.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/views/home/table_details.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'components.dart';
import 'edit_reservation.dart';

class TableItem extends StatefulWidget {
  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  List<Color> colors = List.filled(20, transparentColor);
  final controller = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              height: size * 5,
              color: darkBlueColor,
              padding: EdgeInsets.only(
                  left: size, top: size * 1.2, bottom: size * 1.2),
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
                      fieldController: controller.listSearchController.value,
                      onChanged: (newValue) {
                        controller.searchValidator.value = true;
                        controller.listSearchController.value.clear();
                        if (newValue == "")
                          controller.listSearchController.value.clear();
                        else {
                          controller.tables.forEach((e) {
                            if (e.name
                                .toLowerCase()
                                .contains(newValue.toLowerCase()))
                              controller.searchedList.add(e);
                          });
                        }
                      },
                      validate: (newValue) {
                        if (controller.searchedList.isEmpty && newValue != "") {
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: whiteColor,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: 20,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: greyColor02.withOpacity(0.2),
                            thickness: 1.0,
                          );
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                colors = List.filled(20, transparentColor);
                                colors[index] = greyColor02.withOpacity(0.2);
                              });
                            },
                            child: Container(
                              height: size * 4,
                              color: colors[index],
                              padding:
                                  EdgeInsets.symmetric(horizontal: size * 0.5),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: size * 3,
                                        width: size * 3,
                                        color: greyColor02.withOpacity(0.1),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "6:00",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: blackColor,
                                                  fontSize: size * 0.9),
                                            ),
                                            Text(
                                              "pm",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                  fontSize: size * 0.9),
                                            ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: greyColor02.withOpacity(0.2),
                                        thickness: 1.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: size * 2),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Saleam salman",
                                        style: TextStyle(
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: size * 0.9),
                                      ),
                                      SizedBox(height: size * 0.6),
                                      Text(
                                        "+966 123456789",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blackColor,
                                            fontSize: size * 0.9),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: size * 4),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gold Member",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blackColor,
                                            fontSize: size * 0.9),
                                      ),
                                      SizedBox(height: size * 0.6),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            tap4,
                                            height: size,
                                            color: blackColor,
                                          ),
                                          Text(
                                            "3-4",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: blackColor,
                                                fontSize: size * 0.9),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  // SizedBox(width: size * 4),
                                  Container(
                                    alignment: Alignment.center,
                                    height: size * 1.5,
                                    width: size * 5,
                                    child: Text(
                                      "TA-20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: blackColor,
                                          fontSize: size * 0.7),
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                  ),
                                  SizedBox(width: size * 0.5),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: size),
                  // Obx(
                  //   () => Expanded(
                  //     flex: 4,
                  //     child: controller.edit.value
                  //         ? EditReservation()
                  //         : TableDetails(),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
