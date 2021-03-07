import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/controllers/member.dart';
import 'components.dart';

class Member extends StatelessWidget {
  final controller = Get.put(MemberController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: blueGrey3,
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: controller.searchedMembers.isEmpty
                        ? Members(controller.members)
                        : controller.members.isEmpty
                            ? Center(child: Text("No Results"))
                            : Members(controller.searchedMembers),
                  ),
                  SizedBox(width: size),
                  Expanded(
                    flex: 6,
                    child:
                        controller.addMember.value ? AddMember() : Container(),
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
