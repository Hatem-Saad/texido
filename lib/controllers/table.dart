import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texido_app/models/table.dart';

class TableController extends GetxController {
  List<TableInfo> tables = List<TableInfo>();
  RxList<TableInfo> tables4AM = List<TableInfo>().obs;
  RxList<TableInfo> tables5AM = List<TableInfo>().obs;
  RxList<TableInfo> tables6AM = List<TableInfo>().obs;
  RxList<bool> selected = [true, false, false].obs;
  RxString selectedUser = "Karem Doe".obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<TableInfo> searched4AMGuests = List<TableInfo>().obs;
  RxList<TableInfo> searched5AMGuests = List<TableInfo>().obs;
  RxList<TableInfo> searched6AMGuests = List<TableInfo>().obs;
  RxBool searchValidator = false.obs;
  RxBool cancelling = false.obs;
  RxBool newReservation = false.obs;
  RxList<bool> category = [false, true, false, false, false, false].obs;

  // Res.
  Rx<TextEditingController> listSearchController = TextEditingController().obs;
  RxList<TableInfo> searchedList = List<TableInfo>().obs;
  RxBool edit = false.obs;
  RxList<bool> colorList = List<bool>().obs;
  RxInt index = 0.obs;
  Rx<DateTime> pickedDate = DateTime.now().obs;
  Rx<TimeOfDay> pickedTime = TimeOfDay.now().obs;

  void getTablesData() {
    tables.clear();
    String time;
    bool activated;
    int guests;
    for (int i = 0; i < 50; ++i) {
      if (i < 10)
        time = "4:00 AM";
      else if (i < 20)
        time = "5:00 AM";
      else
        time = "6:00 AM";
      if (i == 2 || i == 7 || i == 12 || i == 15)
        activated = false;
      else
        activated = true;
      if (i > 30)
        guests = 04;
      else
        guests = 02;
      tables.add(
        TableInfo(
          member: "Golden membership",
          name: faker.person.firstName() + ' ' + faker.person.lastName(),
          mobile: "123456789",
          date: DateTime.now(),
          time: time,
          guests: guests,
          table: i,
          notes: ["Birthday party 🎉.", "Birthday party 🎉."],
          activated: activated,
        ),
      );
    }
    colorList.value = List.filled(tables.length, false);
    for (int i = 0; i < 50; ++i) {
      if (tables[i].time == "4:00 AM")
        tables4AM.add(tables[i]);
      else if (tables[i].time == "5:00 AM")
        tables5AM.add(tables[i]);
      else
        tables6AM.add(tables[i]);
    }
  }

  Future<void> pickDate(BuildContext context, DateTime initialDate) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: initialDate,
    );
    if (date != null) {
      pickedDate.value = date;
      tables[index.value].date = pickedDate.value;
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 2, minute: 4));
    if (t != null) {
      pickedTime.value = t;
      tables[index.value].time = pickedTime.value.format(context).toString();
    }
  }

  @override
  void onInit() {
    getTablesData();
    colorList[0] = true;
    super.onInit();
  }
}
