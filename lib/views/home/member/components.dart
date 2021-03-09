import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/controllers/member.dart';
import 'package:texido_app/widgets/custom_button.dart';
import 'package:texido_app/widgets/custom_field.dart';
import 'package:texido_app/widgets/custom_text.dart';
import 'member_item.dart';

class SearchBar extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 5,
      color: darkBlueColor,
      padding: EdgeInsets.only(left: size, top: size * 1.2, bottom: size * 1.2),
      child: searchField(controller.searchController),
    );
  }

  Widget searchField(TextEditingController fieldController) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: textField(
                  hint: "Search member",
                  vertical: size,
                  filled: true,
                  errorText: true,
                  filledColor: whiteColor,
                  prefix: Icon(Icons.search, size: size * 1.5),
                  fieldController: fieldController,
                  onChanged: (newValue) {
                    controller.searchValidator.value = true;
                    controller.searchedMembers.clear();
                    if (newValue == "")
                      controller.searchedMembers.clear();
                    else {
                      controller.members.forEach((e) {
                        if ('${e.firstName} ${e.lastName}'
                            .toLowerCase()
                            .contains(newValue.toLowerCase()))
                          controller.searchedMembers.add(e);
                      });
                    }
                  },
                  validate: (newValue) {
                    if (controller.searchedMembers.isEmpty && newValue != "") {
                      return "";
                    }
                  },
                  autoValidate: controller.searchValidator.value,
                ),
              ),
              SizedBox(width: size),
              customButton(
                label: "+  Add",
                onPressed: () => controller.addMember.value = true,
                buttonColor: greenColor,
                height: Get.height,
                labelSize: a,
              ),
            ],
          ),
        ),
        Expanded(flex: 6, child: Container()),
      ],
    );
  }
}

class Members extends StatelessWidget {
  final List items;
  Members(this.items);
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Scrollbar(
        controller: scrollController,
        thickness: size * 0.5,
        isAlwaysShown: true,
        radius: Radius.circular(50.0),
        child: ListView.builder(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          padding: EdgeInsets.only(left: size, right: size * 1.5),
          itemBuilder: (context, index) {
            return MemberItem(items[index]);
          },
        ),
      ),
    );
  }
}

class AddMember extends StatelessWidget {
  final controller = Get.find<MemberController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: whiteColor,
        padding: EdgeInsets.symmetric(horizontal: size),
        margin: EdgeInsets.only(top: size, right: size * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size),
            SemiBoldText(
              text: "Personal Details",
              size: f,
              color: darkGrey01,
            ),
            SizedBox(height: size),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userImage(),
                  SizedBox(width: size * 1.5),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildItem(
                                "First Name",
                                "Enter first name",
                                controller.firstNameController,
                              ),
                              SizedBox(width: size * 0.5),
                              buildItem(
                                "Last Name",
                                "Enter last name",
                                controller.lastNameController,
                              ),
                              SizedBox(width: size * 0.5),
                              buildItem(
                                "Phone",
                                "Enter your phone",
                                controller.phoneController,
                              ),
                            ],
                          ),
                          SizedBox(height: size * 1.3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildDropButton(
                                  controller.membership,
                                  controller.membershipSelected.value,
                                  "Membership"),
                              SizedBox(width: size * 0.5),
                              buildDropButton(controller.gender,
                                  controller.genderSelected.value, "Gender"),
                              SizedBox(width: size * 0.5),
                              buildItem(
                                "Email",
                                "Enter email address",
                                controller.emailController,
                              ),
                            ],
                          ),
                          SizedBox(height: size * 1.3),
                          getDate("DBO", context),
                          SizedBox(height: size * 1.3),
                          buildItem(
                            "Notes",
                            "Leave your notes",
                            controller.noteController,
                          ),
                          SizedBox(height: size),
                          Divider(color: greyColor01.withOpacity(0.5)),
                          buttonBar(),
                        ],
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

  Widget buildItem(String text, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: text,
          size: f,
          color: darkGrey02,
        ),
        SizedBox(height: size * 0.5),
        Container(
          width: text != "Notes" ? size * 8.5 : Get.width,
          child: textField(
            vertical: text != "Notes" ? size * 0.8 : size * 1.5,
            hint: hint,
            filled: true,
            fieldController: controller,
            autoValidate: false,
            hintSize: f,
            filledColor: greyColor03,
            borderColor: borderColor02,
            hintColor: hintColor2,
          ),
        ),
      ],
    );
  }

  Widget buildDropButton(List<String> data, String value, String label) {
    final controller = Get.find<MemberController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: label,
          size: f,
          color: darkGrey02,
        ),
        SizedBox(height: size * 0.5),
        Container(
          width: size * 8.5,
          height: size * 2.2,
          padding: EdgeInsets.only(
              left: size,
              right: size * 0.5,
              top: size * 0.5,
              bottom: size * 0.5),
          decoration: BoxDecoration(
            color: greyColor03,
            border: Border.all(color: borderColor02),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: darkGrey03,
                size: size * 1.1,
              ),
              isExpanded: true,
              isDense: true,
              items: data
                  .map<DropdownMenuItem<String>>(
                    (item) => DropdownMenuItem(
                        child: Text(
                          item,
                          style: TextStyle(
                              color:
                                  (value == "Membership" || value == "Gender")
                                      ? greyColor01.withOpacity(0.5)
                                      : blackColor,
                              fontSize: e),
                        ),
                        value: item),
                  )
                  .toList(),
              onChanged: (newValue) {
                if (value == controller.membershipSelected.value)
                  controller.membershipSelected.value = newValue;
                else
                  controller.genderSelected.value = newValue;
              },
              value: value,
            ),
          ),
        ),
      ],
    );
  }

  Widget getDate(String label, BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText(
          text: label,
          size: f,
          color: darkGrey02,
        ),
        SizedBox(height: size * 0.5),
        Obx(
          () => GestureDetector(
            onTap: () => selectDate(context),
            child: Container(
              width: size * 8.5,
              padding: EdgeInsets.only(
                  left: size,
                  right: size * 0.5,
                  top: size * 0.5,
                  bottom: size * 0.5),
              decoration: BoxDecoration(
                color: greyColor03,
                border: Border.all(color: borderColor02),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.selectedDate.value != DateTime(2030, 1, 1)
                      ? Text(
                          '${controller.selectedDate.value.day} ${months[controller.selectedDate.value.month]} ${controller.selectedDate.value.year}',
                          style: TextStyle(fontSize: e),
                        )
                      : Text(
                          "Select DOB",
                          style: TextStyle(
                              color: hintColor2.withOpacity(0.5), fontSize: e),
                        ),
                  SvgPicture.asset(calendar, color: darkGrey03, height: size),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonBar() {
    final controller = Get.find<MemberController>();
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonBar(
        children: [
          customButton(
            label: "Cancel",
            labelColor: greenColor,
            onPressed: () {
              controller.addMember.value = false;
              controller.selectedDate.value = DateTime(2030, 1, 1);
              controller.imagePath.value = "";
              controller.clearControllers();
            },
            buttonColor: transparentColor,
            labelSize: e,
          ),
          customButton(
            label: "+ Add Member",
            onPressed: () {
              controller.addMemberToList();
              controller.clearControllers();
            },
            buttonColor: greenColor,
            height: size * 2.5,
            labelSize: e,
          ),
        ],
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final controller = Get.find<MemberController>();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    controller.selectedDate.value = picked;
  }

  Widget userImage() {
    final controller = Get.find<MemberController>();
    return GestureDetector(
      child: CircleAvatar(
        radius: size * 2.2,
        backgroundColor: greyColor01.withOpacity(0.3),
        child: controller.imagePath.value.isEmpty
            ? Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.person_outline,
                      color: greyColor02,
                      size: size * 2,
                    ),
                  ),
                  Positioned(
                    child: Icon(Icons.camera_alt_outlined,
                        color: greyColor02, size: size * 1.2),
                    top: size * 0.5,
                    right: size * 0.8,
                  ),
                ],
              )
            : CircleAvatar(
                radius: size * 2.2,
                backgroundImage: FileImage(File(controller.imagePath.value)),
              ),
      ),
      onTap: () => controller.uploadImage(),
    );
  }
}
