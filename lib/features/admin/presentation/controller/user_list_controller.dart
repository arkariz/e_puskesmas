import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  final userList = List<Map<String, dynamic>>.empty().obs;
  final jenisPasien = "".obs;

  final args = Get.arguments;

  @override
  void onInit() {
    if (args["jenis_pasien"] != null) {
      getAllUser(args["jenis_pasien"]);
      jenisPasien(args["jenis_pasien"]);
    }
    super.onInit();
  }

  void getAllUser(String jenisPasien) async {
    final users = await PasienSql.getPasienByJenis(jenisPasien);
    userList(users);
  }
}
