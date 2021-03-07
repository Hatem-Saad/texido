import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/home.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'components.dart';

class EditReservation extends StatelessWidget {
  final controller = Get.find<HomeController>();
  List<String> items = [
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
    return Row(
      children: [
        Container(
          width: size * 4,
          child: Text(
            val,
            style: TextStyle(
              color: greyColor02.withOpacity(0.5),
              fontSize: size * 0.9,
            ),
          ),
        ),
        val == "Member"
            ? Text(
                "Gold Member",
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.9,
                ),
              )
            : Expanded(child: customContainer(color: color, child: child)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF4F4F5),
      alignment: Alignment.topCenter,
      child: Container(
        height: size * 30,
        color: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size * 2,
                padding: EdgeInsets.symmetric(horizontal: size * 0.5),
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reservation details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size * 0.9,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: Color(0xffFF4C4D),
                    )
                  ],
                ),
              ),
              Container(
                height: Get.height / 1.5,
                padding: EdgeInsets.only(top: size),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(size * 0.5),
                        child: Column(
                          children: [
                            buildContainer(items[0], Text(''),
                                color: greyColor02.withOpacity(0.1)),
                            buildContainer(
                              items[1],
                              Text(
                                "Saleem Salman",
                                style: TextStyle(
                                  color: greyColor02,
                                  fontSize: size * 0.9,
                                ),
                              ),
                              color: greyColor02.withOpacity(0.1),
                            ),
                            buildContainer(
                              items[2],
                              Text(
                                "+966 123456789`",
                                style: TextStyle(
                                  color: greyColor02,
                                  fontSize: size * 0.9,
                                ),
                              ),
                              color: greyColor02.withOpacity(0.1),
                            ),
                            buildContainer(
                              items[3],
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.calendar_today),
                              ),
                            ),
                            buildContainer(
                              items[4],
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.access_time_outlined),
                              ),
                            ),
                            buildContainer(
                              items[5],
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.guestsNo.value.toString()),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child:
                                            Icon(Icons.remove_circle_outline),
                                        onTap: () =>
                                            controller.guestsNo.value--,
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.add_circle_outline),
                                        onTap: () =>
                                            controller.guestsNo.value++,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size),
                            Row(
                              children: [
                                Container(
                                  width: size * 4,
                                  child: Text(
                                    items[6],
                                    style: TextStyle(
                                      color: greyColor02.withOpacity(0.5),
                                      fontSize: size * 0.9,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Table",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size * 0.9,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: size),
                            Row(
                              children: [
                                Container(
                                  width: size * 4,
                                  child: Text(
                                    items[7],
                                    style: TextStyle(
                                      color: greyColor02.withOpacity(0.5),
                                      fontSize: size * 0.9,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: textField(hint: "Birthday party.")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: 8,
                        padding: EdgeInsets.symmetric(horizontal: size * 0.5),
                        itemBuilder: (context, index) {
                          Color color;
                          if (index == 0 || index == 1)
                            color = redColor;
                          else if (index == 2 || index == 3 || index == 4)
                            color = greyColor02;
                          else
                            color = greenColor;
                          return Row(
                            children: [
                              flatButton(
                                child: Text(
                                  "TA-20",
                                  style: TextStyle(
                                    color: color,
                                    fontSize: size * 0.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: color.withOpacity(0.1),
                              ),
                              SizedBox(width: size * 0.5),
                              Text(
                                "Reserved",
                                style: TextStyle(
                                  color: color,
                                  fontSize: size * 0.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    tap4,
                                    height: size,
                                    color: blackColor,
                                  ),
                                  SizedBox(width: size * 0.5),
                                  Text(
                                    "3-4",
                                    style: TextStyle(
                                      color: color,
                                      fontSize: size * 0.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size * 3,
                decoration: BoxDecoration(
                  color: Color(0xffF4F4F5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ButtonBar(
                  children: [
                    flatButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: size * 0.9,
                        ),
                      ),
                      color: transparentColor,
                      label: "Cancel",
                      hasBorder: true,
                      width: size * 4,
                    ),
                    SizedBox(width: size * 0.5),
                    flatButton(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: size * 0.9,
                        ),
                      ),
                      color: greenColor,
                      width: size * 4,
                    ),
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

Widget customContainer({Color color = whiteColor, Widget child}) {
  return Container(
    height: size * 2.5,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: size * 0.5),
    margin: EdgeInsets.only(top: size),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: greyColor02),
    ),
    child: child,
  );
}
