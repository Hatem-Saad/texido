import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'components.dart';

class TableDetails extends StatelessWidget {
  List<String> items = [
    "Member",
    "Name",
    "Mobile",
    "Date",
    "Time",
    "Guests",
    "Table",
    "Notes",
  ];
  List<String> values = [
    "Gold membership",
    "Saleem salman",
    "+966 123456789",
    "Wed, 27 Jan 2021",
    "5:00 PM",
    "02",
    "Table 14",
    "Birthday party",
  ];
  Widget detailsItem(int index) {
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Row(
        children: [
          Container(
            width: size * 3,
            child: Text(
              items[index],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: greyColor02.withOpacity(0.5),
                fontSize: size * 0.9,
              ),
            ),
          ),
          SizedBox(width: size),
          Text(
            values[index],
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.bold,
              fontSize: size * 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget history() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size),
      child: Row(
        children: [
          Text(
            "Lana Doe",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: size * 0.9),
          ),
          SizedBox(width: size),
          Text(
            "Birthday Party 🎉.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: size * 0.9),
          ),
          Spacer(),
          Text(
            "Lana Doe",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: greyColor02.withOpacity(0.5),
                fontSize: size * 0.9),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 1.6,
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size * 2,
                    padding: EdgeInsets.symmetric(horizontal: size),
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
                            fontSize: size,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: Color(0xffFF4C4D),
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
                            color: greyColor02.withOpacity(0.1),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  table,
                                  height: size * 5,
                                ),
                                Positioned(
                                  child: SvgPicture.asset(
                                    check,
                                    height: size * 2.5,
                                  ),
                                  left: size * 0.5,
                                  top: size * 1.5,
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
                    height: size * 4,
                    padding: EdgeInsets.symmetric(horizontal: size),
                    decoration: BoxDecoration(
                      color: Color(0xffF4F4F5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        flatButton(
                          child: Text(
                            "Cancel Reservation",
                            style: TextStyle(
                              color: redColor,
                              fontSize: size,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: size * 2.2,
                          color: transparentColor,
                        ),
                        ButtonBar(
                          children: [
                            flatButton(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              height: size * 2.2,
                              hasBorder: true,
                              padding: true,
                              color: transparentColor,
                              width: size * 5,
                              label: "Edit",
                            ),
                            flatButton(
                              child: Text(
                                "Seated",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: size,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              height: size * 2.2,
                              color: greenColor,
                              width: size * 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size),
            Container(
              height: Get.height / 2.5,
              color: whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size * 2,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: size),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F4F5),
                    ),
                    child: Text(
                      "History",
                      style: TextStyle(
                        fontSize: size,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size),
                  history(),
                  SizedBox(height: size),
                  history(),
                  SizedBox(height: size),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add notes goes here",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: greyColor02.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size),
                      child: flatButton(
                        child: Text(
                          "Add notes",
                          style: TextStyle(
                            color: greenColor,
                            fontSize: size,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height: size * 2.2,
                        color: transparentColor,
                        width: size * 5,
                        hasBorder: true,
                      ),
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
