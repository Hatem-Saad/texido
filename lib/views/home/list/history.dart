import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/table.dart';
import 'package:texido_app/models/table.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';

class History extends StatelessWidget {
  TextEditingController noteController = TextEditingController();
  final controller = Get.find<TableController>();
  final TableInfo table;
  History(this.table);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.5,
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size * 2.2,
            padding: EdgeInsets.symmetric(horizontal: size),
            width: Get.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xffF4F4F5),
            ),
            child: MediumText(
              text: "History",
              size: a,
              color: greyColor06,
            ),
          ),
          SizedBox(height: size),
          Expanded(
            child: ListView.builder(
              itemCount: table.notes.length,
              itemBuilder: (context, index) {
                return item(userName: table.name, note: table.notes[index]);
              },
            ),
          ),
          SizedBox(height: size),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size),
            child: textField(
              fieldController: noteController,
              hint: "Add notes goes here",
              vertical: size * 1.5,
              autoValidate: false,
              hintSize: f,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: size),
            child: customButton(
              label: "Add notes",
              labelColor: greenColor,
              buttonColor: transparentColor,
              borderColor: greenColor,
              labelSize: e,
              onPressed: () {
                table.notes.add(noteController.text);
                controller.edit.value = false;
              },
              hasBorder: true,
              height: size * 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget item({String userName, String note}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size),
      child: Row(
        children: [
          MediumText(
            text: userName,
            color: greyColor06,
            size: f,
          ),
          SizedBox(width: size),
          RegularText(
            text: note,
            color: greyColor06,
            size: f,
          ),
          Spacer(),
          RegularText(
            text: "5:00 PM, 27 Jan 2021",
            color: greyColor06.withOpacity(0.4),
            size: f,
          ),
        ],
      ),
    );
  }
}
