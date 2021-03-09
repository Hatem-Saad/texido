import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class NewReservation extends StatefulWidget {
  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  final controller = Get.find<TableController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController memberController = TextEditingController();

  final List<String> items = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes"
  ];

  Widget buildContainer(String val, Widget child, {Color color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: size * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size * 3,
            alignment: Alignment.centerLeft,
            child: RegularText(
              text: val,
              size: f,
              color: greyColor06.withOpacity(0.5),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  int table = 0;

  @override
  Widget build(BuildContext context) {
    List<int> activatedTables = [];
    controller.tables.forEach((e) {
      if (!e.activated) {
        activatedTables.add(e.table);
      }
    });
    memberController = TextEditingController(text: "None");
    var months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];
    String time = "";
    int guests = 00;
    return Container(
      height: Get.height / 1.3,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: size, right: size * 0.5),
      child: Container(
        height: Get.height / 1.3,
        color: blueGrey3,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size * 2.2,
                padding: EdgeInsets.symmetric(horizontal: size),
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumText(
                      text: "New Reservation",
                      color: greyColor06,
                      size: a,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.close,
                        size: size * 1.5,
                        color: Color(0xffFF4C4D),
                      ),
                      onTap: () => controller.newReservation.value = false,
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height / 1.5,
                color: whiteColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(top: size, left: size),
                        child: Column(
                          children: [
                            buildContainer(
                              items[0],
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RegularText(
                                  text: "None",
                                  size: f,
                                  color: greyColor06,
                                ),
                              ),
                            ),
                            buildContainer(
                              items[1],
                              textField(
                                fieldController: nameController,
                                autoValidate: false,
                                vertical: size * 0.7,
                                hintSize: e,
                                hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                                borderColor: borderColor02,
                              ),
                            ),
                            buildContainer(
                              items[2],
                              textField(
                                fieldController: mobileController,
                                autoValidate: false,
                                vertical: size * 0.7,
                                hintSize: e,
                                hintColor: Color(0xffA2A2A2).withOpacity(0.4),
                                borderColor: borderColor02,
                              ),
                              color: greyColor02.withOpacity(0.1),
                            ),
                            buildContainer(
                              items[3],
                              GestureDetector(
                                onTap: () async {
                                  await controller.pickDate(
                                      context, DateTime.now());
                                },
                                child: Container(
                                  height: size * 2.3,
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: size),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(color: borderColor02),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RegularText(
                                        text:
                                            "${controller.pickedDate.value.day} ${months[controller.pickedDate.value.month]} ${controller.pickedDate.value.year}",
                                        color: greyColor06,
                                        size: f,
                                      ),
                                      SvgPicture.asset(calendar,
                                          height: size * 1.1),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildContainer(
                              items[4],
                              GestureDetector(
                                onTap: () async {
                                  await controller.pickTime(context);
                                },
                                child: Container(
                                  height: size * 2.3,
                                  alignment: Alignment.centerRight,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: size),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(color: borderColor02),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RegularText(
                                        text: controller.pickedTime.value
                                            .format(context)
                                            .toString(),
                                        color: greyColor06,
                                        size: f,
                                      ),
                                      SvgPicture.asset(clock,
                                          height: size * 1.1,
                                          color: greyColor06),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildContainer(
                              items[5],
                              Container(
                                height: size * 2.3,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: size),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  border: Border.all(color: borderColor02),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RegularText(
                                      text: guests.toString(),
                                      color: greyColor06,
                                      size: f,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: SvgPicture.asset(minus,
                                              height: size * 1.1,
                                              color: greyColor06),
                                          onTap: () {
                                            if (guests > 1) guests--;
                                          },
                                        ),
                                        SizedBox(width: size * 0.5),
                                        GestureDetector(
                                            child: SvgPicture.asset(plus,
                                                height: size * 1.1,
                                                color: greyColor06),
                                            onTap: () {
                                              controller
                                                  .tables[
                                                      controller.index.value]
                                                  .guests++;
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size),
                            buildContainer(
                              items[6],
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RegularText(
                                  text: "Table $table",
                                  size: f,
                                  color: greyColor06,
                                ),
                              ),
                            ),
                            SizedBox(height: size),
                            buildContainer(
                              items[7],
                              textField(
                                fieldController: noteController,
                                autoValidate: false,
                                vertical: size,
                                hintSize: e,
                                hintColor: Color(0xffA2A2A2),
                                borderColor: borderColor02,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: size),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Color(0xffF4F4F5).withOpacity(0.4),
                        padding: EdgeInsets.only(top: size, left: size * 0.5),
                        child: ListView.builder(
                          itemCount: activatedTables.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: size * 0.5),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: size),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    table = activatedTables[index];
                                  });
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: size * 1.8,
                                        width: size * 3.5,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: greenColor.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        child: SemiBoldText(
                                          text: "TA-${activatedTables[index]}",
                                          size: f,
                                          color: greenColor,
                                        ),
                                      ),
                                      SizedBox(width: size * 0.5),
                                      MediumText(
                                        text: "Available",
                                        size: f,
                                        color: greenColor,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            tap4,
                                            height: size * 0.9,
                                            color: greenColor,
                                          ),
                                          SizedBox(width: size * 0.5),
                                          MediumText(
                                            text: controller
                                                        .tables[index].guests <=
                                                    2
                                                ? "1-2"
                                                : "3-4",
                                            size: f,
                                            color: greenColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size * 3.2,
                decoration: BoxDecoration(color: Color(0xffF4F4F5)),
                child: ButtonBar(
                  children: [
                    customButton(
                      label: "Cancel",
                      labelColor: darkGrey03,
                      buttonColor: transparentColor,
                      borderColor: darkGrey03,
                      labelSize: e,
                      onPressed: () => controller.newReservation.value = false,
                      hasBorder: true,
                    ),
                    SizedBox(width: size * 0.5),
                    customButton(
                        label: "Reserve",
                        labelColor: whiteColor,
                        buttonColor: greenColor,
                        labelSize: e,
                        onPressed: () {
                          controller.tables.add(
                            TableInfo(
                              member: "Golden membership",
                              name: nameController.text,
                              mobile: mobileController.text,
                              date: DateTime.now(),
                              // date: DateTime.parse(
                              //     "${controller.pickedDate.value.day} ${months[controller.pickedDate.value.month]} ${controller.pickedDate.value.year}"),
                              time: time,
                              guests: guests,
                              table: table,
                              notes: [noteController.text],
                              activated: false,
                            ),
                          );
                          controller.newReservation.value = false;
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
