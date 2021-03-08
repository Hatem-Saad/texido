import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/views/home/floor/table_details.dart';
import 'package:texido_app/widgets/custom_text.dart';

class FloorItem extends StatelessWidget {
  final TableInfo tableItem;
  FloorItem(this.tableItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Get.dialog(
          Material(
            child: Container(
              color: blackColor.withOpacity(0.7),
              child: TableDetails(tableItem),
            ),
          ),
        ),
        // onTap: () => Get.defaultDialog(
        //   title: "",
        //   content: TableDetails(tableItem),
        //   radius: 0.0,
        //   backgroundColor: blackColor.withOpacity(0.7),
        // ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              tableItem.guests > 2 ? doubleTable : table,
              height: tableItem.guests > 2 ? size * 4 : size * 2.5,
              color: tableItem.activated ? greenColor : blueGrey4,
            ),
            RegularText(
              text: tableItem.table.toString(),
              size: a,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
