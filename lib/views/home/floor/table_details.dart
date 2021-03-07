import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/views/home/edit_reservation.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class TableDetails extends StatelessWidget {
  final TableInfo tableItem;
  TableDetails(this.tableItem);
  final List<String> items = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes",
  ];
  Widget detailsItem(int index) {
    List values = [
      tableItem.member,
      tableItem.name,
      tableItem.mobile,
      tableItem.date,
      tableItem.time,
      tableItem.guests,
      tableItem.table,
      tableItem.notes,
    ];
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Row(
        children: [
          Container(
            width: size * 3,
            child: RegularText(
              text: items[index],
              size: f,
              color: greyColor06.withOpacity(0.5),
            ),
          ),
          SizedBox(width: size),
          SemiBoldText(
            text: values[index].toString(),
            color: greyColor06,
            size: f,
          ),
        ],
      ),
    );
  }

  final controller = Get.find<TableController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height / 1.6,
        color: whiteColor,
        width: Get.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size),
              color: Color(0xffF4F4F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumText(
                    text: "Reservation details",
                    size: a,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(0xffFF4C4D),
                    ),
                    onPressed: () => Get.close(1),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: size * 8,
                      width: size * 8,
                      color: Color(0xffF7F7F8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            tableItem.guests > 2 ? doubleTable : table,
                            height:
                                tableItem.guests > 2 ? size * 4 : size * 2.5,
                            color: tableItem.activated ? greenColor : blueGrey4,
                          ),
                          Positioned(
                            child: tableItem.activated
                                ? SvgPicture.asset(
                                    check,
                                    height: size * 2.5,
                                  )
                                : Text(''),
                            left: size * 0.5,
                            top: size * 1.5,
                          ),
                          RegularText(
                            text: tableItem.guests.toString(),
                            size: size * 1.8,
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ),
                    right: size,
                    top: size,
                  ),
                  ListView.builder(
                    itemCount: items.length,
                    padding: EdgeInsets.symmetric(horizontal: size),
                    itemBuilder: (context, index) {
                      return detailsItem(index);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: size * 3,
              padding: EdgeInsets.symmetric(horizontal: size),
              color: Color(0xffF4F4F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton(
                    label: "Cancel Reservation",
                    labelColor: redColor,
                    buttonColor: transparentColor,
                    onPressed: () {
                      controller.cancelling.value = true;
                    },
                  ),
                  controller.cancelling.value
                      ? ButtonBar(
                          children: [
                            customButton(
                              label: "Edit",
                              labelColor: blackColor,
                              buttonColor: transparentColor,
                              onPressed: () => Get.defaultDialog(
                                title: "",
                                content: EditReservation(),
                                radius: 0.0,
                                backgroundColor: Color(0xffF4F4F5),
                              ),
                              hasBorder: true,
                            ),
                            customButton(
                              label: "Start seating",
                              buttonColor: greenColor,
                              onPressed: () => Get.close(1),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            textField(
                              hint: "Reason of cancellation",
                              hintColor: Color(0xff353D48),
                              borderColor: Color(0xffB5C3D6),
                              hintSize: f,
                            ),
                            customButton(
                              label: "Cancel Reservation",
                              buttonColor: transparentColor,
                              labelColor: redColor,
                              borderColor: redColor,
                              onPressed: () => Get.close(1),
                            ),
                          ],
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
