import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texido_app/models/member.dart';

class MemberController extends GetxController {
  RxList<String> gender = ["Gender", "Male", "Female"].obs;
  RxList<String> membership = ["Membership", "Gold", "Sliver", "Bronze"].obs;
  RxList<MemberInfo> members = List<MemberInfo>().obs;
  RxList<MemberInfo> searchedMembers = List<MemberInfo>().obs;
  RxString genderSelected = "".obs;
  RxString membershipSelected = "".obs;
  RxBool addMember = false.obs;
  RxBool searchValidator = false.obs;
  RxString imagePath = "".obs;
  Rx<DateTime> selectedDate = DateTime(2030, 1, 1).obs;
  final picker = ImagePicker();

  // fields controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  Future<void> getMemberData() {
    for (int i = 0; i < 10; ++i) {
      members.add(
        MemberInfo(
          image: imagePath.value,
          firstName: faker.person.firstName(),
          lastName: faker.person.lastName(),
          phone: "123456789",
          membership: "Gold membership",
          gender: "male",
          email: faker.internet.email(),
          date: faker.date.toString(),
          notes: "your note",
        ),
      );
    }
  }

  Future<void> addMemberToList() {
    members.insert(
      0,
      MemberInfo(
        image: imagePath.value,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        membership: membershipSelected.value + " membership",
        gender: genderSelected.value,
        email: emailController.text,
        date: selectedDate.value.toString(),
        notes: noteController.text,
      ),
    );
    addMember.value = false;
    selectedDate.value = DateTime(2030, 1, 1);
    imagePath.value = "";
  }

  Future<void> uploadImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    imagePath.value = pickedFile.path;
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    noteController.clear();
    searchController.clear();
  }

  @override
  void onInit() {
    genderSelected.value = gender[0];
    membershipSelected.value = membership[0];
    getMemberData();
    super.onInit();
  }
}
