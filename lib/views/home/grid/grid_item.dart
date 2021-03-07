import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_text.dart';

class GridItem extends StatelessWidget {
  final List<TableInfo> items;
  GridItem(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (items[index].activated == true)
            return SizedBox(
              height: size * 9,
              child: Card(
                elevation: 0.0,
                color: blueGrey2.withOpacity(0.1),
                margin: EdgeInsets.only(bottom: size, left: size),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size, vertical: size),
                  child: Row(
                    children: [
                      Container(
                        height: size * 3,
                        width: size * 3,
                        decoration: BoxDecoration(
                          color: blueGrey2.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SemiBoldText(
                              text: items[index].time,
                              color: darkGrey03,
                              size: f,
                            ),
                            SemiBoldText(
                              text: "pm",
                              color: darkGrey03,
                              size: size * 0.4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: size * 2),
                      Divider(
                          color: blackColor02.withOpacity(0.05), thickness: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText(
                            text: items[index].name,
                            size: a,
                            color: darkGrey04,
                          ),
                          SizedBox(height: size * 0.5),
                          MediumText(
                            text: items[index].mobile,
                            size: f,
                            color: darkGrey04,
                          ),
                          SizedBox(height: size * 0.5),
                          MediumText(
                            text: items[index].member,
                            size: f,
                            color: darkGrey04,
                          ),
                          SizedBox(height: size * 0.5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                tap4,
                                height: size,
                                color: darkGrey04,
                              ),
                              MediumText(
                                text: "3-4",
                                size: f,
                                color: darkGrey04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          else
            return SizedBox(
              height: size * 9,
              child: Card(
                elevation: 0.0,
                color: whiteColor,
                margin: EdgeInsets.only(bottom: size, left: size),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size, vertical: size),
                  child: Row(
                    children: [
                      Container(
                        height: size * 2.5,
                        width: size * 4,
                        decoration: BoxDecoration(
                          color: greyColor02.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SemiBoldText(
                              text: "TA-30",
                              color: darkGrey03,
                              size: f,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: size),
                      Row(
                        children: [
                          MediumText(
                            text: "Main room",
                            size: f,
                            color: darkGrey04,
                          ),
                          SizedBox(width: size),
                          Row(
                            children: [
                              SvgPicture.asset(
                                tap4,
                                height: size * 0.8,
                                color: darkGrey04,
                              ),
                              SizedBox(width: size * 0.5),
                              MediumText(
                                text: "3-4",
                                size: f,
                                color: darkGrey04,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
        });
  }
}
