import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/table.dart';
import 'floor_item.dart';

class FloorScreen extends StatelessWidget {
  final controller = Get.find<TableController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GridView.count(
          crossAxisCount: 10,
          childAspectRatio: 0.9,
          mainAxisSpacing: size,
          crossAxisSpacing: size,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: size, right: size * 6),
          children: List.generate(
            controller.tables.length,
            (index) {
              return FloorItem(controller.tables[index]);
            },
          ),
        ),
        Positioned(
          right: size,
          child: Container(
            decoration: BoxDecoration(
                color: blueGrey4,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )),
            child: SvgPicture.asset(gate),
          ),
        )
      ],
    );
  }
}
