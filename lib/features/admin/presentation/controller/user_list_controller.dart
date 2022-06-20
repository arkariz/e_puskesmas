import 'package:e_puskesmas/features/userAuth/data/datasources/pasien_sql.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  var userList = List<Map<String, dynamic>>.empty(growable: true).obs;
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

  // [x] Get all pasien Function
  void getAllUser(String jenisPasien) async {
    final users = await PasienSql.getPasienByJenis(jenisPasien);
    userList(users);
  }

  // [x] Delete Pasien Function
  void deleteUser(int idPasien) async {
    await PasienSql.deletePasien(idPasien);
    getAllUser(args['jenis_pasien']);
  }
}
