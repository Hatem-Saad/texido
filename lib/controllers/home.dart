import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/models/member.dart';
import 'package:texido_app/models/table.dart';

class HomeController extends GetxController {
  RxString selected = "Karem Doe".obs;
  RxBool edit = false.obs;
  RxInt guestsNo = 02.obs;
  RxList<bool> category = [false, true, false, false, false, false].obs;
  RxList<bool> invitesChecks = List<bool>().obs;
  RxBool selectAll = false.obs;
  RxList<TableInfo> tables = List<TableInfo>().obs;
  RxList<MemberInfo> members = List<MemberInfo>().obs;
  RxBool cancelling = false.obs;

  Future<void> getTablesData() {
    List activatedTables = [1, 2, 9, 12, 16, 17, 20, 25, 34, 40, 41];
    String image;
    for (int i = 0; i < 50; ++i) {
      if (i < 30)
        image = table;
      else
        image = doubleTable;
      if (activatedTables.contains(i))
        tables.add(
          TableInfo(
            member: "Gold membership",
            name: faker.person.name(),
            mobile: faker.randomGenerator.integer(9).toString(),
            date: faker.date.toString(),
            time: faker.date.time(),
            table: i,
            notes: faker.job.title(),
          ),
        );
      else
        tables.add(
          TableInfo(
            member: "-",
            name: "-",
            mobile: "-",
            date: "-",
            time: "-",
            // table: "-",
            notes: "-",
          ),
        );
    }
  }

  Future<void> getMembersData() {
    for (int i = 0; i < 10; ++i) {
      members.add(
        MemberInfo(
          image:
              "https://dq1eylutsoz4u.cloudfront.net/2016/12/07190305/not-so-nice-nice-guy.jpg",
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

  @override
  void onInit() {
    getTablesData();
    getMembersData();
    super.onInit();
  }
}
